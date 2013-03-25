package com.oor.core

import java.util.List;
import java.util.Map;

import com.oor.core.domain.enums.Civilite
import com.oor.core.domain.enums.Genre
import com.oor.security.Utilisateur

class Patient {
	String nom
	String prenom
	String adresse
	String adresseSuite
	String telFixe
	String telPortable
	String email
	String profession
	String loisir
	String remarque
	String medical
	String chirurgical
	String traumatisme
//	String famille
	String posturologie
	String traitement
	String naissance
	String complementaire
	Genre sexe
	Civilite civilite
	
	Date dateCreated
	Date lastUpdated
	Date dateNaissance
	
	static hasMany = [consultations:Consultation]
	
	static belongsTo = [utilisateur:Utilisateur]
	
	static mapping = {
		consultations cascade: 'all-delete-orphan'
		profession type: 'text'
		loisir type: 'text'
		remarque type: 'text'
		medical type: 'text'
		chirurgical type: 'text'
		traumatisme type: 'text'
//		famille type: 'text'
		posturologie type: 'text'
		naissance type: 'text'
		complementaire type: 'text'
		traitement type: 'text'
	}
	
    static constraints = {
		civilite(blank:false)
		nom(blank:false)
		prenom(blank:false)
		adresse(blank:false)
		adresseSuite()
		email()
		telFixe()
		telPortable()
		dateNaissance()
		sexe(blank:false)
		dateCreated(unique:false, nullable:false, display:false)
		lastUpdated(unique:false, nullable:true, display:false)
		consultations(display:false)
		posturologie(nullable:true)
		traitement(nullable:true)
    }
	
	static List<Patient> findAllByUtilisateur(Utilisateur utilisateur, Map namedParams){
		Patient.findAll("from Patient as p where p.utilisateur=? order by p.dateCreated Asc",
			[utilisateur], namedParams)
	}
	
}
