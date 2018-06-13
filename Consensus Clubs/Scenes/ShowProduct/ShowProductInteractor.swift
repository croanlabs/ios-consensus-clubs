//
//  ShowProductInteractor.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

struct ShowProductInteractor {
    private let presenter: ShowClubPresentable
    private let clubsWorker: ClubsWorkerType
    
    init(presenter: ShowClubPresentable, clubsWorker: ClubsWorkerType) {
        self.presenter = presenter
        self.clubsWorker = clubsWorker
    }
}

extension ShowProductInteractor: ShowClubBusinessLogic {
    
    func fetchProduct(with request: ShowProductModels.FetchRequest) {
        clubsWorker.fetch(id: request.id) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedProduct(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedProduct(
                for: ShowProductModels.Response(product: value)
            )
        }
    }
}
