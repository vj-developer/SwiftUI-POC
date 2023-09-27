//
//  FuturesPocViewModel.swift
//  Pokeman
//
//  Created by Priya Ranganathan on 27/09/23.
//

import Foundation
import Combine

class FuturePocViewModel: ObservableObject {
    
    @Published var pokemanList : [Pokeman] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getInitialValues()
    }
    
    func getInitialValues() {
        
        getPokemanFuturePublisher()
            .receive(on: DispatchQueue.main)
            .sink { sink in
                // print("sink \(sink)")
            } receiveValue: { [weak self] pokemanResponse in
                self?.pokemanList = pokemanResponse.data
            }
            .store(in: &cancellables)

    }
    
    // Escaping Closure
    func getPokemanEscapingClosure(completionHandler: @escaping (_ value: PokemanResponse?, _ error: Error?) -> Void) {
        getPokemanList { response, error in
            if let error = error {
                completionHandler(nil, error)
            }else{
                completionHandler(response, nil)
            }
            
        }
    }
    
    // Future Publisher
    func getPokemanFuturePublisher() -> Future<PokemanResponse,Error> {
        return Future { promise in
            self.getPokemanEscapingClosure { value, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(value!))
                }
            }
        }
    }
    
    // API Call
    func getPokemanList(completion: @escaping (PokemanResponse?, Error?) -> Void) {
        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards?pageSize=20") else {
            completion(nil, nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // Handle network error
                completion(nil, error)
                return
            }

            do {
                // Decode the data to your PokemanResponse struct
                let decoder = JSONDecoder()
                let pokemanResponse = try decoder.decode(PokemanResponse.self, from: data!)
                completion(pokemanResponse, nil)
            } catch {
                // Handle decoding error
                completion(nil, error)
            }
        }.resume()
    }
    
}
