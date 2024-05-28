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
    func executeAddNewUser(name: String, login: String, password: String, image: String)
    func executeGetUser(login: String, password: String, completion: @escaping (UserModel?) -> Void)
    func executeUpdateUserInfo(user: User, levels: [String])
    var resultClosure: ((Bool) -> Void)? { get set}
}

class NetworkService: NetworkServiceProtocol {

    private let url = "http://localhost:5087/Solfeggio"
    private var login: String = ""
    private var password: String = ""
    var resultClosure: ((Bool) -> Void)?

    func getData(completion: @escaping (Result<JSONData, Error>) -> Void) {
        executeRequestJSONData { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func executeRequestJSONData(completion: @escaping (Result<JSONData, Error>) -> Void) {
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

    func executeAddNewUser(name: String, login: String, password: String, image: String) {
        let parameters: [String: Any] = ["name": name, "login": login, "password": password, "image": image]
        AF.request("\(url)/addUser", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    self.resultClosure?(true)
                    print("User added successfully")
                } else {
                    self.resultClosure?(false)
                    print("Server returned an error: \(response.response?.statusCode ?? -1)")
                }
            }
    }

    func executeGetUser(login: String, password: String, completion: @escaping (UserModel?) -> Void) {
        let parameters: [String: Any] = [ "login": login, "password": password]
        AF.request("\(url)/getUser", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: UserModel.self) { response in
                switch response.result {
                case .success(let user):
                    print(user)
                    completion(user)
                case .failure:
                    print("Error: \(String(describing: response.error))")
                    completion(nil)
                }
            }
    }

    func executeUpdateUserInfo(user: User, levels: [String]) {
        var dict: [[String: String]] = [[:]]
        for level in levels {
            dict.append(["Id": level])
        }
        dict.remove(at: 0)
        print(dict)
        let parameters: [String: Any] = [
            "Login": "\(user.login)",
            "Password": "\(user.password)",
            "NotesStat": "\(user.notesStat)",
            "IntervalsStat": "\(user.intervalsStat)",
            "MoodsStat": "\(user.moodsStat)",
            "ChordsStat": "\(user.chordsStat)",
            "NumberNotesListened": "\(user.numberNotesListened)",
            "NumberIntervalsListened": "\(user.numberIntervalsListened)",
            "NumberMoodsListened": "\(user.numberMoodsListened)",
            "NumberChordsListened": "\(user.numberChordsListened)",
            "NumberNotesSuccessListened": "\(user.numberNotesSuccessListened)",
            "NumberIntervalsSuccessListened": "\(user.numberIntervalsSuccessListened)",
            "NumberMoodsSuccessListened": "\(user.numberMoodsSuccessListened)",
            "NumberChordsSuccessListened": "\(user.numberChordsSuccessListened)",
            "CompletedLevels": dict
        ]
        print(parameters)
        AF.request("\(url)/updateUserInfo", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                switch response.result {
                case .success:
                    print(response.result)
                case .failure:
                    print("Error: \(String(describing: response.error))")
                }
            }
    }

}

