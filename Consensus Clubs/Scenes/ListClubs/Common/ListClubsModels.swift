//
//  ListClubsModels.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

enum ListClubsModels {
    
    struct FetchRequest {
        
    }
    
    struct SearchRequest {
        let text: String
    }
    
    struct Response {
        let clubs: [ClubType]
    }
    
    struct ViewModel {
        let clubs: [ClubViewModel]
    }
    
    struct ClubViewModel {
        let id: Int
        let name: String
        let content: String
        let price: String
    }
}
