import Fluent
import Vapor

func routes(_ app: Application) throws {
    
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
