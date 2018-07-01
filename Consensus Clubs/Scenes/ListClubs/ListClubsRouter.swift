//
//  ListClubsRouter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit

struct ListClubsRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension ListClubsRouter: ListClubsRoutable {
    
    func showClub(for id: Int) {
        show(storyboard: .showClub) { (controller: ShowClubViewController) in
            controller.productID = id
        }
    }
    
    func showBookmark() {
        present(safari: "http://consensusclubs.network")
    }
}
