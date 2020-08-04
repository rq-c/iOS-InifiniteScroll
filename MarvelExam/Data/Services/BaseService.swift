//
//  BaseService.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//


import Foundation
import Alamofire

struct ServiceMeta:Codable {
    var id_transaction:String
    var status:String
    var time_elapsed:String
}

struct  ErrorResponse: Codable {
    var errorCode:Int
    var userMessage:String
}

/// Default Alamofire request
class ServiceCallback {
    
    @discardableResult
    public static func performRequest<T:Decodable>(route:Router, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                            completion(response.result)
        }
    }
}
