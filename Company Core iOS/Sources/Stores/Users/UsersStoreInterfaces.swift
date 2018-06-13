//
//  ClubsStoreInterfaces.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-20.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public protocol UsersStore {
    func fetchCurrent(completion: @escaping (Result<UserType, DataError>) -> Void)
}

public protocol UsersWorkerType: UsersStore {
    
}
