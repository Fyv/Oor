package oor

import com.oor.core.Localite

class AutoCompleteService {

    def serviceMethod() {

    }
	
	def complist(params){
		
	def clist = Localite.findAllLikeVille(params.ville.toUpperCase()+"%") // execute  to the get the list of companies
	
	def companySelectList = [] // to add each company details
		clist.each {
		 def localiteMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
		 localiteMap.put("id", it.id)
		 localiteMap.put("ville", it.ville)
		 localiteMap.put("cp", it.cp)
		 companySelectList.add(localiteMap) // add to the arraylist
	  }
		return companySelectList
	 }
}
