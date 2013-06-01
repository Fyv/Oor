package com.oor.core

import grails.converters.JSON
import oor.AutoCompleteService;

import org.springframework.dao.DataIntegrityViolationException

class CabinetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
	def AutoCompleteService autoCompleteService;
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cabinetInstanceList: Cabinet.list(params), cabinetInstanceTotal: Cabinet.count()]
    }

    def create() {
        [cabinetInstance: new Cabinet(params)]
    }

    def save() {
		def user = springSecurityService.currentUser
		
		if(Cabinet.findAllInvolve(user).size() >= 2){
			render(ContentType:'text/plain', text: "Limite dépassée")
			return
		}
		
        def cabinetInstance = new Cabinet(params)
		cabinetInstance.localite = Localite.get(params.localiteId)
		cabinetInstance.admin = user
		
		
		if(cabinetInstance.save(flush: true)){
			render(template:'formremote',
				model: [
//					cabinetInstance: cabinetInstance, 
					utilisateurInstance: springSecurityService.currentUser, 
//					localiteInstance: cabinetInstance.localite, 
					cabinetInstanceAll: Cabinet.findAllInvolve(springSecurityService.currentUser),
					isUpdated: true]
				)
		} else {
			render(ContentType:'text/plain', text: cabinetInstance.errors)
		}
    }

    def show(Long id) {
        def cabinetInstance = Cabinet.get(id)
        if (!cabinetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "list")
            return
        }

		render(template:'formremote',
				model: [
					cabinetInstance: cabinetInstance, 
					utilisateurInstance: springSecurityService.currentUser, 
					localiteInstance: cabinetInstance.localite, 
					cabinetInstanceAll: Cabinet.findAllInvolve(springSecurityService.currentUser)]
				)
    }

    def edit(Long id) {
        def cabinetInstance = Cabinet.get(id)
        if (!cabinetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "list")
            return
        }

        [cabinetInstance: cabinetInstance]
    }

    def update(Long id, Long version) {
        def cabinetInstance = Cabinet.get(id)
        if (!cabinetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cabinetInstance.version > version) {
                cabinetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cabinet.label', default: 'Cabinet')] as Object[],
                          "Another user has updated this Cabinet while you were editing")
                render(view: "edit", model: [cabinetInstance: cabinetInstance])
                return
            }
        }

        cabinetInstance.properties = params
		cabinetInstance.localite = Localite.get(params.localiteId)
		cabinetInstance.admin = springSecurityService.currentUser

        if (cabinetInstance.save(flush: true)) {
           render(template:'formremote',
				model: [
					utilisateurInstance: springSecurityService.currentUser, 
					cabinetInstanceAll: Cabinet.findAllInvolve(springSecurityService.currentUser),
					isUpdated: true]
				)
            return
        }
    }

    def delete(Long id) {
        def cabinetInstance = Cabinet.get(id)
        if (!cabinetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "list")
            return
        }

        try {
            cabinetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cabinet.label', default: 'Cabinet'), id])
            redirect(action: "show", id: id)
        }
    }
}
