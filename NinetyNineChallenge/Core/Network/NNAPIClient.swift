//
//  NNAPIClient.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation
import Alamofire

protocol NNAPIClientProtocol {
    func send<T: NNBaseAPIRequest>(_ request: T, _ completion: @escaping NNResponse<T.Response>)
}

class NNNetworkClient: NNAPIClientProtocol {
    func send<T>(_ request: T, _ completion: @escaping NNResponse<T.Response>) where T : NNBaseAPIRequest {
        AF.request(request.url).validate().responseData { response in
            debugPrint("RESPONSE for: \(request.url) -> \n\(response)")
            
            guard let data = response.data else {
                let err = NSError(domain: "Data not parsed correctly", code: 404, userInfo: [:])
                completion(.error(err))
                return
            }
            
            do {
                let parsedResponse = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(parsedResponse))
            } catch {
                let err = NSError(domain: "Error decoding data.", code: 401, userInfo: [:])
                completion(.error(err))
            }
            
        }
    }
}
