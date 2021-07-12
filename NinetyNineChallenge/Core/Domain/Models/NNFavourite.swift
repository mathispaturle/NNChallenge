//
//  NNFavourite.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

final class NNFavourite {
    let name: String
    let hotIndicator: Int
    let ricCode: String
    let category: String
    
    internal init(name: String, hotIndicator: Int, ricCode: String, category: String) {
        self.name = name
        self.hotIndicator = hotIndicator
        self.ricCode = ricCode
        self.category = category
    }
}
