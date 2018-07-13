//
//  ShowProductViewController.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

class ShowPollViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - VIP variables
    
    private lazy var interactor: ShowPollBusinessLogic = ShowPollInteractor(
        presenter: ShowPollPresenter(viewController: self),
        pollsWorker: PollsWorker(store: PollsMemoryStore())
    )
    
    private lazy var router: ShowPollRoutable = ShowPollRouter(
        viewController: self
    )
    
    // MARK: - Internal variables
    
    var productID: Int! // Must assign or die
    var routerParams: (name: String, content: String, price: String)? // Pre-fetched data
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
}

// MARK: - Events

private extension ShowPollViewController {
    
    func configure() {
        // Bind pre-fetched data if available, still fetch via loadData()
        // later in case scene deep linked or data changed on server
        guard let params = routerParams else { return }
        navigationItem.title = params.name
        contentLabel.text = params.content
        priceLabel.text = params.price
        
        // Wipe router params to avoid reuse
        routerParams = nil
    }
        
    func loadData() {
        interactor.fetchPoll(
            with: ShowPollModels.FetchRequest(
                id: productID
            )
        )
    }
}

// MARK: - VIP cycle

extension ShowPollViewController: ShowPollDisplayable {

    func displayFetchedPoll(with viewModel: ShowPollModels.ViewModel) {
        navigationItem.title = viewModel.name
        contentLabel.text = viewModel.content
        priceLabel.text = viewModel.price
    }
}

// MARK: - Taps

private extension ShowPollViewController {
    
    @IBAction func close(_ sender: Any) {
        router.dismiss()
    }
}
