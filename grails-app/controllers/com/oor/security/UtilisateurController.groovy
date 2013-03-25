package com.oor.security

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

class UtilisateurController {
	
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [utilisateurInstanceList: Utilisateur.list(params), utilisateurInstanceTotal: Utilisateur.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [utilisateurInstance: new Utilisateur(params), roleInstanceList: Role.findAll()]
    }
	
	@Secured(['ROLE_ADMIN'])
    def save() {
		def roleInstanceList = Role.findAll()
        def utilisateurInstance = new Utilisateur(params)
		utilisateurInstance.setDateCreated(new Date())
		
		def roleInstance = Role.get(params.authority)
		
        if (!utilisateurInstance.save(flush: true)) {
            render(view: "create", model: [utilisateurInstance: utilisateurInstance])
            return
        }
		
		UtilisateurRole.create(utilisateurInstance, roleInstance)

        flash.message = message(code: 'default.created.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateurInstance.id])
        redirect(action: "show", id: utilisateurInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def utilisateurInstance = Utilisateur.get(id)
        if (!utilisateurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
            return
        }

        [utilisateurInstance: utilisateurInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def utilisateurInstance = Utilisateur.get(id)
		def roleInstanceList = Role.findAll()
        if (!utilisateurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
            return
        }

        [utilisateurInstance: utilisateurInstance, roleInstanceList: roleInstanceList]
    }

	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def utilisateurInstance = Utilisateur.get(id)
		
		def roleInstance = Role.get(params.authority)

		def userRoleInstance = UtilisateurRole.getByUtilisateur(utilisateurInstance.id)

		if(userRoleInstance) {
			userRoleInstance.delete(flush: true)
		}

		UtilisateurRole.create(utilisateurInstance, roleInstance)
		
        if (!utilisateurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (utilisateurInstance.version > version) {
                utilisateurInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'utilisateur.label', default: 'Utilisateur')] as Object[],
                          "Another user has updated this Utilisateur while you were editing")
                render(view: "edit", model: [utilisateurInstance: utilisateurInstance])
                return
            }
        }

        utilisateurInstance.properties = params

        if (!utilisateurInstance.save(flush: true)) {
            render(view: "edit", model: [utilisateurInstance: utilisateurInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateurInstance.id])
        redirect(action: "show", id: utilisateurInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def utilisateurInstance = Utilisateur.get(id)
		
		def userRoleInstance = UtilisateurRole.getByUtilisateur(utilisateurInstance.id)
		
        if (!utilisateurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
            return
        }

        try {
            utilisateurInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "show", id: id)
        }
    }
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def preferences(Long id, Long version) {
		def utilisateurInstance
		
		switch (request.method) {
			case 'GET':
			utilisateurInstance = springSecurityService.currentUser
				def roleInstanceList = Role.findAll()
				if (!utilisateurInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
					redirect(action: "list")
					return
				}
		
				[utilisateurInstance: utilisateurInstance, roleInstanceList: roleInstanceList]
				break
			
			case 'POST':
			utilisateurInstance = Utilisateur.get(id)
				if (!utilisateurInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateurInstance.label', default: 'Utilisateur'), id])
					redirect(action: "list")
					return
				}
		
				if (version != null) {
					if (utilisateurInstance.version > version) {
						utilisateurInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
								  [message(code: 'utilisateur.label', default: 'Patient')] as Object[],
								  "Another user has updated this Utilisateur while you were editing")
						render( contentType:'text/plain', text: '<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>Another user has updated this Utilisateur while you were editing</div>')
						
						return
					}
				}
		
				utilisateurInstance.properties = params
				
						if (utilisateurInstance.save(flush: true)) {
							render(template:'formremote',
								model: [utilisateurInstance: utilisateurInstance, isUpdated: true])
						} else {
							render(ContentType:'text/plain', text: utilisateurInstance.errors)
						}
				break
		}
	}
}
