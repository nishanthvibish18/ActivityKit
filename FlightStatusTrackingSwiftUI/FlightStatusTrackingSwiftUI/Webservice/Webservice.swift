//
//  Webservice.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation

struct APIURL{
    struct Constants{
        var FlightListAPI = "https://api.aviationstack.com/v1/flights?access_key="
        var AirportAPI = "https://api.aviationstack.com/v1/airports?access_key="
    }
}

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
    case patch = "PATCH"
}

class Webservice{
    static let sharedInstance = Webservice()
    
    private init(){}
    
    func webRequest<T>(apiRequestBuilder: APIBuilderService<T>) async throws -> T?{
        
        do{
            guard let urlstring = URL(string: apiRequestBuilder.baseURL) else {
                throw NetworkError.URLNotFound
            }
            var urlRequest = URLRequest(url: urlstring)
            urlRequest.httpMethod = apiRequestBuilder.httpMethod.rawValue
            urlRequest.allHTTPHeaderFields = ["Content-Type":"application/json"]
            if apiRequestBuilder.jsonBody != nil{
                urlRequest.httpBody = apiRequestBuilder.jsonBody
            }
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let status = response as? HTTPURLResponse, status.statusCode == 200 else{
                throw NetworkError.ServerNotRechable
            }
            do{
                return try JSONDecoder().decode(T.self, from: data)
            }
            catch{
                throw NetworkError.DecodingError
            }
            
        }
        catch{
            throw NetworkError.Somethinghappened
        }
        
    }
}

