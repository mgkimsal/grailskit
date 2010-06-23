import org.grails.plugins.settings.*
import com.grailskit.*

class BootStrap {

	def emailConfirmationService
	def springSecurityService

	def init = { servletContext ->

			addDemoAccounts()

			emailConfirmationService.onConfirmation = { email, uid ->
				log.info("User with id $uid has confirmed their email address $email")
				def u = Person.get(uid)
				u.accountConfirmed= true
				u.enabled= true
				u.save()
				// now do something…
				// Then return a map which will redirect the user to this destination
				return {
					flash.message = "Your account is now activated.  Please log in!"
					redirect(controller:'login', action:'auth')
					}
			}
			emailConfirmationService.onInvalid = { uid -> 
			log.warn("User with id $uid failed to confirm email address after 30 days")
			}
			emailConfirmationService.onTimeout = { email, uid -> 
			log.warn("User with id $uid failed to confirm email address after 30 days")
			}



	}

	def destroy = {
	}


	def addDemoAccounts()
	{
		def roleAdmin = new Role(authority:"ADMIN").save()
		def roleEditor = new Role(authority:"EDITOR").save()
		def pass = springSecurityService.encodePassword('password')
		def u1 = new Person(name:"Admin User",username:"admin",password:pass,email:"user1@yahoo.com",
					enabled:true, accountConfirmed:true, accountExpired:false, passworExpired:false, accountLocked:false).save()
		def u2 = new Person(name:"Editor User",username:"editor",password:pass,email:"user2@yahoo.com",
					enabled:true, accountConfirmed:true, accountExpired:false, passworExpired:false, accountLocked:false).save()
		PersonRole.create u1, roleAdmin
		PersonRole.create u2, roleEditor
	}

} 
