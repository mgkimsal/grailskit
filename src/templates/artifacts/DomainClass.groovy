@artifact.package@class @artifact.name@ {

	String name

	String toString() { 
		name
	}

	Date dateCreated
	Date lastUpdated

	static constraints = {
		lastUpdated(nullable:true, display:false)
		dateCreated(display:false)
	}

}
