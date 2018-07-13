//
//  ShowProductInteractor.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

struct ShowPollInteractor {
    private let presenter: ShowPollPresentable
    private let pollsWorker: PollsWorkerType
    
    init(presenter: ShowPollPresentable, pollsWorker: PollsWorkerType) {
        self.presenter = presenter
        self.pollsWorker = pollsWorker
    }
}

extension ShowPollInteractor: ShowPollBusinessLogic {
    
    func fetchPoll(with request: ShowPollModels.FetchRequest) {
        pollsWorker.fetch(id: request.id) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedPoll(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedPoll(
                for: ShowPollModels.Response(poll: value)
            )
        }
    }
}
