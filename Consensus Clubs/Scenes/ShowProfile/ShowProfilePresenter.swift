//
//  ShowProfilePresenter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

struct ShowProfilePresenter: ShowProfilePresentable {
    private weak var viewController: ShowProfileDisplayable?
    
    init(viewController: ShowProfileDisplayable?) {
        self.viewController = viewController
    }
}

extension ShowProfilePresenter {
    
    func presentFetchedUser(for response: ShowProfileModels.Response) {
        let viewModel = ShowProfileModels.ViewModel(
            id: response.user.id,
            name: "\(response.user.firstName) \(response.user.lastName)",
            email: response.user.email
        )
        
        viewController?.displayFetchedUser(with: viewModel)
    }
    
    func presentFetchedUser(error: DataError) {
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Profile Error", // TODO: Localize
            message: "There was an error retrieving the profile: \(error)" // TODO: Localize
        )
        
        viewController?.display(error: viewModel)
    }
}
