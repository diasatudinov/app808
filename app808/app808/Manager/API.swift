//
//  API.swift
//  app808
//
//  Created by Dias Atudinov on 28.08.2024.
//

import Foundation

class ApiService {
    private let baseUrl = "cyberciphersage.fun"
    private let token = "3af2e924-fb5e-498d-8067-42f5027b1dd0"
    private let endURL = "w1ny0urw4y"
    init() {
        print("init")
    }
    func fetchData(completion: @escaping (Result<ApiResponse, Error>) -> Void) {
        guard let url = URL(string: "https://\(baseUrl)/app/\(endURL)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        //request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

struct ApiResponse: Codable {
    let scheduled: Bool
    let disabled: String
    let shareable: Int
    let reloadable: [String]
    let unsortable: String
    let nonattachable: String?
    let canDelete: String
    let isScheduled: Int
    let pasted: Bool
    let hasNoSibling: [String]
    let focused: String
    let nonContentEditable: String
    
    enum CodingKeys: String, CodingKey {
        case scheduled
        case disabled
        case shareable
        case reloadable
        case unsortable
        case nonattachable
        case canDelete = "can_delete"
        case isScheduled = "is_scheduled"
        case pasted
        case hasNoSibling = "has_no_sibling"
        case focused
        case nonContentEditable = "nonContentEditable"
    }
}
