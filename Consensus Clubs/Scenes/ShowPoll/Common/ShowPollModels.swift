//
//  ShowProductModels.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

enum ShowPollModels {
    
    struct FetchRequest {
        let id: Int
    }
    
    struct Response {
        let poll: PollType
    }
    
    struct ViewModel {
        let id: Int
        let name: String
        let content: String
        let price: String
    }
}
