//
//  NNFavouritesRepository.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

protocol NNFavouritesRepository {
    func retrieveFavouritesList(completion: @escaping NNResponse<NNFavourites>)
}
