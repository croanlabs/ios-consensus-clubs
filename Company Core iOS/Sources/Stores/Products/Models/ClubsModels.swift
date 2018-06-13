//
//  ClubsModels.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

public enum ClubsModels {
    
    public struct SearchRequest {
        let query: String
        
        public init(query: String) {
            self.query = query
        }
    }
}
