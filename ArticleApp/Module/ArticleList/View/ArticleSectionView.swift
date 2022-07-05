//
//  ArticleSectionview.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/04.
//

import SwiftUI

struct ArticleSectionView: View {
    var title: String
    var articles: [Article]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.pink)
            ArticleItemView(article: articles[0])
            ArticleItemView(article: articles[1])
        }
    }
}

struct ArticleSectionview_Previews: PreviewProvider {
    static var previews: some View {
        let formatter = DateFormatterFactory.rssDateFormatter
        let publishedDate = formatter.date(from: "2022-07-02 23:00:00")
        let article = Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: [])
        ArticleSectionView(title: "ニュース", articles: [article])
    }
}
