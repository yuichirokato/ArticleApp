//
//  ArticleResponse.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import Foundation

struct ArticleResponseList: Codable {
    enum CodingKeys: String, CodingKey {
        case items
    }

    let items: [ArticleResponse]
}

struct ArticleResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case publishedDateString = "pubDate"
        case linkURLString = "link"
        case id = "guid"
        case thumbnailURLString = "thumbnail"
        case description
        case content
        case enclosure
        case categories
    }

    let title: String
    let publishedDateString: String
    let linkURLString: String
    let id: String
    let thumbnailURLString: String
    let description: String
    let content: String
    let enclosure: Enclosure
    let categories: [String]
}

struct Enclosure: Codable {
    enum CodingKeys: String, CodingKey {
        case linkURLString = "link"
        case type
    }

    let linkURLString: String?
    let type: String?
}
