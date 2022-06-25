//
//  ApiClientç.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

// MARK: - Represent the JSON https://api.themoviedb.org/3/movie/popular?
struct Movies: Codable {
    let page: Int
    var results: [Movie]
}
// MARK: - List Model
struct Movie: Codable {
    let id: Int
    let title: String
    var posterPath: String
    let genreIds: [Int]
    let overview: String
    let releaseDate: Date
    var favorite: Bool?
    var genre: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case overview
        case releaseDate = "release_date"
    }

    func getYear() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "YYYY"
       
            return dateFormatterPrint.string(from: releaseDate)
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        posterPath =  try values.decode(String.self, forKey: .posterPath)
        genreIds = try values.decode([Int].self, forKey: .genreIds)
        overview = try values.decode(String.self, forKey: .overview)
        releaseDate = try values.decodeIfPresent(Date.self, forKey: .releaseDate) ?? Date()
    }
}

struct ConversationsDataModel: Decodable {
    let ok: Bool
    let conversations: [ConversationDataModel]
}

struct ConversationDataModel: Decodable {
    let id: String
    let name: String
    let creator: String
}

struct  Constants {
    static let appiKey = "429bd6eb3ae6496210731b951f6d6f95"
    static let moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=" + appiKey + "&language=en-US&page=1"
}

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
