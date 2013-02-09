class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/about"(view:"/pages/about")
		"500"(view:'/error')
	}
}
