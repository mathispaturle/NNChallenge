//
//  NNResponse.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation

typealias  NNResponse<Value> = ((NNResult<Value, NSError>) -> Void)

enum NNResult<T, U> {
    case success(T)
    case error(U)
}
