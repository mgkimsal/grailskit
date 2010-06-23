package com.grailskit
import com.grailskit.*

class RegisterController {


	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def emailConfirmationService
	def springSecurityService

	def index = { }
	
	def register = { 
		def user = new Person(params)
		user.password = springSecurityService.encodePassword(params.password)
		user.accountConfirmed = false
		user.enabled = false
		
		if (user.save(flush: true)) {
			if( grailsApplication.config.grailskit.emailConfirm) { 
				emailConfirmationService.sendConfirmation(
					user.email, "Please confirm your account", 
					[from: grailsApplication.config.grailskit.emailConfirmFrom], user.id.toString()
					)
					redirect(action: "confirm")
				} else {
					user.enabled = true
					user.accountConfirmed = true
					user.accountExpired = false 
					user.passwordExpired = false
					user.accountLocked = false

					user.save()
					flash.message = "Your account was created.  Please log in"
					redirect(controller: "login", action:'auth')
				}
		}
		else {
		    render(view: "index", model: [user: user])
		}
	}

	def confirm = 
	{

	}

	
}
