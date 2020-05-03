import Fluent
import Vapor

func routes(_ app: Application) throws {
    
//    let protected = app.grouped(
////        UserModelBasicAuthenticator(),
//        UserModel.authenticator(),
//        UserModel.guardMiddleware())
//    protected.get("me") { req -> String in
//        try req.auth.require(UserModel.self).email
//    }
    
    app.post("users") { req -> EventLoopFuture<User> in
        try User.Create.validate(req)
        let create = try req.content.decode(User.Create.self)
        guard create.password == create.confirmPassword else {
            throw Abort(.badRequest, reason: "Passwords did not match")
        }
        let user = try User(
            email: create.email,
            passwordHash: Bcrypt.hash(create.password)
        )
        return user.save(on: req.db)
            .map { user }
    }
    
    app.get("hello") { req -> EventLoopFuture<String> in
        /// Create a new void promise
        let promise = req.eventLoop.makePromise(of: Void.self)

        /// Dispatch some work to happen on a background thread
        req.application.threadPool.submit { _ in
            /// Puts the background thread to sleep
            /// This will not affect any of the event loops
            sleep(5)

            /// When the "blocking work" has completed,
            /// complete the promise and its associated future.
            promise.succeed(())
        }

        /// Wait for the future to be completed,
        /// then transform the result to a simple String
        return promise.futureResult.transform(to: "Hello, world!")
    }
    
    app.get { req in
        return req.view.render("home")
    }
    
    app.get("galaxies") { req in
        return Galaxy.query(on: req.db).all()
    }

    let todoController = TodoController()
    app.get("todos", use: todoController.index)
    app.post("todos", use: todoController.create)
    app.delete("todos", ":todoID", use: todoController.delete)
}
