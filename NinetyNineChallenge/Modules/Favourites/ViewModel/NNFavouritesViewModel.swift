//
//  FavouritesViewModel.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit

protocol NNFavouritesViewModelInput {
    func viewDidLoad()
    func getFavouritesList()
    func search(with keyword: String)
}

protocol NNFavouritesViewModelOutput {
    var favourites: Observable<[NNFavouriteCellModel]> { get }
    var filteredFavourites: Observable<[NNFavouriteCellModel]> { get }
}

typealias NNFavouritesViewModelDelegate = NNFavouritesViewModelOutput & NNFavouritesViewModelInput

final class NNFavouritesViewModel: NNFavouritesViewModelDelegate {
    
    // MARK: - Properties
    
    var favourites: Observable<[NNFavouriteCellModel]> = Observable([])
    var filteredFavourites: Observable<[NNFavouriteCellModel]> = Observable([])

    private let getFavouritesUseCase: NNFavouritesUseCase
    
    init(getFavouritesUseCase: NNFavouritesUseCase) {
        self.getFavouritesUseCase = getFavouritesUseCase
    }
    
    // MARK: - Delegate functions
    
    func viewDidLoad() {
        launch()
    }
    
    func getFavouritesList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.launch()
        }
    }
    
    func search(with keyword: String) {
        filteredFavourites.value = favourites.value.filter({ $0.name.lowercased().contains(keyword.lowercased()) || $0.category.lowercased().contains(keyword.lowercased()) })
    }
    
    // MARK: - Methods
    
    private func launch() {
        getFavouritesUseCase.execute { result in
            switch result {
            case .success(let model):
                self.favourites.value = self.map(model: model)
            case .error(_):
                self.favourites.value = []
            }
        }
    }
    
    private func map(model: NNFavourites) -> [NNFavouriteCellModel] {
        var output: [NNFavouriteCellModel] = []
        
        for item in model.favourites {
            output.append(NNFavouriteCellModel(
                            symbol: String(item.name.first ?? Character("")).uppercased(),
                            name: item.name.capitalized,
                            hotIndicator: item.hotIndicator,
                            ricCode: item.ricCode,
                            category: item.category,
                            isLiked: true))
        }
        
        output.sort(by: { $0.hotIndicator < $1.hotIndicator })
        
        return output
    }
}
