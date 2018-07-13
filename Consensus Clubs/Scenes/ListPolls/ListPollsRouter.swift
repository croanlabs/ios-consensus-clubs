//
//  ListPollsRouter.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit

struct ListPollsRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension ListPollsRouter: ListPollsRoutable {
    
    func showPoll(for id: Int) {
        show(storyboard: .showPoll) { (controller: ShowPollViewController) in
            controller.productID = id
        }
    }
    
    func showBookmark() {
        present(safari: "http://consensusclubs.network")
    }
}
