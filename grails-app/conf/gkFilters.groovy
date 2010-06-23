import com.grailskit.*

class gkFilters {

	def springSecurityService

    def filters = {
        all(controller: '*', action: '*') {
            before = {

							def s = springSecurityService
							def u = s.getPrincipal()
							if(!s?.isLoggedIn())
							{
								session.user = null
								session.security = null
								if(controllerName!=null && controllerName!='logout' && controllerName!='register' && 
									 controllerName!='login' && controllerName!='main'){
									 redirect(controller:"login")
									return false
								}
								return true
							} else {
								session.user = Person.findById(u.id)
								session.security = s
							}
						}
						afterView = {
//							session.user = null
//							session.security = null
						}
				}

		}
}
