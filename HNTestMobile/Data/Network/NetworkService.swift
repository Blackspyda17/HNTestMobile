//
//  NetworkService.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(url: URL) async throws -> T
}

class DefaultNetworkService: NetworkService {
    func request<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch let decodingError {
            print("Decoding error: \(decodingError)")
            throw URLError(.cannotDecodeContentData)
        }
    }
}
