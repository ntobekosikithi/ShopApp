//
//  ShopService.swift
//  ShopApp
//
//  Created by Ntobeko Sikithi on 2024/12/02.
//

import Foundation
import Alamofire

private var headers: HTTPHeaders = [
    "Content-Type": "application/json",
]

protocol ShopService {
    func Get<T: Decodable>(url: String) async throws -> [T]
}

class ShopServiceImplementation: ShopService {
    
    
    /// Get method to perform a get request.
    /// - Parameters:
    ///   - url: The endpoint URL as a `String`.
    /// - Returns: Decoded response of the specified type.
    func Get<T>(url: String) async throws -> [T] where T : Decodable {
        try await request(url: url, method: .get, headers: headers)
    }

    /// Generic method to perform a network request.
    /// - Parameters:
    ///   - url: The endpoint URL as a `String`.
    ///   - method: The HTTP method (`.get`, `.post`, etc.).
    ///   - parameters: Parameters to send with the request (default is `nil`).
    ///   - headers: HTTP headers to include (default is `nil`).
    /// - Returns: Decoded response of the specified type.
    private func request<T: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(Constants.baseUrl + url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
