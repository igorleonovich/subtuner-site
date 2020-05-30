import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: - Unprotected
    
    app.get { req in
        return req.view.render("base-body-home",  ["pageTitle": "S U B T U N E R"])
    }
    
    app.get("signup") { req in
        return req.view.render("base-body-sign-up", ["pageTitle": "S U B T U N E R"])
    }
    
    app.get("login") { req in
        return req.view.render("base-body-log-in", ["pageTitle": "S U B T U N E R"])
    }
    
    let doors = app.grouped("doors")
    let protectedDoors = doors.grouped(JWTCookieMiddleware())
    try protectedDoors.register(collection: DoorsViewController())
    
    // MARK: - Password Protected
    
//    let passwordProtected = app.grouped(
//        User.authenticator(),
//        User.guardMiddleware()
//    )
//
//    passwordProtected.post("login") { req -> EventLoopFuture<UserToken> in
//        let user = try req.auth.require(User.self)
//        let token = try user.generateToken()
//        return token.save(on: req.db)
//            .map { token }
//    }
    
    // MARK: - Token Protected
    
//    let tokenProtected = app.grouped(
//        UserToken.authenticator(),
//        User.guardMiddleware()
//    )
//
//    tokenProtected.get("me") { req -> User in
//        try req.auth.require(User.self)
//    }
    
    // MARK: - Session
    
//    let sessions = app.grouped(app.sessions.middleware)
    
    
//    let session = app.grouped(
////            app.sessions.middleware,
//        SessionsMiddleware(session: app.sessions.driver),
////            User.sessionAuthenticator(),
//            UserSessionAuthenticator(),
//            UserCredentialsAuthenticator()
//    )
    
//    session.get { req -> Response in
//        guard let user = req.auth.get(User.self) else {
//            return req.redirect(to: "/sign-in")
//        }
//
//        let body = """
//        <b>\(user.email)</b> is logged in <a href="/logout">Logout</a>
//        """
//
//        return .init(status: .ok,
//              version: req.version,
//              headers: HTTPHeaders.init([("Content-Type", "text/html; charset=UTF-8")]),
//              body: .init(string: body))
//    }
//
//    session.get("sign-in") { req -> Response in
//        let body = """
//        <form action="/sign-in" method="post">
//            <label for="email">Email:</label>
//            <input type="email" id="email" name="email" value="">
//
//            <label for="password">Password:</label>
//            <input type="password" id="password" name="password" value="">
//
//            <input type="submit" value="Submit">
//        </form>
//        """
//
//        return .init(status: .ok,
//              version: req.version,
//              headers: HTTPHeaders.init([("Content-Type", "text/html; charset=UTF-8")]),
//              body: .init(string: body))
//    }
//
//    session.post("sign-in") { req -> Response in
//        guard let user = req.auth.get(User.self) else {
//            throw Abort(.unauthorized)
//        }
//        req.session.authenticate(user)
//        return req.redirect(to: "/")
//    }
//
//    session.get("logout") { req -> Response in
//        req.auth.logout(User.self)
//        req.session.unauthenticate(User.self)
//        return req.redirect(to: "/")
//    }

}
