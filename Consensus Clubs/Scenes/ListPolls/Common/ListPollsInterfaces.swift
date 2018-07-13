//
//  ListPollsInterfaces.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

protocol ListPollsDisplayable: class, AppDisplayable { // View Controlelr
    func displayFetchedPolls(with viewModel: ListPollsModels.ViewModel)
    func displaySearchedPolls(with viewModel: ListPollsModels.ViewModel)
}

protocol ListPollsBusinessLogic { // Interactor
    func fetchPolls(with request: ListPollsModels.FetchRequest)
    func searchPolls(with request: ListPollsModels.SearchRequest)
}

protocol ListPollsPresentable { // Presenter
    func presentFetchedPolls(for response: ListPollsModels.Response)
    func presentFetchedPolls(error: DataError)
    
    func presentSearchedPolls(for response: ListPollsModels.Response)
    func presentSearchedPolls(error: DataError)
}

protocol ListPollsRoutable: AppRoutable { // Router
    func showPoll(for id: Int)
    func showBookmark()
}
