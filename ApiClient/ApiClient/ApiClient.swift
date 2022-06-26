//
//  ApiClientç.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

final class APIClient {
    let dateFormatter = DateFormatter()

    func getSlackConversations(completionBlock: @escaping([Movie]) -> Void) {
        if let url = URL(string: Constants.moviesURL) {
        let task = URLSession.shared.dataTask(with: url) {   data, _, _ in

            do {
                self.dateFormatter.dateFormat = "yyyy-MM-dd"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                let dataModel = try decoder.decode(Movies.self, from: data!)
                completionBlock(dataModel.results)
            } catch {
                print(error)
            }
        }
            task.resume()
        }
    }
}
