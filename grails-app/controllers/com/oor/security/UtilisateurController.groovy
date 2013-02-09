package com.oor.security

import org.springframework.dao.DataIntegrityViolationException

class UtilisateurController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [utilisateurInstanceList: Utilisateur.list(params), utilisateurInstanceTotal: Utilisateur.count()]
    }

    def create() {
        [utilisateurInstance: new Utilisateur(params), roleInstanceList: Role.findAll()]
    }

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

    def show(Long id) {
        def utilisateurInstance = Utilisateur.get(id)
        if (!utilisateurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), id])
            redirect(action: "list")
            return
        }

        [utilisateurInstance: utilisateurInstance]
    }

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
}
