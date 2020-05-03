import Vapor
import Fluent

//struct UserModelBearerAuthenticator: BearerAuthenticator {
//
//    typealias User = UserModel
//
//    func authenticate(bearer: BearerAuthorization, for request: Request) -> EventLoopFuture<Void> {
//        // perform auth using the bearer.token value here...
//    }
//}
//
//extension UserTokenModel: ModelAuthenticatable {
//   static let valueKey = \UserTokenModel.$value
//   static let userKey = \UserTokenModel.$user
//
//   var isValid: Bool {
//       true // you can check expiration or anything else...
//   }
//}
