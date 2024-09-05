//
//  ArticleRepository.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import Foundation

protocol ArticleRepository {
    func fetchArticles() async throws -> [Article]
    func saveArticles(_ articles: [Article])
    func getCachedArticles() -> [Article]
    func deleteArticle(_ article: Article)
}
