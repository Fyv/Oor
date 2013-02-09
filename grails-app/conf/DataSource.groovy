dataSource {
	//    pooled = true
	//    driverClassName = "org.h2.Driver"
	//    username = "sa"
	//    password = ""

	pooled = true
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
	development {
		dataSource {
			//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
			//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			driverClassName = "org.postgresql.Driver"
			dialect = 'org.hibernate.dialect.PostgreSQLDialect'
			username = "postgres"
			password = "beebop01"
			driverClassName = "org.postgresql.Driver"
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql:oor"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
		}
	}
	production {
		dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			dbCreate = "update"
			url = "jdbc:mysql://osteoonrails.fyv.cloudbees.net:3306/oor"
			username = "oor"
			password = "beebop01"
		}
	}
}
