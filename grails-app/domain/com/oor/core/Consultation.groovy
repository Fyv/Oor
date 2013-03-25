package com.oor.core

class Consultation {

	String   motif
	String   doleance
	String   traitement
	Date dateCreated
	Date lastUpdated

	static belongsTo = [patient:Patient]

	static mapping = {
		motif type: 'text'
		doleance type: 'text'
		traitement type: 'text'
	}

	static constraints = {
		motif(nullable:false, blank:false)
		doleance (nullable:true, blank:true)
		traitement (nullable:true, blank:true)
		dateCreated(unique:false, nullable:false, display:false)
		lastUpdated(unique:false, nullable:true, display:false)
		patient(display:false)
	}
	
	static List<Consultation> findAllByPatient(Patient patient, Map namedParams){
		Consultation.findAll("From Consultation as c where c.patient=? order by c.dateCreated Desc", [patient], namedParams);
	}
}
