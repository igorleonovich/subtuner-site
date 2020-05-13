import Vapor

final class ConsoleViewController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: get)
    }
    
    func get(_ request: Request) -> EventLoopFuture<View> {
        return request.view.render("base-body-console-full")
    }
}
