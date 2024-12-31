//
//  APIBuilderService.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation

class APIBuilderService<T: Codable>{
    var baseURL: String
    var jsonBody: Data? = nil
    var httpMethod: HTTPMethod = .get
    init(baseURL: String) {
        self.baseURL = baseURL
    }
}
