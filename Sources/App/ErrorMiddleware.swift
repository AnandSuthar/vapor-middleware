import Vapor
import HTTP

final class ErrorMiddleware: Middleware {
    
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        
        do {
            return try next.respond(to: request)
        } catch {
            
            if request.accept.prefers("html") {
                throw error
            } else {
                
                let abort = error as! Abort
                
                let json = try JSON(node: [
                    "error": "\(abort.status): \(abort.message)"
                    ])
                
                let response = try Response(status: abort.status, json: json)
                return response
                
            }
            
        }
        
    }
    
}
