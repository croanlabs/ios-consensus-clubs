//
//  User.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-20.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public struct User: UserType {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    public let updatedAt: Date
    public let createdAt: Date
}
