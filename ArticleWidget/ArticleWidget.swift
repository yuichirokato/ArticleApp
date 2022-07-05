//
//  ArticleWidget.swift
//  ArticleWidget
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import WidgetKit
import SwiftUI
import Intents

extension Article {
    private static var availableTopStories: [Article] {
        let formatter = DateFormatterFactory.rssDateFormatter
        let publishedDate = formatter.date(from: "2022-07-02 23:00:00")
        return [
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: [])
        ]
    }

    private static var availableTrendingStories: [Article] {
        let formatter = DateFormatterFactory.rssDateFormatter
        let publishedDate = formatter.date(from: "2022-07-02 23:00:00")

        return [
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []),
        Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: [])
        ]
    }

    static var topStories: [Article] {
        return Array(availableTopStories.shuffled().prefix(2))
    }

    static var trendingStories: [Article] {
        return Array(availableTrendingStories.shuffled().prefix(2))
    }
}

struct ArticleEntry: TimelineEntry {
    let date: Date
    let topStories: [Article]
    let trendingStories: [Article]
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ArticleEntry {
        ArticleEntry(date: Date(),
                     topStories: Article.topStories,
                     trendingStories: Article.trendingStories)
    }

    func getSnapshot(in context: Context, completion: @escaping (ArticleEntry) -> Void) {
        let entry = ArticleEntry(date: Date(),
                                 topStories: Article.topStories,
                                 trendingStories: Article.trendingStories)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ArticleEntry>) -> Void) {
        var entries: [ArticleEntry] = []

        let currentDate = Date()
        for hourOffset in 0..<5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ArticleEntry(date: entryDate,
                                     topStories: Article.topStories,
                                     trendingStories: Article.trendingStories)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ArticleWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ArticleSectionView(title: "Top Stories", articles: entry.topStories)
            if widgetFamily == .systemLarge {
                ArticleSectionView(title: "Trending", articles: entry.trendingStories)
            }
        }
        .padding(10)
    }
}

@main
struct ArticleWidget: Widget {
    let kind: String = "ArticleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ArticleWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemLarge, .systemMedium])
        .configurationDisplayName("Article Widget")
        .description("The hottest news from around the globe.")
    }
}

struct ArticleWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticleWidgetEntryView(entry: ArticleEntry(date: Date(), topStories: Article.topStories, trendingStories: Article.trendingStories))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            ArticleWidgetEntryView(entry: ArticleEntry(date: Date(), topStories: Article.topStories, trendingStories: Article.trendingStories))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
