//
//  ListClubsInteractor.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

struct ListClubsInteractor {
    private let presenter: ListClubsPresentable
    private let clubsWorker: ClubsWorkerType
    
    init(presenter: ListClubsPresentable, clubsWorker: ClubsWorkerType) {
        self.presenter = presenter
        self.clubsWorker = clubsWorker
    }
}

extension ListClubsInteractor: ListClubsBusinessLogic {
    
    func fetchClubs(with request: ListClubsModels.FetchRequest) {
        clubsWorker.fetch {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedClubs(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedClubs(
                for: ListClubsModels.Response(clubs: value)
            )
        }
    }
    
    func searchClubs(with request: ListClubsModels.SearchRequest) {
        let workerRequest = ClubsModels.SearchRequest(query: request.text)
        
        clubsWorker.search(with: workerRequest) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentSearchedClubs(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentSearchedClubs(
                for: ListClubsModels.Response(clubs: value)
            )
        }
    }
}
