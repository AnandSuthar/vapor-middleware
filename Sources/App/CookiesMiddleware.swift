import Vapor
import HTTP

final class CookiesMiddleware: Middleware {
    
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        
        guard request.cookies["token"] == "secret" else {
            throw Abort.badRequest
        }
        
        return try next.respond(to: request)
        
    }
    
}
