//
//  PollsWorker.swift
//  Company Core iOS
//
//  See link for proper dependency injectection technique:
//  http://basememara.com/swift-protocol-oriented-dependency-injection/
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Polls. All rights reserved.
//

public struct PollsWorker: PollsWorkerType {
    private let store: PollsStore
    
    public init(store: PollsStore) {
        self.store = store
    }
}

public extension PollsWorker {
    
    func fetch(completion: @escaping (Result<[PollType], DataError>) -> Void) {
        store.fetch(completion: completion)
    }
    
    func fetch(id: Int, completion: @escaping (Result<PollType, DataError>) -> Void) {
        store.fetch(id: id, completion: completion)
    }
    
    func search(with request: PollsModels.SearchRequest, completion: @escaping (Result<[PollType], DataError>) -> Void) {
        store.search(with: request, completion: completion)
    }
}
