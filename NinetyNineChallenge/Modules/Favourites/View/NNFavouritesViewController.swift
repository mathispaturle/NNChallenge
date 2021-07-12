//
//  NNFavouritesViewController.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit
import PureLayout

protocol NNFavouritesViewDelegate {
    func removeItem(with id: Int)
}

class NNFavouritesViewController: UIViewController {

    private enum Constants {
        static let favouritesText: String = "Tus favoritos"
        static let searchAltText: String = "Search"
        static let searchIconName: String = "searchIcon"
        static let searchIconSize: CGSize = CGSize(width: 20, height: 20)
        static let animationDuration: Double = 0.15
    }
    
    // MARK: - Properties
    var viewModel: NNFavouritesViewModelDelegate?
    
    private var tableView: UITableView?
    let refreshControl = UIRefreshControl()
    private var searchBar = UISearchBar()
    private var searchBarButtonItem: UIBarButtonItem?
    private var rightSearchBarButtonItem: UIBarButtonItem?
    private var tableSize = 0
    private var hasTopExplanation: Bool = true
    private var isSearchMode: Bool = false
    
    // MARK: - Scene cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)

        viewModel?.viewDidLoad()
        
        setupUI()
        setupTableView()
        setupRefreshControl()
        setupSearchBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = Constants.favouritesText
    }
    
    private func bind(to model: NNFavouritesViewModelOutput?) {
        viewModel?.favourites.observe(on: self) { [weak self] _ in
            self?.tableSize = (self?.viewModel?.favourites.value.count ?? 0) + 1
            self?.tableView?.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        
        viewModel?.filteredFavourites.observe(on: self, observerBlock: { [weak self] _ in
            if ((self?.isSearchMode) != nil) {
                self?.tableSize = self?.viewModel?.filteredFavourites.value.count ?? 0
                self?.tableView?.reloadSections(IndexSet(integer: 0), with: .fade)
            }
        })
    }
    
    deinit {
        viewModel?.favourites.remove(observer: self)
        viewModel?.filteredFavourites.remove(observer: self)
    }

    // MARK: - UI
    fileprivate func setupUI() {
        view.backgroundColor = .white
        setupUINavigationController()
        setupTableView()
    }
    
    fileprivate func setupUINavigationController() {
        navigationController?.navigationBar.topItem?.title = Constants.favouritesText
        navigationController?.navigationBar.barTintColor = .white
        
        guard let image = UIImage(named: Constants.searchIconName)?.scalePreservingAspectRatio(targetSize: Constants.searchIconSize).withRenderingMode(.alwaysOriginal) else {
            rightSearchBarButtonItem = UIBarButtonItem(title: Constants.searchAltText, style: .plain, target: self, action: #selector(searchButtonAction))
            navigationItem.setRightBarButton(rightSearchBarButtonItem, animated: false)
            return
        }
        rightSearchBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchButtonAction))
        navigationItem.setRightBarButton(rightSearchBarButtonItem, animated: false)
    }
    
    // MARK: - Properties setup
    
    fileprivate func setupTableView() {
        
        tableView = UITableView(frame: CGRect.zero)
        if tableView != nil {
            view.addSubview(tableView!)
        }
        tableView?.autoPinEdgesToSuperviewEdges()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = UITableView.automaticDimension
        tableView?.tableFooterView = UIView()
        tableView?.separatorColor = .systemGray4
        tableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
        tableView?.showsVerticalScrollIndicator = false
        tableView?.register(cellType: TopExplanaitionCell.self)
        tableView?.register(cellType: FavouriteCell.self)
    }
    
    fileprivate func setupRefreshControl() {
        refreshControl.endRefreshing()
        refreshControl.backgroundColor = .white
        refreshControl.tintColor = .systemGray4
        refreshControl.addTarget(self, action: #selector(reloadTableView) , for: .valueChanged)
        tableView?.insertSubview(refreshControl, at: 0)
    }
    
    fileprivate func setupSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBarButtonItem = navigationItem.rightBarButtonItem
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = .done
    }
    
    // MARK: - Actions setup
    @objc
    fileprivate func reloadTableView() {
        refreshControl.beginRefreshing()
        viewModel?.getFavouritesList()
    }
    
    @objc
    fileprivate func searchButtonAction() {
        showSearchBar()
    }
    
    fileprivate func navigateToDetail(data: NNFavouriteCellModel? = nil) {
        let detail = FavouriteDetailViewController()
        detail.title = data?.name ?? ""
        detail.model = data
        navigationController?.pushViewController(detail, animated: true)
    }
    
    fileprivate func showSearchBar() {
        isSearchMode = true
        tableSize = 0
        tableView?.reloadSections(IndexSet(integer: 0), with: .fade)
        self.searchBar.text = ""
        searchBar.alpha = 0
        navigationItem.titleView = searchBar
        navigationItem.setRightBarButton(nil, animated: true)
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            self.searchBar.alpha = 1
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    fileprivate func hideSearchBar() {
        isSearchMode = false
        tableSize = (viewModel?.favourites.value.count ?? 0 ) + 1
        
        tableView?.reloadSections(IndexSet(integer: 0), with: .fade)

        navigationItem.titleView = nil
        navigationItem.setRightBarButton(rightSearchBarButtonItem, animated: true)
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            self.searchBar.alpha = 0
            self.navigationController?.navigationBar.topItem?.title = Constants.favouritesText
        }, completion: { finished in
            self.searchBar.resignFirstResponder()
        })
    }
}

extension NNFavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && hasTopExplanation && !isSearchMode {
            let cell: TopExplanaitionCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
        
        refreshControl.endRefreshing()

        let cell: FavouriteCell = tableView.dequeueReusableCell(for: indexPath)
        let index = indexPath.row + ((hasTopExplanation && !isSearchMode) ? -1 : 0)
        
        let model = isSearchMode ? viewModel?.filteredFavourites.value[index] : viewModel?.favourites.value[index]
        
        cell.configure(with: model, delegate: self, id: indexPath.row, isSearchMode: isSearchMode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row + ((hasTopExplanation && !isSearchMode) ? -1 : 0)
        
        let model = isSearchMode ? viewModel?.filteredFavourites.value[index] : viewModel?.favourites.value[index]
        
        navigateToDetail(data: model)
    }
}

extension NNFavouritesViewController: NNFavouritesViewDelegate {
    func removeItem(with id: Int) {
        let newId = id + ((hasTopExplanation && !isSearchMode) ? -1 : 0)
        viewModel?.favourites.value.remove(at: newId)
    }
}

extension NNFavouritesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.search(with: searchText)
    }
}
