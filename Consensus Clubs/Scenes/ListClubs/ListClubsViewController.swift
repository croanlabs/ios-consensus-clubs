//
//  ListClubsViewController.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

class ListClubsViewController: UIViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(
                UINib(nibName: String(describing: ListClubsTableViewCell.self), bundle: nil),
                forCellReuseIdentifier: cellReuseIdentifier
            )
        }
    }
    
    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.hidesNavigationBarDuringPresentation = false
        $0.dimsBackgroundDuringPresentation = false
        $0.searchBar.placeholder = "Search clubs..."
        return $0
    }(UISearchController(searchResultsController: nil))
    
    // MARK: - VIP variables
    
    private lazy var interactor: ListClubsBusinessLogic = ListClubsInteractor(
        presenter: ListClubsPresenter(viewController: self),
        clubsWorker: ClubsWorker(store: ClubsMemoryStore())
    )
    
    private lazy var router: ListClubsRoutable = ListClubsRouter(
        viewController: self
    )
    
    // MARK: - View models
    
    private var viewModel: ListClubsModels.ViewModel?
    
    // MARK: - Internal variables
    
    private let cellReuseIdentifier = "Cell"
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
}

// MARK: - Events

private extension ListClubsViewController {
    
    func configure() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    func loadData() {
        interactor.fetchClubs(
            with: ListClubsModels.FetchRequest()
        )
    }
    
    func searchData(for text: String) {
        interactor.searchClubs(
            with: ListClubsModels.SearchRequest(text: text)
        )
    }
    
    func loadUI() {
        tableView.reloadData()
    }
}

// MARK: - VIP cycle

extension ListClubsViewController: ListClubsDisplayable {
    
    func displayFetchedClubs(with viewModel: ListClubsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
    
    func displaySearchedClubs(with viewModel: ListClubsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
}

// MARK: - Taps

extension ListClubsViewController {

    @IBAction func openBookmark(_ sender: Any) {
        router.showBookmark()
    }
}

// MARK: - Delegates

extension ListClubsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel?.clubs[indexPath.row] else { return }
        router.showClub(for: model.id)
    }
}

extension ListClubsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.clubs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListClubsTableViewCell
        guard let model = viewModel?.clubs[indexPath.row] else { return cell }
        cell.bind(model)
        return cell
    }
}

extension ListClubsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return loadData() }
        searchData(for: text)
    }
}

// MARK: - Helpers

private extension ListClubsViewController {
    
}
