//
//  NNCloudFavouritesDataSource.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

protocol NNCloudFavouritesDataSourceDelegate {
    func sendFavourites(_ completion: @escaping NNResponse<NNFavouritesEntity>)
    func sendFavouritesDetails(ids: [String], _ completion: @escaping NNResponse<[NNDetailFavouriteEntity]>)
    func getRealmFavourites(_ completion: @escaping NNResponse<[NNFavouriteRealm]>)
}

final class NNCloudFavouritesDataSource: NNCloudFavouritesDataSourceDelegate {
    
    private let apiClient: NNAPIClientProtocol
    private let detailApiClient: NNAPIClientProtocol
    
    init(apiClient: NNAPIClientProtocol, detailApiClient: NNAPIClientProtocol) {
        self.apiClient = apiClient
        self.detailApiClient = detailApiClient
    }
    
    func sendFavourites(_ completion: @escaping NNResponse<NNFavouritesEntity>) {
        
        let request = NNFavoritesQueryRequest()
        
        apiClient.send(request) { result in
            switch result {
            case .success(let response): completion(.success(response))
            case .error(let error): completion(.error(error))
            }
        }
    }
    
    func sendFavouritesDetails(ids: [String], _ completion: @escaping NNResponse<[NNDetailFavouriteEntity]>) {
        
        var favouritesDetail: [NNDetailFavouriteEntity] = []
        
        let dispatcher = DispatchGroup()
        
        for id in ids {
            dispatcher.enter()
            let request = NNFavouriteQueryRequest(id: id)
            
            detailApiClient.send(request) { result in
                switch result {
                case .success(let response):
                    favouritesDetail.append(response)
                    NNRealmManager.addFavourite(model: NNFavouriteRealm(from: response))
                case .error(_): break
                }
                dispatcher.leave()
            }
        }
        
        dispatcher.notify(queue: .main) {
            completion(.success(favouritesDetail))
        }
    }
    
    func getRealmFavourites(_ completion: @escaping NNResponse<[NNFavouriteRealm]>) {
        NNRealmManager.retrieveFavourites { result in
            switch result {
            case .success(let response): completion(.success(response))
            case .error(let error): completion(.error(error))
            }
        }
    }
}
