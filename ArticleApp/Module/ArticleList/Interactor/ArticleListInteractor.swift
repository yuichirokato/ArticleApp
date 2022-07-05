//
//  ArticleListInteractor.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import Foundation

enum NewsSource {
    case cointelegraph

    var url: URL {
        switch self {
        case .cointelegraph:
            return URL(string: "https://jp.cointelegraph.com/rss")!
        }
    }

    var name: String {
        switch self {
        case .cointelegraph:
            return "Cointelegraph"
        }
    }
}

protocol ArticleListInteractorInterface {
    func fetchRSS(for source: NewsSource) async throws -> ArticleResponseList
}

struct ArticleListInteractor: ArticleListInteractorInterface {
    private let client: RSSFeedClient

    init(client: RSSFeedClient) {
        self.client = client
    }

    func fetchRSS(for source: NewsSource) async throws -> ArticleResponseList {
        return try await client.fetchRSS(from: source.url)
    }
}
