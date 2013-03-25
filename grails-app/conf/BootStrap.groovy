import com.oor.security.Role
import com.oor.security.Utilisateur
import com.oor.security.UtilisateurRole;

class BootStrap {

    def init = { servletContext ->
		
//		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
//		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
//  
//		def testUser = new Utilisateur(
//			email: 'test@test.com', 
//			username: 'me', 
//			enabled: true, 
//			password: 'password', 
//			dateCreated: new Date())
//		testUser.save(flush: false)
//		def errors = testUser.errors.toString()
//  
//		UtilisateurRole.create testUser, adminRole, true
//  
//		assert Utilisateur.count() == 1
//		assert Role.count() == 2
//		assert UtilisateurRole.count() == 1
		
    }
    def destroy = {
    }
}
