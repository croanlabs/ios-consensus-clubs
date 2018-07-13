//
//  ListPollsModels.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

enum ListPollsModels {
    
    struct FetchRequest {
        
    }
    
    struct SearchRequest {
        let text: String
    }
    
    struct Response {
        let polls: [PollType]
    }
    
    struct ViewModel {
        let polls: [PollViewModel]
    }
    
    struct PollViewModel {
        let id: Int
        let name: String
        let content: String
        let price: String
    }
}
