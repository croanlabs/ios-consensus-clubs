//
//  ShowProfileInteractor.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

struct ShowProfileInteractor {
    private let presenter: ShowProfilePresentable
    private let usersWorker: UsersWorkerType
    
    init(presenter: ShowProfilePresentable, usersWorker: UsersWorkerType) {
        self.presenter = presenter
        self.usersWorker = usersWorker
    }
}

extension ShowProfileInteractor: ShowProfileBusinessLogic {
    
    func fetchUser(with request: ShowProfileModels.FetchRequest) {
        usersWorker.fetchCurrent {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedUser(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedUser(
                for: ShowProfileModels.Response(user: value)
            )
        }
    }
}
