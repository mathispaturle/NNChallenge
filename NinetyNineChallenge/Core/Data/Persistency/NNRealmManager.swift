//
//  NNRealmManager.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 12/7/21.
//

import Foundation
import RealmSwift

final class NNRealmManager {
    
    public static func addFavourite(model: NNFavouriteRealm) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(model)
            }
        } catch {
            debugPrint("ERROR creating realm database.")
        }
    }
    
    public static func retrieveFavourites(_ completion: @escaping NNResponse<[NNFavouriteRealm]>) {
        do {
            let realm = try Realm()
            let favourites = realm.objects(NNFavouriteRealm.self)
            
            var response: [NNFavouriteRealm] = []
            for fav in favourites {
                response.append(fav)
            }
            
            completion(.success(response))
        } catch {
            debugPrint("ERROR creating realm database.")
            let err = NSError(domain: "Error decoding data.", code: 401, userInfo: [:])
            completion(.error(err))
        }
    }
}
