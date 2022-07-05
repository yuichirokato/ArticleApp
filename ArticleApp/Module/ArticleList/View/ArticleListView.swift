//
//  ArticleListView.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/04.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var presenter: ArticleListPresenter

    init() {
        let interactor = ArticleListInteractor(client: RSSFeedClient())
        presenter = ArticleListPresenter(interactor: interactor)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(presenter.articles) { article in
                    NavigationLink(destination: WebView(url: article.linkURL!)) {
                        ArticleItemView(article: article)
                    }
                }
            }
            .navigationTitle("RSS")
        }
        .onAppear {
            presenter.apply(input: .onAppear)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
