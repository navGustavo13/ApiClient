//
//  Router.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

class AppEnvironment {
    enum Base {
        case movies
    }

    func getUrl(api: Base) -> URL? {
            if let url = URL(string: Constants.urlApiMovies) {
            switch api {
            case .movies:
                return url
            }
        }
      return nil
    }
}

protocol RouterProtocol {
    func routeMoviesEndPont(_ endpoint: EndPoint) -> RouterEndPoint
}

struct RouterEndPoint: EndPoint {
    let path: String
    let method: HTTPMethod
    var parameters: [String: AnyObject]?
}

class Router {
    let environment: AppEnvironment

    init(environment: AppEnvironment = AppEnvironment()) {
        self.environment = environment
    }

    func routeMoviesEndpoint(_ endpoint: EndPoint) -> EndPoint {
        routerEndpoint(endpoint, api: AppEnvironment.Base.movies)
    }

    func routerEndpoint(_ endpoint: EndPoint, api: AppEnvironment.Base) -> EndPoint {
        var url = environment.getUrl(api: api)
        url?.appendPathComponent(endpoint.path)
        return RouterEndPoint(path: url!.absoluteString,
                                  method: endpoint.method,
                                  parameters: endpoint.parameters)
    }
}
