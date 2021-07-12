//
//  NNFavouriteRealm.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation
import RealmSwift

class NNFavouriteRealm: Object {
    @Persisted var name: String = ""
    @Persisted var hotIndicator: Int = 0
    @Persisted var ricCode: String = ""
    @Persisted var category: String = ""
    
    override init() {
        
    }
    
    internal init(from model: NNDetailFavouriteEntity) {
        self.name = model.name
        self.hotIndicator = model.hot
        self.ricCode = model.ricCode
        self.category = model.category
    }
}

extension NNFavouriteRealm {
    func toDomain() -> NNFavourite {
        return NNFavourite(
            name: name,
            hotIndicator: hotIndicator,
            ricCode: ricCode,
            category: category)
    }
}
