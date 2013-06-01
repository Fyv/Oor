package com.oor.core

import com.oor.security.Utilisateur;

class Cabinet {
	String nom
	String adresse
	Localite localite
	
	static hasMany = [therapeute:Utilisateur]
	
	static belongsTo = [admin:Utilisateur]
	
    static constraints = {
		nom(blank:false)
		admin(nullable:false)
		localite(nullable:true)
		admin( display:false)
		therapeute( display:false) 
    }
	
	static List<Cabinet> findAllInvolve(Utilisateur utilisateur){
		Cabinet.findAll("From Cabinet as c where c.admin=? ", 
			[utilisateur]).toList()
	}
}
