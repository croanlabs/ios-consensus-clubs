//
//  ShowProductPresenter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

struct ShowPollPresenter: ShowPollPresentable {
    private weak var viewController: ShowPollDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ShowPollDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ShowPollPresenter {
    
    func presentFetchedPoll(for response: ShowPollModels.Response) {
        let viewModel = ShowPollModels.ViewModel(
            id: response.poll.id,
            name: response.poll.name,
            content: response.poll.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(response.poll.priceCents) / 100))
                ?? "\(response.poll.priceCents / 100)"
        )
        
        viewController?.displayFetchedPoll(with: viewModel)
    }
    
    func presentFetchedPoll(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Poll Error", // TODO: Localize
            message: "There was an error retrieving the poll: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}
