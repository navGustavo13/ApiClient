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

    init(requester: RequesterProtocol = Requester(),
         parser: ParserProtocol = Parser() ,
         router: RouterProtocol = Router()) {
        self.requester = requester
        self.parser = parser
        self.router = router
    }
}
