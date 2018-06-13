//
//  ShowProfileInterfaces.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

protocol ShowProfileDisplayable: class, AppDisplayable {
    func displayFetchedUser(with viewModel: ShowProfileModels.ViewModel)
}

protocol ShowProfileBusinessLogic {
    func fetchUser(with request: ShowProfileModels.FetchRequest)
}

protocol ShowProfilePresentable {
    func presentFetchedUser(for response: ShowProfileModels.Response)
    func presentFetchedUser(error: DataError)
}

protocol ShowProfileRoutable: AppRoutable {
    
}
