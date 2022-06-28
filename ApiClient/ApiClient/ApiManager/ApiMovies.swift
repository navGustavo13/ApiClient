//
//  ApiMovies.swift
//  ApiClient
//
//  Created by gustavo.salazar on 27/06/22.
//

import Foundation

class ApiMovies {
    private let token: String
    private let api: API

    init(token: String) {
        self.token = token
        self.api = API(requester: Requester(token: token))
    }

    func getMovies(endPoint: MoviesEndPoints, completionBlock: @escaping([Movie]?) -> Void) {
        // 1
        let endPoint = endPoint.endPoint
        // 2
        let moviesEndPoint = api.router.routeMoviesEndpoint(endPoint)
        // 3
        api.requester.execute(with: moviesEndPoint) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                    // 4
                    let dataModel = self.api.parser.parse(data, type: [Movie].self, decoder: JSONDecoder.init())
                    // 5
                    completionBlock(dataModel)
            case .failure(let error):
                    print("Error \(error)")
            }
        }
    }
}
