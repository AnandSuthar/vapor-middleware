import Vapor

let drop = Droplet()

drop.middleware.append(CookiesMiddleware())
drop.middleware.append(ErrorMiddleware())


drop.get{ request in
    
    throw Abort.custom(status: .badRequest, message: "apple apple")
    
}

drop.run()
