package bikeapp


//CLASE CREADA DE FORMA AUTOMATICA POR SPRING, PARA EL MANEJO DE USUARIOS
//PARA CONOCER MAS DETALLES PUEDEN REMITIRSE A LA DOCUMENTACION DE SPRING SECURITY CORE, EN OTROS ARCHIVOS 
//ME VOY A REMITIR A SPRING SECURITY CORE SOLAMENTE COMO SPRING SIN PERDIDA DE GENERALIDAD
//http://grails-plugins.github.io/grails-spring-security-core/v2/guide/logoutHandlers.html

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class SecUsuario implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	SecUsuario(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<SecRole> getAuthorities() {
		SecUsuarioSecRole.findAllBySecUsuario(this)*.secRole
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}
}
