//
//  NNDetailFavouriteEntity.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

struct NNDetailFavouriteEntity: Codable {
    let name: String
    let hot: Int
    let ricCode: String
    let category: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case hot
        case ricCode
        case category
    }
}

extension NNDetailFavouriteEntity {
    func toDomain() -> NNFavourite {
        return NNFavourite(
            name: name,
            hotIndicator: hot,
            ricCode: ricCode,
            category: category
        )
    }
}
