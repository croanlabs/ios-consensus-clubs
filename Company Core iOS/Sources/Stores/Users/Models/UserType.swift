//
//  UserType.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-20.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public protocol UserType {
    var id: Int { get }
    var firstName: String { get }
    var lastName: String { get }
    var email: String { get }
    var updatedAt: Date { get }
    var createdAt: Date { get }
}
