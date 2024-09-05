//
//  ArticleItemView.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import SwiftUI

struct ArticleItemView: View {
    
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.displayTitle)
                .font(.headline)
            HStack {
                Text(article.author ?? Constants.ArticleItemConstants.unKnownAuthorString)
                Text(Constants.ArticleItemConstants.hyphen)
                Text(article.relativeTime)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }.frame(minHeight: 70)
    }
}
