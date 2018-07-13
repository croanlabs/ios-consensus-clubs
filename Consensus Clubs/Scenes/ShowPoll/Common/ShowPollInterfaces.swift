//
//  ShowProductInterfaces.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

protocol ShowPollDisplayable: class, AppDisplayable {
    func displayFetchedPoll(with viewModel: ShowPollModels.ViewModel)
}

protocol ShowPollBusinessLogic {
    func fetchPoll(with request: ShowPollModels.FetchRequest)
}

protocol ShowPollPresentable {
    func presentFetchedPoll(for response: ShowPollModels.Response)
    func presentFetchedPoll(error: DataError)
}

protocol ShowPollRoutable: AppRoutable {
    
}
