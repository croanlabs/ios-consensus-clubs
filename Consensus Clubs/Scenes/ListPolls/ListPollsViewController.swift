//
//  ListPollsViewController.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-18.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit
import CompanyCore

class ListPollsViewController: BaseListPollsViewController {
    
    // MARK: - Controls
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(
                UINib(nibName: String(describing: ListPollsTableViewCell.self), bundle: nil),
                forCellReuseIdentifier: cellReuseIdentifier
            )
        }
    }
    
    private lazy var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.hidesNavigationBarDuringPresentation = false
        $0.dimsBackgroundDuringPresentation = false
        $0.searchBar.placeholder = "Search polls..."
        return $0
    }(UISearchController(searchResultsController: nil))
    
    // MARK: - VIP variables
    
    private lazy var interactor: ListPollsBusinessLogic = ListPollsInteractor(
        presenter: ListPollsPresenter(viewController: self),
        pollsWorker: PollsWorker(store: PollsMemoryStore())
    )
    
    private lazy var router: ListPollsRoutable = ListPollsRouter(
        viewController: self
    )
    
    // MARK: - View models
    
    private var viewModel: ListPollsModels.ViewModel?
    
    // MARK: - Internal variables
    
    private let cellReuseIdentifier = "Cell"
    
    // MARK: - Controller cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
//        loadData()
    }
}

// MARK: - Events

private extension ListPollsViewController {
    
    func configure() {
//        navigationItem.hidesSearchBarWhenScrolling = false
//        navigationItem.searchController = searchController
    }
    
    func loadData() {
        interactor.fetchPolls(
            with: ListPollsModels.FetchRequest()
        )
    }
    
    func searchData(for text: String) {
        interactor.searchPolls(
            with: ListPollsModels.SearchRequest(text: text)
        )
    }
    
    func loadUI() {
        tableView.reloadData()
    }
}

// MARK: - VIP cycle

extension ListPollsViewController: ListPollsDisplayable {
    
    func displayFetchedPolls(with viewModel: ListPollsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
    
    func displaySearchedPolls(with viewModel: ListPollsModels.ViewModel) {
        self.viewModel = viewModel
        loadUI()
    }
}

// MARK: - Taps

extension ListPollsViewController {

    @IBAction func openBookmark(_ sender: Any) {
        router.showBookmark()
    }
}

// MARK: - Delegates

extension ListPollsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel?.polls[indexPath.row] else { return }
        router.showPoll(for: model.id)
    }
}

extension ListPollsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.polls.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListPollsTableViewCell
        guard let model = viewModel?.polls[indexPath.row] else { return cell }
        cell.bind(model)
        return cell
    }
}

extension ListPollsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return loadData() }
        searchData(for: text)
    }
}

// MARK: - Helpers

private extension ListPollsViewController {
    
}
