//
//  Parser.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

protocol ParserProtocol {
    func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder) -> T?
}

class Parser: ParserProtocol {
    func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder = .init()) -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error as DecodingError {
            printDecodable(error: error)
        } catch {
            print("Error \(error)")
        }
        return nil
    }
}

extension Parser {
    func printDecodable(error: Error) {
        guard let error = error as? DecodingError else { return }
                var message: String
                switch error {
                case .keyNotFound(let key, let context):
                    message = "[Decodable] Key \"\(key)\" not found \nContext: \(context.debugDescription)"
                case .dataCorrupted(let context):
                    message = "[Decodable] Data corrupted \n(Context: "
                    message += "\(context.debugDescription)) \nCodingKeys: \(context.codingPath)"
                case .typeMismatch(let type, let context):
                    message = "[Decodable] Type mismatch \"\(type)\" \nContext: \(context.debugDescription)"
                case .valueNotFound(let type, let context):
                    message = "[Decodable] Value not found, type \"\(type)\" \nContext: \(context.debugDescription)"
                @unknown default:
                    message = "[Decodable] Unknown DecodingError catched"
                    assertionFailure(message)
                }
                print(message)
    }
}
