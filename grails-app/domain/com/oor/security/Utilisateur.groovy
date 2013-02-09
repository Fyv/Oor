package com.oor.security

import java.util.Date;

class Utilisateur {

	transient springSecurityService

	String nom
	String prenom
	String username
	String password
	String email;
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	Date dateCreated
	Date lastUpdated

	static constraints = {
		username blank: false, unique: true
		nom nullable:true
		prenom nullable:true
		email email:true
		password blank: false
		dateCreated(unique:false, nullable:false, display:false)
		lastUpdated(unique:false, nullable:true, display:false)
	
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UtilisateurRole.findAllByUtilisateur(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
