//
//  NNFavouritesUseCase.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

protocol NNFavouritesUseCase {
    func execute(completion: @escaping NNResponse<NNFavourites>)
}

final class NNGetFavouritesStocks: NNFavouritesUseCase {
    
    private let repository: NNFavouritesRepository
    
    init(repository: NNFavouritesRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping NNResponse<NNFavourites>) {
        repository.retrieveFavouritesList { result in
            switch result {
            case .success(let model): completion(.success(model))
            case .error(let error): completion(.error(error))
            }
        }
    }
}
