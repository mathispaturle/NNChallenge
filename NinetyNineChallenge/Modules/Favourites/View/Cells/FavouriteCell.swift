//
//  FavouriteCell.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

import UIKit

class FavouriteCell: UITableViewCell, NibReusable {

    private enum Constants {
        static let heartEmpty: String = "heart"
        static let heartFill: String = "heart.fill"
        static let indicatorDetail: String = "Hot Stock"
    }
    
    // MARK: - Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var favSymbol: UILabel!
    @IBOutlet private weak var favTitle: UILabel!
    @IBOutlet private weak var favCategory: UILabel!
    @IBOutlet private weak var favHotStockDetail: UILabel!
    @IBOutlet private weak var favHotStockIndicator: UILabel!
    @IBOutlet private weak var favLikedButton: UIButton!

    private var delegate: NNFavouritesViewDelegate?
    private var id: Int = 0
    
    // MARK: - Scene cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - UI

    fileprivate func setupUI() {
        containerView.layer.cornerRadius = containerView.frame.width * 0.5
        containerView.clipsToBounds = true
        
        favSymbol.font = .helveticaBold20
        favTitle.font = .helveticaBold16
        favCategory.font = .helveticaRegular14
        favHotStockDetail.font = .helveticaRegular10
        favHotStockIndicator.font = .helveticaBold12
        
        favSymbol.textColor = .white
        favTitle.textColor = .main
        favCategory.textColor = .systemGray3
        favHotStockDetail.textColor = .systemGray3
        favHotStockIndicator.textColor = .main
        
        favLikedButton.tintColor = .systemPink
        favLikedButton.setImage(UIImage(systemName: Constants.heartFill), for: .normal)
        favLikedButton.setTitle("", for: .normal)
        
        selectionStyle = .none
    }
    
    public func configure(with model: NNFavouriteCellModel? = nil, delegate: NNFavouritesViewDelegate, id: Int, isSearchMode: Bool) {
        favSymbol.text = model?.symbol
        favTitle.text = model?.name
        favCategory.text = model?.category
        favHotStockDetail.text = Constants.indicatorDetail
        favHotStockIndicator.text = String(model?.hotIndicator ?? 0)
        
        favLikedButton.isHidden = isSearchMode
        
        self.delegate = delegate
        self.id = id
    }
    
    public func configure(with model: NNFavouriteCellModel? = nil) {
        favSymbol.text = model?.symbol
        favTitle.text = model?.name
        favCategory.text = model?.category
        favHotStockDetail.text = Constants.indicatorDetail
        favHotStockIndicator.text = String(model?.hotIndicator ?? 0)
    }
    
    // MARK: - Actions
    
    @IBAction fileprivate func favLikedAction(_ sender: UIButton) {
        delegate?.removeItem(with: id)
    }
}
