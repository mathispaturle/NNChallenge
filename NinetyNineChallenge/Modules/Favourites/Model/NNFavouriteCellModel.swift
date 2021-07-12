//
//  NNFavouriteCellModel.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

import Foundation

class NNFavouriteCellModel {
    let symbol: String
    let name: String
    let hotIndicator: Int
    let ricCode: String
    let category: String
    let isLiked: Bool
    
    internal init(symbol: String, name: String, hotIndicator: Int, ricCode: String, category: String, isLiked: Bool) {
        self.symbol = symbol
        self.name = name
        self.hotIndicator = hotIndicator
        self.ricCode = ricCode
        self.category = category
        self.isLiked = isLiked
    }
}
