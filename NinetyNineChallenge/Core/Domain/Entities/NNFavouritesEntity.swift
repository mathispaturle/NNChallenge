//
//  NNFavouritesEntity.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

struct NNFavouritesEntity: Codable {
    let result: [String]
    
    private enum CodingKeys: String, CodingKey {
        case result
    }
}
