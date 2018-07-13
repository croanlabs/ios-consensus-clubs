//
//  ListPollsPresenter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

struct ListPollsPresenter: ListPollsPresentable {
    private weak var viewController: ListPollsDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ListPollsDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ListPollsPresenter {
    
    func presentFetchedPolls(for response: ListPollsModels.Response) {
        let viewModel = ListPollsModels.ViewModel(
            polls: response.polls.map { make(product: $0) }
        )
        
        viewController?.displayFetchedPolls(with: viewModel)
    }
    
    func presentFetchedPolls(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Polls Error", // TODO: Localize
            message: "There was an error retrieving the polls: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

extension ListPollsPresenter {
    
    func presentSearchedPolls(for response: ListPollsModels.Response) {
        let viewModel = ListPollsModels.ViewModel(
            polls: response.polls.map { make(product: $0) }
        )
        
        viewController?.displayFetchedPolls(with: viewModel)
    }
    
    func presentSearchedPolls(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Search Error", // TODO: Localize
            message: "There was an error searching for polls: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

// MARK: - Helpers

private extension ListPollsPresenter {

    func make(product: PollType) -> ListPollsModels.PollViewModel {
        return ListPollsModels.PollViewModel(
            id: product.id,
            name: product.name,
            content: product.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(product.priceCents) / 100))
                ?? "\(product.priceCents / 100)"
        )
    }
}
