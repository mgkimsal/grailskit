package com.grailskit
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		// TODO  put any pre-logout code here
//		session.user = null
//		redirect(controller:"main")
		redirect (uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl) // '/j_spring_security_logout'
	}
}
