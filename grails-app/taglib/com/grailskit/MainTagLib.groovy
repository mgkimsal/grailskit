package com.grailskit
import com.grailskit.*

class MainTagLib {

	def springSecurityService

	static namespace='gk'

	def login = { attr->
		if(springSecurityService.isLoggedIn())
		{
			out << render(template:"/shared/loggedin")
		} else {
			out << render(template:"/shared/notloggedin")
		}


	}

}
