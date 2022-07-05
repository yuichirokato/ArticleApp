//
//  RSSFeedRepository.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import Combine
import Foundation

enum GetRSSFeedError: Error {
    case parseError(error: Error)
    case networkError
    case unknownError
    case badRequest
    case nilData
}

protocol RSSFeedClientInterface {
    func fetchRSS(from url: URL) async throws -> ArticleResponseList
}

final class RSSFeedClient: RSSFeedClientInterface {
    func fetchRSS(from url: URL) async throws -> ArticleResponseList {
        let requestURL = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=\(url.absoluteString)")!
        let request = URLRequest(url: requestURL)

        guard let (data, response) = try? await URLSession.shared.data(for: request) else {
            throw GetRSSFeedError.networkError
        }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GetRSSFeedError.badRequest
        }

        do {
            return try JSONDecoder().decode(ArticleResponseList.self, from: data)
        } catch {
            throw GetRSSFeedError.parseError(error: error)
        }
    }
}

