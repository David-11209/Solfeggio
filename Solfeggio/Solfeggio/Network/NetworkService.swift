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
    func executeAddNewUser(name: String, login: String, password: String, image: Int)
    var resultClosure: ((Bool) -> Void)? { get set}
}

class NetworkService: NetworkServiceProtocol {

    private let url = "http://localhost:5087/Solfeggio"
    var resultClosure: ((Bool) -> Void)?

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
        //        executeRequesUserData()
        AF.request(url).response { response in
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

    func executeRequesUserData() {
        let parameters: [String: Any] = ["login": "Admin", "password": "1111"]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
            }
    }

    func executeAddNewUser(name: String, login: String, password: String, image: Int) {
        let parameters: [String: Any] = ["name": name, "login": login, "password": password, "image": image]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                print(response.response)
                switch response.result {
                case .success:
                    self.resultClosure?(true)
                    print("User added successfully")
                case .failure(let error):
                    self.resultClosure?(false)
                    print("Bad request: \(error.localizedDescription)")
                }
            }
    }

    func executeGetUser(login: String, password: String) {
        let parameters: [String: Any] = [ "login": login, "password": password]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                print(response.response)
                switch response.result {
                case .success:
                    self.resultClosure?(true)
                    print("User added successfully")
                case .failure(let error):
                    self.resultClosure?(false)
                    print("Bad request: \(error.localizedDescription)")
                }
            }
    }
}
