//
//  Router.swift
//  MarvelExam
//
//  Created by Ramón Quiñonez on 05/01/20.
//  Copyright © 2020 Ramón Quiñonez. All rights reserved.
//

import Foundation
import Alamofire

protocol Configuration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}


enum Router: Configuration {

    case getCharacters(request: GetCharactersRequest)

    // MARK: - HTTPMethod
    internal var method: HTTPMethod {
       switch self {
       case .getCharacters:
           return .get
       }
   }

   // MARK: - Path
   internal var path: String {
       switch self {
       case .getCharacters:
        return Constants.EndPoint.getCharacteres
       }
   }
    
    func encodeParamters<T:Codable>(request: T) -> Parameters{
        let encoder = JSONEncoder()
        guard let json = try? encoder.encode(request),
            let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else { return [:] }
        return dict
    }

   // MARK: - Parameters
   internal var parameters: Parameters? {
       switch self {
       case .getCharacters(let request):
        return encodeParamters(request: request)
//            [
//            "ts": request.ts,
//            "apikey": request.apikey,
//            "hash": request.hash,
//            "limit": request.limit
//        ]
       }
   }
    
    // MARK: - Encoding
    internal var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
       
    

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
       let url = try Constants.Server.baseURL.asURL()
       var urlRequest = URLRequest(url: url.appendingPathComponent(path))
       
       // HTTP Method
       urlRequest.httpMethod = method.rawValue
       
       // Common Headers
       urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
       urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
       
        do {
            urlRequest = try encoding.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
       return urlRequest
    }
}
