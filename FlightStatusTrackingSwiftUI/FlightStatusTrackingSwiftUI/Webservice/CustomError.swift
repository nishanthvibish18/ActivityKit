//
//  CustomError.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation

enum NetworkError: Error, LocalizedError{
    case URLNotFound
    case NoDataFound
    case DecodingError
    case ServerNotRechable
    case Timeout
    case Somethinghappened
    var localizedError: String{
        switch self {
        case .URLNotFound:
            return "URL is not found please check the url"
        case .NoDataFound:
            return "No Data found from the api"
        case .DecodingError:
            return "Data Decoding Error"
        case .ServerNotRechable:
            return "Server is not rechable at this moment, please try again later"
        case .Timeout:
            return "Server Timeout"
        case .Somethinghappened:
            return "Oops Something happened, Please try after sometimes"
        }
        
    }
}


