package com.oor.core

import com.sun.istack.internal.Nullable;

class Localite {

	Integer cp
	String ville
	
    static constraints = {
		cp(nullable:false)
		ville(nullable:false)
    }
	
	
	static List<Localite> findAllLikeVille(String ville){
		Localite.findAll("from Localite as l where l.ville like :villeName",
			[villeName: ville],[max:10]
			)
	}
}
