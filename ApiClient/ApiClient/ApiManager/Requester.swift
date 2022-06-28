//
//  Requester.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

protocol RequesterProtocol {
    func execute(with endpoint: EndPoint, completionBlock: @escaping(Result<Data, Error>) -> Void)
}

class Requester: RequesterProtocol {
    let urlSession: URLSession
    let token: String

    init(urlSession: URLSession = URLSession.shared, token: String = "") {
        self.urlSession = urlSession
        self.token = token
    }

    func execute(with endpoint: EndPoint, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        let urlRequest = buildURLRequest(endPoint: endpoint)!

        let task = urlSession.dataTask(with: urlRequest) { data, _, error in
            guard let error = error else {
                completionBlock(.success(data!))
                return
            }

            completionBlock(.failure(error))
        }
        task.resume()
    }

    func buildURLRequest(endPoint: EndPoint) -> URLRequest? {
        var urlRequest = URLRequest(url: URL(string: endPoint.path)!)

        urlRequest.httpMethod = endPoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        if let parameters = endPoint.parameters, !parameters.isEmpty,
           let postData = (try? JSONSerialization.data(withJSONObject: endPoint.parameters as Any,
                                                       options: .prettyPrinted)) {
            urlRequest.httpBody = postData
        }
        urlRequest.timeoutInterval = 20
        return urlRequest
    }
}
