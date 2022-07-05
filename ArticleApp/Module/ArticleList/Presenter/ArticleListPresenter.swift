//
//  ArticleListPresenter.swift
//  ArticleApp
//
//  Created by Yuichiro Takahashi on 2022/07/03.
//

import Foundation

enum ArticleListInput {
    case onAppear
}

protocol ArticleListPresenterInterface {
    func apply(input: ArticleListInput)
}

final class ArticleListPresenter: ArticleListPresenterInterface, ObservableObject {
    @Published var articles: [Article] = []

    private let interactor: ArticleListInteractorInterface

    init(interactor: ArticleListInteractorInterface) {
        self.interactor = interactor
    }

    func apply(input: ArticleListInput) {
        switch input {
        case .onAppear:
            fetchRSS()
        }
    }
}

private extension ArticleListPresenter {
    func fetchRSS() {
        Task { [weak self] in
            do {
                guard let response = try await self?.interactor.fetchRSS(for: .cointelegraph) else {
                    return
                }

                DispatchQueue.main.sync { [weak self] in
                    self?.articles = response.items.map { Article(from: $0, newsSource: .cointelegraph) }
                }
            } catch {
                print("fetch RSS failure: \(error)")
            }
        }
    }
}
