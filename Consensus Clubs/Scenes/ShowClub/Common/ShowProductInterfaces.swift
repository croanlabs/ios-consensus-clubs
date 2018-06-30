//
//  ShowProductInterfaces.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

protocol ShowClubDisplayable: class, AppDisplayable {
    func displayFetchedProduct(with viewModel: ShowProductModels.ViewModel)
}

protocol ShowClubBusinessLogic {
    func fetchProduct(with request: ShowProductModels.FetchRequest)
}

protocol ShowClubPresentable {
    func presentFetchedProduct(for response: ShowProductModels.Response)
    func presentFetchedProduct(error: DataError)
}

protocol ShowClubRoutable: AppRoutable {
    
}
