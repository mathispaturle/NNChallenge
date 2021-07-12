//
//  NNFavouritesServiceLocator.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

final class NNFavouritesServiceLocator {
    static func provideViewController() -> NNFavouritesViewController {
        let viewController = NNFavouritesViewController()
        viewController.viewModel = provideViewModel()
        return viewController
    }
    
    private static func provideViewModel() -> NNFavouritesViewModelDelegate {
        let getFavourites = NNFavouritesContainerInjections.provideGetFavouritesUseCase()
        return NNFavouritesViewModel(getFavouritesUseCase: getFavourites)
    }
}
