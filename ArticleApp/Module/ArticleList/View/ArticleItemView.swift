//
//  ArticleItemView.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import SwiftUI

struct ArticleItemView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            NetworkImage(imageURL: article.thumbnailURL!)
                .frame(width: 50, height: 50)
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .bold()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                HStack {
                    Text(article.source.name)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Spacer()
                    Text(article.formattedDate)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct ArticleItemView_Previews: PreviewProvider {
    static var previews: some View {
        let formatter = DateFormatterFactory.rssDateFormatter
        let publishedDate = formatter.date(from: "2022-07-02 23:00:00")
        ArticleItemView(article: Article(id: "id", title: "Web3.0時代のプライバシー、企業はどのように取り組むべきか", description: "hoge", source: .cointelegraph, thumbnailURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg"), publishedDate: publishedDate, linkURL: URL(string: "https://jp.cointelegraph.com/news/opinion-ledger-insight-of-the-week-2022-0703"), categories: []))
    }
}
