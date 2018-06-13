//
//  ProductType.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public protocol ClubType {
    var id: Int { get }
    var name: String { get }
    var content: String { get }
    var priceCents: Int { get }
    var updatedAt: Date { get }
    var createdAt: Date { get }
}
