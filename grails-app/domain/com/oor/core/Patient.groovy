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
	String grossesse
	Genre sexe
	Civilite civilite
	Localite localite
	
	Date dateCreated
	Date lastUpdated
	Date dateNaissance
	
	static hasMany = [consultations:Consultation]
	
	static belongsTo = [utilisateur:Utilisateur, cabinet:Cabinet]
	
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
		grossesse type: 'text'
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
		cabinet(display:false, nullable:true)
		posturologie(nullable:true)
		traitement(nullable:true)
		grossesse(nullable:true)
		localite(nullable:true)
    }
	
	static List<Patient> findAllByCabinet(Utilisateur utilisateur, Cabinet cabinet, Map namedParams){
		Patient.findAll("from Patient as p where p.utilisateur= :u And p.cabinet= :cabinet order by p.nom Asc",
			[u: utilisateur, cabinet: cabinet], namedParams)
	}
	
	static List<Patient> findAllByUtilisateur(Utilisateur utilisateur, Map namedParams){
		Patient.findAll("from Patient as p where p.utilisateur= :u  order by p.nom Asc", 
			[u: utilisateur],
			namedParams)
		
	}
	
	static List<Patient> findAllLikeByUtilisateur(Utilisateur utilisateur, String searchValue, Map namedParams){
		Patient.findAll("from Patient as p where (p.nom like :search or p.prenom like :search) And  p.utilisateur= :user  order by p.nom Asc",
						[search: searchValue, user: utilisateur], namedParams)
	}
}
