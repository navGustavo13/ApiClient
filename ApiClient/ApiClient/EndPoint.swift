//
//  EndPoint.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

enum HTTPMethod: String {
    case POST
    case GET
}

protocol EndPoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: AnyObject]? { get }
}

extension EndPoint {
    var path: String { "" }
    var method: HTTPMethod {.GET }
    var parameters: [String: AnyObject]? { nil }
}

struct GetMovies: EndPoint {
    var path: String = ""
    var method: HTTPMethod = .GET
    var parameters: [String: AnyObject]?
}

struct GetGenres: EndPoint {
    var path: String = ""
    var method: HTTPMethod = .GET
    var parameters: [String: AnyObject]?
}

enum MoviesEndPoints {
    case getMovies
    case getGenres

    public var endPoint: EndPoint {
        switch self {
        case .getMovies:
                return GetMovies()
        case .getGenres:
                return GetGenres()
        }
    }
}
