//
//  APIConnect.swift
//  Solfeggio
//
//  Created by Давид Васильев on 02.05.2024.
//

import Alamofire
import UIKit

protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<JSONData, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func getData(completion: @escaping (Result<JSONData, Error>) -> Void) {
        executeRequestJSONData { result in
            switch result {
            case .success(let product):
                completion(.success(product))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func executeRequestJSONData(completion: @escaping (Result<JSONData, Error>) -> Void) {
        AF.request("http://localhost:5087/Solfeggio").response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(JSONData.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                        print("Error: \(error)")
                    }
                }
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
