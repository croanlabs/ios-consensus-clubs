//
//  ShowProductViewController.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

class ShowClubViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - VIP variables
    
    private lazy var interactor: ShowClubBusinessLogic = ShowProductInteractor(
        presenter: ShowProductPresenter(viewController: self),
        clubsWorker: ClubsWorker(store: ClubsMemoryStore())
    )
    
    private lazy var router: ShowClubRoutable = ShowProductRouter(
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

private extension ShowClubViewController {
    
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
        interactor.fetchProduct(
            with: ShowProductModels.FetchRequest(
                id: productID
            )
        )
    }
}

// MARK: - VIP cycle

extension ShowClubViewController: ShowClubDisplayable {

    func displayFetchedProduct(with viewModel: ShowProductModels.ViewModel) {
        navigationItem.title = viewModel.name
        contentLabel.text = viewModel.content
        priceLabel.text = viewModel.price
    }
}

// MARK: - Taps

private extension ShowClubViewController {
    
    @IBAction func close(_ sender: Any) {
        router.dismiss()
    }
}
