package com.oor.core

import java.text.SimpleDateFormat;

import grails.gorm.DetachedCriteria
import grails.orm.PagedResultList
import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PatientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		def patientInstanceList
		def patientInstanceTotal
        params.max = Math.min(max ?: 20, 100)
		
		if(params.cabinet != null)  {
			def Cabinet = Cabinet.get(params.cabinet.id)
			patientInstanceList = Patient.findAllByCabinet(springSecurityService.currentUser, Cabinet, params)
			patientInstanceTotal = Patient.countByUtilisateurAndCabinet(springSecurityService.currentUser, Cabinet, params)
			
			render(template:'listpatients',
				model: [patientInstanceList: patientInstanceList, 
			cabinetInstanceList: Cabinet.findAllInvolve(springSecurityService.currentUser),
			patientInstanceTotal: patientInstanceTotal])
			
		} else {
			patientInstanceList = Patient.findAllByUtilisateur(springSecurityService.currentUser, params)
			patientInstanceTotal = Patient.countByUtilisateur(springSecurityService.currentUser, params)
		}	
			
        [patientInstanceList: patientInstanceList, 
			cabinetInstanceList: Cabinet.findAllInvolve(springSecurityService.currentUser),
			patientInstanceTotal: patientInstanceTotal]
    }
    
	def search(Integer max, String searchValue) {
		params.max = Math.min(max ?: 10, 100)
		def patientInstanceList
		def patientInstanceTotal
		
		switch (request.method) {
			case 'GET':
			[patientInstanceList: patientInstanceList, 
					patientInstanceTotal: patientInstanceTotal]
			break
			
			case 'POST':
				def searchQuery = "%"+searchValue+"%"
				def criteria = new DetachedCriteria(Patient)
				def query = criteria.build {
					or {
						like("nom".toLowerCase(), searchQuery.toLowerCase())
						like("prenom".toLowerCase(), searchQuery.toLowerCase())
					}
					eq("utilisateur", springSecurityService.currentUser)
				}
				patientInstanceList = query.list(params)
				patientInstanceTotal = query.count()
				
//				render(template:'listpatients',
//				model:
				[patientInstanceList: patientInstanceList, 
					patientInstanceTotal: patientInstanceTotal]
//				)
			break
		}
	}

    def create() {
        [patientInstance: new Patient(params)]
    }

    def save() {
        def patientInstance = new Patient(params)
		
		patientInstance.setDateCreated(new Date())
		patientInstance.setDateNaissance(computeDate(params))
		patientInstance.localite = Localite.get(params.localiteId)
		
		assignUser(patientInstance)
		
        if (!patientInstance.save(flush: true)) {
            render(view: "create", model: [patientInstance: patientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
        redirect(action: "edit", id: patientInstance.id)
    }

    def show(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance, localiteInstance: patientInstance.localite]
    }

    def edit(Long id, Integer max) {
		params.max = Math.min(max ?: 5, 100)
		
		def patientInstance = Patient.get(id)
		def consultationInstanceList = Consultation.findAllByPatient(patientInstance, params)
		def cabinetInstanceList = Cabinet.findAllInvolve(springSecurityService.currentUser)
		
		
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance, 
			consultationInstanceList: consultationInstanceList, 
			consultationInstanceTotal: Consultation.countByPatient(patientInstance, params),
			localiteInstance: patientInstance.localite, 
			cabinetInstanceList: cabinetInstanceList]
    }

    def update(Long id, Long version) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (patientInstance.version > version) {
                patientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'patient.label', default: 'Patient')] as Object[],
                          "Another user has updated this Patient while you were editing")
				render( contentType:'text/plain', text: '<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>Another user has updated this Patient while you were editing</div>')
				
                return
            }
        }

        patientInstance.properties = params
		patientInstance.setDateNaissance(computeDate(params))
		patientInstance.localite = Localite.get(params.localiteId)
		patientInstance.cabinet = Cabinet.get(params.cab)

        if (patientInstance.save(flush: true)) {
			render(template:'formremote', 
				model: [patientInstance: patientInstance, 
					localiteInstance: patientInstance.localite, 
					cabinetInstanceList: Cabinet.findAllInvolve(springSecurityService.currentUser),
					isUpdated: true])
        } else {
			render(ContentType:'text/plain', text: patientInstance.errors)
        }
    }
	
    def delete(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        try {
            patientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "show", id: id)
        }
    }
	
	/**
	 * 
	 * @param patientInstance
	 * @return
	 */
	private assignUser(Patient patientInstance) {
		def user = springSecurityService.currentUser
		patientInstance.setUtilisateur(user)
	}
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	private Date computeDate(Map<Object, Object> params){
		String naissance = params.datenaissance
		SimpleDateFormat df1 = new SimpleDateFormat("dd/MM/yyy")
		
		if(naissance.equals(null) || naissance.isEmpty()){
			return new Date()
		} else {
			Date dateNaissance = df1.parse(naissance)
			return dateNaissance
		}
	}

}
