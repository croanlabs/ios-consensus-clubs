//
//  DataError.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public enum DataError: Error {
    case nonExistent
    case unauthorized
    case noInternet
    case parseFailure(Error?)
    case databaseFailure(Error?)
    case cacheFailure(Error?)
    case networkFailure(Error?)
    case unknownReason(Error?)
}
