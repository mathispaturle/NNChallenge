//
//  NNFavouritesDataRepository.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//


final class NNFavouritesDataRepository: NNFavouritesRepository {
    
    private let dataSource: NNCloudFavouritesDataSourceDelegate
    
    init(dataSource: NNCloudFavouritesDataSourceDelegate) {
        self.dataSource = dataSource
    }
    
    func retrieveFavouritesList(completion: @escaping NNResponse<NNFavourites>) {
        
        self.dataSource.sendFavourites { result in
            switch result {
            case .success(let response):
                self.dataSource.sendFavouritesDetails(ids: response.result) { resultDetails in
                    switch resultDetails {
                    case .success(let responseDetails):
                        completion(.success(NNFavourites(favourites: responseDetails.compactMap({ $0.toDomain()}))))
                    case .error(let error): completion(.error(error))
                    }
                }
            case .error(_):
                self.dataSource.getRealmFavourites { result in
                    switch result {
                    case .success(let response):
                        completion(.success(NNFavourites(favourites: response.compactMap({ $0.toDomain() }))))
                    case .error(let error): completion(.error(error))
                    }
                }
            }
        }
        
    }
}
