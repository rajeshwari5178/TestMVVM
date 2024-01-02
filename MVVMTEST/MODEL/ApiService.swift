//
//  ApiService.swift
//  MVVMTEST
//
//  Created by Rajeshwari Sharma on 02/01/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}

class APIService {
    static let shared = APIService()

    private let baseURL = "https://jsonplaceholder.typicode.com/todos"

    func fetchTodos( completion: @escaping (Result<[NewDataModel], APIError>) -> Void) {
        guard let url = URL(string: baseURL ) else {
            completion(.failure(.invalidURL))
            return
        }
    
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let todos = try JSONDecoder().decode([NewDataModel].self, from: data)
                completion(.success(todos))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
