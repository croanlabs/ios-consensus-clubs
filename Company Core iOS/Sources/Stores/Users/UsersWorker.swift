//
//  UsersWorker.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-20.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public struct UsersWorker: UsersWorkerType {
    private let store: UsersStore
    
    public init(store: UsersStore) {
        self.store = store
    }
}

public extension UsersWorker {
    
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void) {
        store.fetchCurrent(completion: completion)
    }
}
