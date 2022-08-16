//
//  NetworkManager.swift
//  2.10
//
//  Created by Александр on 11.08.2022.
//
import Foundation
enum Result {
    case success(Joke)
    case failure(NetworkError)
}
enum NetworkError: String, Error {
    case breakURL           // "Maybe break URL"
    case emptyData          // "No data"
    case invalidDecoding    // "Model isn't good at all"
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchJoke(from url: String, closure: @escaping(Result) -> Void) {
        guard let url = URL(string: url) else {
            closure(.failure(.breakURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                closure(.failure(.emptyData))
                return
            }
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    closure(.success(joke))
                }
            } catch {
                closure(.failure(.invalidDecoding))
            }
        }.resume()
    }
}

