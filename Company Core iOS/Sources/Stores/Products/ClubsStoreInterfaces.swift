//
//  ClubsStoreInterfaces.swift
//
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public protocol ClubsStore {
    func fetch(completion: @escaping (Result<[ClubType], DataError>) -> Void)
    func fetch(id: Int, completion: @escaping (Result<ClubType, DataError>) -> Void)
    
    func search(with request: ClubsModels.SearchRequest, completion: @escaping (Result<[ClubType], DataError>) -> Void)
}

public protocol ClubsWorkerType: ClubsStore {

}
