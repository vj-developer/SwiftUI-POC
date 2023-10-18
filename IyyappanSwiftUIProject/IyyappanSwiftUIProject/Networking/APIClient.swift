//
//  APIClient.swift
//  IyyappanSwiftUIProject
//
//  Created by Iyyappan on 18/10/23.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private let session = URLSession.shared
    
    // Define your base URL
    private let baseURL = WebConstants.BaseURL
    
    // Perform a GET request
    func get<T: Decodable>(
        path: String,
        parameters: [String: Any]?,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var urlComponents = URLComponents(string: baseURL + path)
        urlComponents?.queryItems = parameters?.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard let url = urlComponents?.url else {
            return completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        }

        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    // Perform a POST request
    func post<T: Decodable>(
        path: String,
        parameters: [String: Any]?,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        // Construct the URL and request body as needed
        let url = URL(string: baseURL + path)!
        let requestBody = try? JSONSerialization.data(withJSONObject: parameters ?? [:])

        // Create a POST request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    // You can add more methods for authentication, PUT, DELETE, etc., as needed.
}
