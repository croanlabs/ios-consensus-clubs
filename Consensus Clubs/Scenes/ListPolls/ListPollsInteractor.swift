//
//  ListPollsInteractor.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

struct ListPollsInteractor {
    private let presenter: ListPollsPresentable
    private let pollsWorker: PollsWorkerType
    
    init(presenter: ListPollsPresentable, pollsWorker: PollsWorkerType) {
        self.presenter = presenter
        self.pollsWorker = pollsWorker
    }
}

extension ListPollsInteractor: ListPollsBusinessLogic {
    
    func fetchPolls(with request: ListPollsModels.FetchRequest) {
        pollsWorker.fetch {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedPolls(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentFetchedPolls(
                for: ListPollsModels.Response(polls: value)
            )
        }
    }
    
    func searchPolls(with request: ListPollsModels.SearchRequest) {
        let workerRequest = PollsModels.SearchRequest(query: request.text)
        
        pollsWorker.search(with: workerRequest) {
            guard let value = $0.value, $0.isSuccess else {
                return self.presenter.presentSearchedPolls(error: $0.error ?? .unknownReason(nil))
            }
            
            self.presenter.presentSearchedPolls(
                for: ListPollsModels.Response(polls: value)
            )
        }
    }
}
