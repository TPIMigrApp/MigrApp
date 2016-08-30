class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/algoMal')
        //"500"(view:'/error_505')
        "404"(view:'/error')
        "403"(view:'/error')
        "400"(view:'/algoMal') 
        "/logoutexit"(view:'j_spring_security_logout')
	}
}
