//
//  NetworkService.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import Foundation

struct NetworkService {

    static func request(urlString: String, completion: @escaping (Result<Any, Error>) -> Void) {
        switch getBaseURL(urlString: urlString) {
        case .success(let url):
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error as? URLError {
                    print("URLError code: \(error.code.rawValue)")
                } else {
                    if let error {
                        print("Error: \(error)")
                        completion(.failure(error))
                        return
                    }
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print(".statusCode: \(httpResponse.statusCode)")
                } else {
                    print(NetworkError.httpResponseError.description)
                    completion(.failure(NetworkError.httpResponseError))
                    return
                }
                
                guard let data else {
                    print(NetworkError.jsonError.description)
                    completion(.failure(NetworkError.jsonError))
                    return
                }
                
                completion(.success(data as Data))

            }
            
            task.resume()
            
        case .failure(let error):
            completion(.failure(error))
            return
        }
    }
    
    static func getCharacters(completion: @escaping ([Superhero]) -> Void) {
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"
        NetworkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                if let data = data as? Data {
                    let decoder = JSONDecoder()
                    do {
                        let superheroResponse = try decoder.decode([Superhero].self, from: data)
                        completion(superheroResponse)
                    } catch {
                        print("Decoding error: \(error.localizedDescription)")
                        completion([])
                    }
                } else {
                    print("Error: Data is not of expected type Data")
                    completion([])
                }
            case .failure(let error):
                print("Network error: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}

func getBaseURL(urlString: String) -> Result<URL, Error> {
    if let url = URL(string: urlString) {
        return .success(url)
    } else {
        return .failure(NetworkError.urlError)
    }
}
