//
//  Product.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public struct Club: ClubType {
    public let id: Int
    public let name: String
    public let content: String
    public let priceCents: Int
    public let updatedAt: Date
    public let createdAt: Date
}
