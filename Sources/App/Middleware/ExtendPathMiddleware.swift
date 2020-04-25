import Vapor

final class ExtendPathMiddleware: Middleware {

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        if !request.url.path.hasSuffix("/") {
            let response = request.redirect(to: request.url.path + "/", type: .permanent)
            return request.eventLoop.makeSucceededFuture(response)
        }
        return next.respond(to: request)
    }
}
