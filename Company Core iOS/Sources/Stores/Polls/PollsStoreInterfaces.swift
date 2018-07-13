//
//  ClubsStoreInterfaces.swift
//
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public protocol PollsStore {
    func fetch(completion: @escaping (Result<[PollType], DataError>) -> Void)
    func fetch(id: Int, completion: @escaping (Result<PollType, DataError>) -> Void)
    
    func search(with request: PollsModels.SearchRequest, completion: @escaping (Result<[PollType], DataError>) -> Void)
}

public protocol PollsWorkerType: PollsStore {

}
