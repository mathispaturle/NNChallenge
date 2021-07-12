//
//  FavouriteDetailViewController.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit
import PureLayout

class FavouriteDetailViewController: UIViewController {

    private enum Constants {
        static let backButtonImageName: String = "arrow.backward"
        static let searchIconSize: CGSize = CGSize(width: 32, height: 32)
        static let ricCodeText: String = "Ric Code"
    }
    
    // MARK: - Properties
    private var tableView: UITableView?
    private var leftSearchBarButtonItem: UIBarButtonItem?
    private var cellCount = 2

    var model: NNFavouriteCellModel?
    
    // MARK: - Scene cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationUI()
        setupTableView()
    }
    
    // MARK: - UI

    fileprivate func setupNavigationUI() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: Constants.backButtonImageName)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: Constants.backButtonImageName)
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .main
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
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
        tableView?.separatorStyle = .none
        tableView?.showsVerticalScrollIndicator = false
        tableView?.register(cellType: TopExplanaitionCell.self)
        tableView?.register(cellType: FavouriteCell.self)
    }
}

extension FavouriteDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: FavouriteCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: model)
            return cell
        }
        return setupView(code: model?.ricCode ?? "")
    }
    
    fileprivate func setupView(code: String) -> UITableViewCell {
        let content = UITableViewCell()
        
        let ricCodeText = UILabel(forAutoLayout: ())
        let ricCode = UILabel(forAutoLayout: ())
        
        content.addSubview(ricCode)
        content.addSubview(ricCodeText)
        
        ricCodeText.font = .helveticaRegular16
        ricCode.font = .helveticaBold16
        
        ricCodeText.textColor = .systemGray4
        ricCode.textColor = .main

        ricCodeText.text = Constants.ricCodeText.uppercased()
        ricCode.text = code
        
        ricCodeText.autoPinEdge(.top, to: .top, of: content, withOffset: 16)
        ricCodeText.autoPinEdge(.leading, to: .leading, of: content, withOffset: 16)

        ricCode.autoPinEdge(.top, to: .top, of: ricCodeText)
        ricCode.autoPinEdge(.leading, to: .trailing, of: ricCodeText, withOffset: 8)

        return content
    }
}
