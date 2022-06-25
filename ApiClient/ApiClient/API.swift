//
//  API.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

final class API {
    let requester: RequesterProtocol
    let parser: ParserProtocol
    let router: RouterProtocol

    init(requester: RequesterProtocol = Request(),
         parser: ParserProtocol = Parser() ,
         router: RouterProtocol = Router()) {
        self.requester = requester
        self.parser = parser
        self.router = router
    }
}

protocol RequesterProtocol {
}

class Request: RequesterProtocol {
}

protocol ParserProtocol {
}

class Parser: ParserProtocol {
}

protocol RouterProtocol {
}

class Router: RouterProtocol {
}
