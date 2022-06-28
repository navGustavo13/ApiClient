//
//  GetMoviesEndpoint.swift
//  ApiClient
//
//  Created by gustavo.salazar on 28/06/22.
//

import Foundation

public struct GetMoviesEndpoint: EndPoint {
    var path: String = Constants.moviePath
    var method: HTTPMethod = .POST
    var parameters: [String: Any]? = ["api_key": Constants.appiKey,
                                      "language": "en-US",
                                      "page": "1"]

    public init() {
    }
}

public struct GetGenresEndpoint: EndPoint {
    var path: String = Constants.genrePath
    var method: HTTPMethod = .POST
    var parameters: [String: Any]? = ["api_key": Constants.appiKey,
                                      "language": "en-US"]

    public init () {
    }
}
