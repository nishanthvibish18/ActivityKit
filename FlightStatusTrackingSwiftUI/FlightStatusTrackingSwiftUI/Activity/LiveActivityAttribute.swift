//
//  LiveActivityAttribute.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation
import ActivityKit

struct LiveActivityAttribute: ActivityAttributes{
    public typealias ActivityState = ContentState
    
    public struct ContentState: Codable, Hashable{
        var arrivalName: String
        var departureName: String
        var arrivalAirportName: String
        var departureAirportName: String
    }
    var title: String
}
