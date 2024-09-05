//
//  ArticleRepositoryFactory.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import Foundation

class ArticleRepositoryFactory {
    static func create(useRemote: Bool) -> ArticleRepository {
        if useRemote {
            return ArticleRepositoryImpl(
                remoteDataSource: RemoteArticleDataSource(),
                localDataSource: LocalArticleDataSource()
            )
        } else {
           
            return ArticleRepositoryImpl(
                remoteDataSource: nil,
                localDataSource: LocalArticleDataSource()
            )
        }
    }
}
