package bikeapp

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class SecUsuarioSecRole implements Serializable {

	private static final long serialVersionUID = 1

	SecUsuario secUsuario
	SecRole secRole

	SecUsuarioSecRole(SecUsuario u, SecRole r) {
		this()
		secUsuario = u
		secRole = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof SecUsuarioSecRole)) {
			return false
		}

		other.secUsuario?.id == secUsuario?.id && other.secRole?.id == secRole?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (secUsuario) builder.append(secUsuario.id)
		if (secRole) builder.append(secRole.id)
		builder.toHashCode()
	}

	static SecUsuarioSecRole get(long secUsuarioId, long secRoleId) {
		criteriaFor(secUsuarioId, secRoleId).get()
	}

	static boolean exists(long secUsuarioId, long secRoleId) {
		criteriaFor(secUsuarioId, secRoleId).count()
	}

	private static DetachedCriteria criteriaFor(long secUsuarioId, long secRoleId) {
		SecUsuarioSecRole.where {
			secUsuario == SecUsuario.load(secUsuarioId) &&
			secRole == SecRole.load(secRoleId)
		}
	}

	static SecUsuarioSecRole create(SecUsuario secUsuario, SecRole secRole, boolean flush = false) {
		def instance = new SecUsuarioSecRole(secUsuario: secUsuario, secRole: secRole)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(SecUsuario u, SecRole r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = SecUsuarioSecRole.where { secUsuario == u && secRole == r }.deleteAll()

		if (flush) { SecUsuarioSecRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(SecUsuario u, boolean flush = false) {
		if (u == null) return

		SecUsuarioSecRole.where { secUsuario == u }.deleteAll()

		if (flush) { SecUsuarioSecRole.withSession { it.flush() } }
	}

	static void removeAll(SecRole r, boolean flush = false) {
		if (r == null) return

		SecUsuarioSecRole.where { secRole == r }.deleteAll()

		if (flush) { SecUsuarioSecRole.withSession { it.flush() } }
	}

	static constraints = {
		secRole validator: { SecRole r, SecUsuarioSecRole ur ->
			if (ur.secUsuario == null || ur.secUsuario.id == null) return
			boolean existing = false
			SecUsuarioSecRole.withNewSession {
				existing = SecUsuarioSecRole.exists(ur.secUsuario.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['secUsuario', 'secRole']
		version false
	}
}
