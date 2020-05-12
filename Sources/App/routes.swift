import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // MARK: - Unprotected
    
    app.get { req in
        return req.view.render("base-body-home")
    }
    
    app.get("signup") { req in
        return req.view.render("base-body-sign-up")
    }

//    app.post("users") { req -> EventLoopFuture<User> in
//        try User.Create.validate(req)
//        let create = try req.content.decode(User.Create.self)
//        guard create.password == create.confirmPassword else {
//            throw Abort(.badRequest, reason: "Passwords did not match")
//        }
//        let user = try User(
//            email: create.email,
//            passwordHash: Bcrypt.hash(create.password)
//        )
//        return user.save(on: req.db)
//            .map { user }
//    }
    
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
    
    // MARK: - Temp
    
//    app.get("hello") { req -> EventLoopFuture<String> in
//        /// Create a new void promise
//        let promise = req.eventLoop.makePromise(of: Void.self)
//
//        /// Dispatch some work to happen on a background thread
//        req.application.threadPool.submit { _ in
//            /// Puts the background thread to sleep
//            /// This will not affect any of the event loops
//            sleep(5)
//
//            /// When the "blocking work" has completed,
//            /// complete the promise and its associated future.
//            promise.succeed(())
//        }
//
//        /// Wait for the future to be completed,
//        /// then transform the result to a simple String
//        return promise.futureResult.transform(to: "Hello, world!")
//    }
//
//    app.get("galaxies") { req in
//        return Galaxy.query(on: req.db).all()
//    }
//
//    let todoController = TodoController()
//    app.get("todos", use: todoController.index)
//    app.post("todos", use: todoController.create)
//    app.delete("todos", ":todoID", use: todoController.delete)
}
