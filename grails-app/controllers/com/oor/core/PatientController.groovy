package com.oor.core

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
        params.max = Math.min(max ?: 2, 100)
		
		def patientInstanceList = Patient.findAllByUtilisateur(springSecurityService.currentUser, params)
		
        [patientInstanceList: patientInstanceList, patientInstanceTotal: Patient.countByUtilisateur(springSecurityService.currentUser, params)]
    }

    def create() {
        [patientInstance: new Patient(params)]
    }

    def save() {
        def patientInstance = new Patient(params)
		
		patientInstance.setDateCreated(new Date())
		
		assignUser(patientInstance)
		
        if (!patientInstance.save(flush: true)) {
            render(view: "create", model: [patientInstance: patientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'patient.label', default: 'Patient'), patientInstance.id])
       redirect(action: "list")
    }

    def show(Long id) {
        def patientInstance = Patient.get(id)
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance]
    }

    def edit(Long id, Integer max) {
		params.max = Math.min(max ?: 5, 100)
		
		def patientInstance = Patient.get(id)
		def consultationInstanceList = Consultation.findAllByPatient(patientInstance, params)
		
        if (!patientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'patient.label', default: 'Patient'), id])
            redirect(action: "list")
            return
        }

        [patientInstance: patientInstance, consultationInstanceList: consultationInstanceList, consultationInstanceTotal: Consultation.countByPatient(patientInstance, params)]
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

        if (patientInstance.save(flush: true)) {
			render(template:'formremote', 
				model: [patientInstance: patientInstance, isUpdated: true])
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
}
