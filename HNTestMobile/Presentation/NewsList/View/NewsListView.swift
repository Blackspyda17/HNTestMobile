//
//  NewsListView.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel: ArticleViewModel
    @State private var isActive: Bool = false
       init() {
           let repository = ArticleRepositoryFactory.create(useRemote: true)
           _viewModel = StateObject(wrappedValue: ArticleViewModel(repository: repository))
       }

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.articles, id: \.id) { article in
                        if let url = article.articleUrl,!viewModel.isOffline  {
                            NavigationLink {
                                WebView(url: url)
                            } label: {
                                ArticleItemView(article: article)
                            }
                        }else {
                            ArticleItemView(article: article)
                        }
       
                    }
                    .onDelete(perform: viewModel.deleteArticle)
                }
                .listStyle(.insetGrouped)
                .listRowSeparatorTint(Color.black)
                .navigationTitle(Constants.HomeConstants.navBarTitle)
                .refreshable {
                    await viewModel.fetchArticles()
                }
            }
            .overlay(
                VStack {
                    if viewModel.isOffline {
                        Text(Constants.HomeConstants.offlineTitle)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.orange)
                            .foregroundColor(.black)
                        
                    }
                    Spacer()
                }
            )

            if viewModel.isLoading {
                ProgressView(Constants.HomeConstants.loadingText)
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchArticles()
            }
        }
    }
}

#Preview {
    NewsListView()
}

