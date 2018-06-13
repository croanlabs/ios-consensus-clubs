//
//  UsersMemoryStore.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-20.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public struct UsersMemoryStore: UsersStore {
    
    public init() {
        
    }
}

public extension UsersMemoryStore {
    
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void) {
        let user = User(
            id: 1,
            firstName: "John",
            lastName: "Doe",
            email: "john@example.com",
            updatedAt: Date(),
            createdAt: Date()
        )
        
        completion(.success(user))
    }
}
