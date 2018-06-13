//
//  ClubsWorker.swift
//  Company Core iOS
//
//  See link for proper dependency injectection technique:
//  http://basememara.com/swift-protocol-oriented-dependency-injection/
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public struct ClubsWorker: ClubsWorkerType {
    private let store: ClubsStore
    
    public init(store: ClubsStore) {
        self.store = store
    }
}

public extension ClubsWorker {
    
    func fetch(completion: @escaping (Result<[ClubType], DataError>) -> Void) {
        store.fetch(completion: completion)
    }
    
    func fetch(id: Int, completion: @escaping (Result<ClubType, DataError>) -> Void) {
        store.fetch(id: id, completion: completion)
    }
    
    func search(with request: ClubsModels.SearchRequest, completion: @escaping (Result<[ClubType], DataError>) -> Void) {
        store.search(with: request, completion: completion)
    }
}
