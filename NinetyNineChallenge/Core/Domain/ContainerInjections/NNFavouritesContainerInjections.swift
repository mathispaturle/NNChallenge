//
//  NNFavouritesContainerInjections.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

final class NNFavouritesContainerInjections {
    static func provideGetFavouritesUseCase() -> NNFavouritesUseCase {
        let repository = provideFavouritesRepository()
        return NNGetFavouritesStocks(repository: repository)
    }
    
    static func provideFavouritesRepository() -> NNFavouritesRepository {
        let dataSource = provideDataSource()
        return NNFavouritesDataRepository(dataSource: dataSource)
    }
    
    static func provideDataSource() -> NNCloudFavouritesDataSourceDelegate {
        let apiClient = NNNetworkClient()
        let detailApiClient = NNNetworkClient()
        return NNCloudFavouritesDataSource(apiClient: apiClient, detailApiClient: detailApiClient)
    }
    
}
