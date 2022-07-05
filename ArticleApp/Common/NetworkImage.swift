//
//  NetworkImage.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/04.
//

import SwiftUI

struct NetworkImage: View {
    @ObservedObject var downloader: ImageDownloader

    init(imageURL: URL) {
        downloader = ImageDownloader(with: imageURL)
    }

    var body: some View {
        Image(uiImage: downloader.image)
            .resizable()
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageURL: URL(string: "https://images.cointelegraph.com/images/528_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy9kNDgwOTk1NDI3YTRhYmEyMjgwZDdlNjg3NjU0MTM5OC5qcGc=.jpg")!)
            .frame(width: 40, height: 40, alignment: .leading)
            .cornerRadius(4)
    }
}

final class ImageDownloader: ObservableObject {
    @Published var image = UIImage(systemName: "photo")!

    init(with resource: URL) {
        let session = URLSession.shared

        let task = session.dataTask(with: resource, completionHandler: { [weak self] data, _, _ in
            guard let imageData = data,
                  let networkImage = UIImage(data: imageData) else {
                return
            }

            DispatchQueue.main.async {
                self?.image = networkImage
            }

            session.invalidateAndCancel()
        })

        task.resume()
    }
}
