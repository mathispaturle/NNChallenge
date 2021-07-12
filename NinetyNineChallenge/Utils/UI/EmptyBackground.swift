//
//  EmptyBackground.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit

final class EmptyBackground {
    
    private enum Constants {
        
    }
    
    private let imageHeader: UIImage
    private let titleHeader: String
    private let descriptionHeader: String
    
    init(imageHeader: UIImage,
         titleHeader: String,
         descriptionHeader: String) {
        self.imageHeader = imageHeader
        self.titleHeader = titleHeader
        self.descriptionHeader = descriptionHeader
    }
}
