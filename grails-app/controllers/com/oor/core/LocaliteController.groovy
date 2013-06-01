package com.oor.core
import grails.converters.JSON
import oor.AutoCompleteService
class LocaliteController {

	def AutoCompleteService autoCompleteService;
	
    def index() { }
	
	
	def complist = {
//		render autoCompleteService.complist(params) as JSON
		def data = autoCompleteService.complist(params)
//		def data = [ville:"test"]
		
//		render(contentType:'text/json'){
//			data
//		}
		
		render data as JSON
	}
}
