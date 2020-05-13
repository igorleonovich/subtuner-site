import Fluent
import FluentPostgresDriver
import Vapor
import Leaf

public func configure(_ app: Application) throws {
    
    // MARK: - Different Middleware
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    
    // MARK: - Error Middleware
    app.middleware.use(ErrorMiddleware { req, error -> Response in
        var body = "Unknown error"
        if let error = error as? Vapor.AbortError {
            body = "\(error.status)\n\(error.localizedDescription)\n\(error.reason)"
        }
        return .init(status: .internalServerError, version: req.version, headers: ["Content-Type": "text/html; charset=utf-8"], body: .init(string: body))
    })

    
    // MARK: - Custom Middleware
    //    app.middleware.use(ExtendPathMiddleware())
    
    
    // MARK: - Leaf
    
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease

    try routes(app)
}
