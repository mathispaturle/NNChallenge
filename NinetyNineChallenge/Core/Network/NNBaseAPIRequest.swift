//
//  NNBaseAPIRequest.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

protocol NNBaseAPIRequest: Encodable {
    associatedtype Response: Decodable
    
    var url: String { get }
}
