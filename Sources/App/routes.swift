import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.routes.get(.catchall) { req -> Response in
        .init(status: .notFound,
        version: req.version,
        headers: ["Content-Type": "text/html; charset=utf-8"],
        body: .init(string: "<h3>404 Not Found</h3>"))
    }
    
    app.get { req in
        return req.view.render("home")
    }

    let todoController = TodoController()
    app.get("todos", use: todoController.index)
    app.post("todos", use: todoController.create)
    app.delete("todos", ":todoID", use: todoController.delete)
}
