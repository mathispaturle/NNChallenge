//
//  TopExplanaitionCell.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

import UIKit

class TopExplanaitionCell: UITableViewCell, NibReusable {

    private enum Constants {
        static let cornerRadius: CGFloat = 4.0
        static let title: String = "Welcome!"
        static let description: String = "Ninety Nine Challenge App"
        static let explanation: String = "• View your favourites\n• Delete by tapping on heart\n• Refresh by scrolling to top"
    }
    
    // MARK: - Properties
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var explanationLabel: UILabel!

    
    // MARK: - Scene cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - UI

    fileprivate func setupUI() {
        cardView.backgroundColor = .systemBlue
        cardView.layer.cornerRadius = Constants.cornerRadius
        cardView.clipsToBounds = true
        
        titleLabel.font = .helveticaBold24
        descriptionLabel.font = .helveticaRegular16
        
        titleLabel.textColor = .white
        descriptionLabel.textColor = .white
        
        titleLabel.text = Constants.title
        descriptionLabel.text = Constants.description
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.helveticaRegular16,
            .foregroundColor: UIColor.white
        ]
        
        let mutableAttributedString: NSMutableAttributedString = NSMutableAttributedString(
            string: Constants.explanation,
            attributes: attributes
        )
        
        explanationLabel.attributedText = mutableAttributedString
    }
    
}
