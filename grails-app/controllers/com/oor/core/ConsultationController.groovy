package com.oor.core

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ConsultationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
  		params.max = Math.min(max ?: 10, 100)
		def patientInstance = Patient.get(params.patientId)
		def consultationInstanceList = Consultation.findAllByPatient(patientInstance, params)
		
		[consultationInstanceList: consultationInstanceList, consultationInstanceTotal: Consultation.countByPatient(patientInstance, params)]
	 }
	
    def create() {
        [consultationInstance: new Consultation(params)]
    }

    def save() {
		def patientInstance = Patient.get(params.patientId)
        def consultationInstance = new Consultation(params)
		
		consultationInstance.setDateCreated(new Date())
		consultationInstance.setPatient(Patient.get(params.patientId))
		
		if (consultationInstance.save(flush: true)) {
			render(template:'formremote',
				model: [patientInstance: patientInstance, isUpdated: true])
		} else {
			render(ContentType:'text/plain', text: consultationInstance.errors)
		}
    }

    def show(Long id) {
        def consultationInstance = Consultation.get(id)
        if (!consultationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "list")
            return
        }

        [consultationInstance: consultationInstance]
    }

    def edit(Long id) {
        def consultationInstance = Consultation.get(id)
		def patientInstance = Patient.get(params.patientId)
		
        if (!consultationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "list")
            return
        }
		render(template:'editformremote',
			model: [patientInstance: patientInstance, consultationInstance: consultationInstance])
    }

    def update(Long id, Long version) {
		def patientInstance = Patient.get(params.patientId)
        def consultationInstance = Consultation.get(id)
        if (!consultationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (consultationInstance.version > version) {
                consultationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'consultation.label', default: 'Consultation')] as Object[],
                          "Another user has updated this Consultation while you were editing")
                render(view: "edit", model: [consultationInstance: consultationInstance])
                return
            }
        }

        consultationInstance.properties = params
		
		if (consultationInstance.save(flush: true)) {
			render(template:'formremote',
				model: [patientInstance: patientInstance, isUpdated: true])
		} else {
			render(ContentType:'text/plain', text: consultationInstance.errors)
		}
    }

    def delete(Long id) {
        def consultationInstance = Consultation.get(id)
        if (!consultationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "list")
            return
        }

        try {
            consultationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'consultation.label', default: 'Consultation'), id])
            redirect(action: "show", id: id)
        }
    }
	
	//TODO find a way to update that damn fucking list
	def refreshConsultations() {
		params.max = 5
		def patientInstance = Patient.get(params.patientId)
		def consultationInstanceList = Consultation.findAllByPatient(patientInstance, params)
		
		render(template:'collapselist',
			model: [patientInstance: patientInstance, consultationInstanceList: consultationInstanceList, consultationInstanceTotal: Consultation.countByPatient(patientInstance, params)])
	}
}
