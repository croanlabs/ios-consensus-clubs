//
//  ShowProfileModels.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import CompanyCore

enum ShowProfileModels {
    
    struct FetchRequest {
        
    }
    
    struct Response {
        let user: UserType
    }
    
    struct ViewModel {
        let id: Int
        let name: String
        let email: String
    }
}
