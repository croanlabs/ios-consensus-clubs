//
//  ListClubsInterfaces.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

protocol ListClubsDisplayable: class, AppDisplayable { // View Controlelr
    func displayFetchedClubs(with viewModel: ListClubsModels.ViewModel)
    func displaySearchedClubs(with viewModel: ListClubsModels.ViewModel)
}

protocol ListClubsBusinessLogic { // Interactor
    func fetchClubs(with request: ListClubsModels.FetchRequest)
    func searchClubs(with request: ListClubsModels.SearchRequest)
}

protocol ListClubsPresentable { // Presenter
    func presentFetchedClubs(for response: ListClubsModels.Response)
    func presentFetchedClubs(error: DataError)
    
    func presentSearchedClubs(for response: ListClubsModels.Response)
    func presentSearchedClubs(error: DataError)
}

protocol ListClubsRoutable: AppRoutable { // Router
    func showClub(for id: Int)
    func showBookmark()
}
