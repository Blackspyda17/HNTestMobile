//
//  RemoteArticleDataSource.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import Foundation

import Foundation

class RemoteArticleDataSource: ArticleRepository {
    private let networkService: NetworkService

       init(networkService: NetworkService = DefaultNetworkService()) {
           self.networkService = networkService
       }

       func fetchArticles() async throws -> [Article] {
           guard let url = URL(string: Constants.URLConstant.baseURL) else { throw URLError(.badURL) }
           let response: ArticleResponse = try await networkService.request(url: url)
           return response.hits
       }

    func saveArticles(_ articles: [Article]) {
    }

    func getCachedArticles() -> [Article] {
        return []
    }

    func deleteArticle(_ article: Article) {
    }
}
