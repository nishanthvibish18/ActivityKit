//
//  APIRequestMethodService.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation


struct APIRequestMethodService{
    
    static var FlightRequestService: APIBuilderService<FlightApiResponseModel>{
        return APIBuilderService(baseURL: APIURL.Constants().FlightListAPI)
    }
}
