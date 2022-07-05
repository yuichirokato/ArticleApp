//
//  SafariView.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/04.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://google.com")!)
    }
}
