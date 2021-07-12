//
//  NNFavoritesQueryRequest.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

struct NNFavoritesQueryRequest: NNBaseAPIRequest {
    typealias Response = NNFavouritesEntity
    
    var url: String {
        return NNEndpoints.get_favourites
    }
    
    init() { }
}
