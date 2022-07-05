//
//  Article.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import Foundation

struct Article {
    let id: String
    let title: String
    let description: String
    let source: NewsSource
    let thumbnailURL: URL?
    let publishedDate: Date?
    let linkURL: URL?
    let categories: [String]

    private(set) var formattedDate = ""

    init(from response: ArticleResponse, newsSource: NewsSource) {
        let formatter = DateFormatterFactory.rssDateFormatter

        id = response.id
        title = response.title
        description = response.description
        source = newsSource
        thumbnailURL = URL(string: response.thumbnailURLString)
        publishedDate = formatter.date(from: response.publishedDateString)
        linkURL = URL(string: response.linkURLString)
        categories = response.categories

        formattedDate = format(publishedDate: publishedDate)
    }

    init(id: String,
         title: String,
         description: String,
         source: NewsSource,
         thumbnailURL: URL?,
         publishedDate: Date?,
         linkURL: URL?,
         categories: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.source = source
        self.thumbnailURL = thumbnailURL
        self.publishedDate = publishedDate
        self.linkURL = linkURL
        self.categories = categories

        formattedDate = format(publishedDate: publishedDate)
    }
}

private extension Article {
    func format(publishedDate: Date?) -> String {
        guard let date = publishedDate else { return "" }

        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date)

        if let day = components.day, day > 1 {
            let dateString = date.formatted(.iso8601.year().month().day().dateSeparator(.dash))
            return dateString
        }

        if components.day == 1 {
            return "1日前"
        }

        if let hour = components.hour, hour > 0 {
            return "\(hour)時間前"
        }

        if let minute = components.minute, minute > 0 {
            return "\(minute)分前"
        }

        if let second = components.second, second > 0 {
            return "\(second)"
        }

        return ""
    }
}

extension Article: Hashable {}

extension Article: Identifiable {}

struct DateFormatterFactory {
    static let rssDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return formatter
    }()
}
