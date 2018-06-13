//
//  ShowProductPresenter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

struct ShowProductPresenter: ShowClubPresentable {
    private weak var viewController: ShowClubDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ShowClubDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
    }
}

extension ShowProductPresenter {
    
    func presentFetchedProduct(for response: ShowProductModels.Response) {
        let viewModel = ShowProductModels.ViewModel(
            id: response.product.id,
            name: response.product.name,
            content: response.product.content,
            price: currencyFormatter.string(from: NSNumber(value: Float(response.product.priceCents) / 100))
                ?? "\(response.product.priceCents / 100)"
        )
        
        viewController?.displayFetchedProduct(with: viewModel)
    }
    
    func presentFetchedProduct(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Product Error", // TODO: Localize
            message: "There was an error retrieving the product: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}
