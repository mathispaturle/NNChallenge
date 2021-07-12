//
//  NNFavouriteQueryRequest.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

struct NNFavouriteQueryRequest: NNBaseAPIRequest {
    typealias Response = NNDetailFavouriteEntity
    
    var url: String {
        return "\(NNEndpoints.get_favourite_detail)\(self.id)"
    }
    
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}
