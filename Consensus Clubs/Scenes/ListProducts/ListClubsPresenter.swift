//
//  ListClubsPresenter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

struct ListClubsPresenter: ListClubsPresentable {
    private weak var viewController: ListClubsDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ListClubsDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ListClubsPresenter {
    
    func presentFetchedClubs(for response: ListClubsModels.Response) {
        let viewModel = ListClubsModels.ViewModel(
            clubs: response.clubs.map { make(product: $0) }
        )
        
        viewController?.displayFetchedClubs(with: viewModel)
    }
    
    func presentFetchedClubs(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Clubs Error", // TODO: Localize
            message: "There was an error retrieving the clubs: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

extension ListClubsPresenter {
    
    func presentSearchedClubs(for response: ListClubsModels.Response) {
        let viewModel = ListClubsModels.ViewModel(
            clubs: response.clubs.map { make(product: $0) }
        )
        
        viewController?.displayFetchedClubs(with: viewModel)
    }
    
    func presentSearchedClubs(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Search Error", // TODO: Localize
            message: "There was an error searching for clubs: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}

// MARK: - Helpers

private extension ListClubsPresenter {

    func make(product: ClubType) -> ListClubsModels.ClubViewModel {
        return ListClubsModels.ClubViewModel(
            id: product.id,
            name: product.name,
            content: product.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(product.priceCents) / 100))
                ?? "\(product.priceCents / 100)"
        )
    }
}
