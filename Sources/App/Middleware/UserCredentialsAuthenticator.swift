import Vapor
import Fluent

struct UserCredentialsAuthenticator: CredentialsAuthenticator {
    
    struct Credentials: Content {
        let email: String
        let password: String
    }

    func authenticate(credentials: Credentials, for req: Request) -> EventLoopFuture<Void> {
        User.query(on: req.db)
            .filter(\.$email == credentials.email)
            .first()
            .map {
                do {
                    if let user = $0, try Bcrypt.verify(credentials.password, created: user.passwordHash) {
                        req.auth.login(user)
                    }
                }
                catch {
                    print(error)
                }
            }
    }
}
