import Vapor
import Fluent

// MARK: - Basic Auth

//extension UserModel: ModelAuthenticatable {
//    static let usernameKey = \UserModel.$email
//    static let passwordHashKey = \UserModel.$password
//
//    func verify(password: String) throws -> Bool {
//        try Bcrypt.verify(password, created: self.password)
//    }
//}
