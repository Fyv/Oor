package com.oor.core.domain.enums

public enum Civilite {

	MONSIEUR("M."),
	MADAME("Mme"), 
	MLLE("Mlle")
	
	private final String value;
	
	 Civilite(String value){
	  this.value = value;
	 }

	 String toString() {
	  value;
	 }

	 String getKey() {
	  name();
	 }

	 static list(){
	  [MONSIEUR, MADAME, MLLE]
	 }
}
