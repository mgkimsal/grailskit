package com.grailskit

class Person {

	String name
	String username
	String password
	String email 
	boolean enabled = false
	boolean accountConfirmed = false
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email(email:true, nullable:false, unique:true)
		name(nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		PersonRole.findAllByPerson(this).collect { it.role } as Set
	}
}
