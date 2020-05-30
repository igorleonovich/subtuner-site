import Vapor

final class DoorsViewController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: get)
    }
    
    func get(_ request: Request) -> EventLoopFuture<View> {
        return request.view.render("base-body-doors-full", ["pageTitle": "D O O R S"])
    }
}
