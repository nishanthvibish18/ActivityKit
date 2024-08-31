//
//  FlightApiResponseModel.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation
struct FlightApiResponseModel : Codable {
    let data : [FlightData]?
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([FlightData].self, forKey: .data)
    }

}
struct Flight : Codable {
    let number : String?
    let iata : String?
    let icao : String?
    let codeshared : String?

    enum CodingKeys: String, CodingKey {

        case number = "number"
        case iata = "iata"
        case icao = "icao"
        case codeshared = "codeshared"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try? values.decodeIfPresent(String.self, forKey: .number)
        iata = try? values.decodeIfPresent(String.self, forKey: .iata)
        icao = try? values.decodeIfPresent(String.self, forKey: .icao)
        codeshared = try? values.decodeIfPresent(String.self, forKey: .codeshared)
    }

}
struct Airline : Codable {
    let name : String?
    let iata : String?
    let icao : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case iata = "iata"
        case icao = "icao"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        iata = try? values.decodeIfPresent(String.self, forKey: .iata)
        icao = try? values.decodeIfPresent(String.self, forKey: .icao)
    }

}

struct Arrival : Codable {
    let airport : String?
    let timezone : String?
    let iata : String?
    let icao : String?
    let terminal : String?
    let gate : String?
    let baggage : String?
    let delay : Int?
    let scheduled : String?
    let estimated : String?
    let actual : String?
    let estimated_runway : String?
    let actual_runway : String?

    enum CodingKeys: String, CodingKey {

        case airport = "airport"
        case timezone = "timezone"
        case iata = "iata"
        case icao = "icao"
        case terminal = "terminal"
        case gate = "gate"
        case baggage = "baggage"
        case delay = "delay"
        case scheduled = "scheduled"
        case estimated = "estimated"
        case actual = "actual"
        case estimated_runway = "estimated_runway"
        case actual_runway = "actual_runway"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airport = try? values.decodeIfPresent(String.self, forKey: .airport)
        timezone = try? values.decodeIfPresent(String.self, forKey: .timezone)
        iata = try? values.decodeIfPresent(String.self, forKey: .iata)
        icao = try? values.decodeIfPresent(String.self, forKey: .icao)
        terminal = try? values.decodeIfPresent(String.self, forKey: .terminal)
        gate = try? values.decodeIfPresent(String.self, forKey: .gate)
        baggage = try? values.decodeIfPresent(String.self, forKey: .baggage)
        delay = try? values.decodeIfPresent(Int.self, forKey: .delay)
        scheduled = try? values.decodeIfPresent(String.self, forKey: .scheduled)
        estimated = try? values.decodeIfPresent(String.self, forKey: .estimated)
        actual = try? values.decodeIfPresent(String.self, forKey: .actual)
        estimated_runway = try? values.decodeIfPresent(String.self, forKey: .estimated_runway)
        actual_runway = try? values.decodeIfPresent(String.self, forKey: .actual_runway)
    }

}



struct FlightData : Codable {
    let flight_date : String?
    let flight_status : String?
    let departure : Departure?
    let arrival : Arrival?
    let airline : Airline?
    let flight : Flight?
    let aircraft : String?
    let live : String?

    enum CodingKeys: String, CodingKey {

        case flight_date = "flight_date"
        case flight_status = "flight_status"
        case departure = "departure"
        case arrival = "arrival"
        case airline = "airline"
        case flight = "flight"
        case aircraft = "aircraft"
        case live = "live"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flight_date = try? values.decodeIfPresent(String.self, forKey: .flight_date)
        flight_status = try? values.decodeIfPresent(String.self, forKey: .flight_status)
        departure = try? values.decodeIfPresent(Departure.self, forKey: .departure)
        arrival = try? values.decodeIfPresent(Arrival.self, forKey: .arrival)
        airline = try? values.decodeIfPresent(Airline.self, forKey: .airline)
        flight = try? values.decodeIfPresent(Flight.self, forKey: .flight)
        aircraft = try? values.decodeIfPresent(String.self, forKey: .aircraft)
        live = try? values.decodeIfPresent(String.self, forKey: .live)
    }

}


struct Departure : Codable {
    let airport : String?
    let timezone : String?
    let iata : String?
    let icao : String?
    let terminal : String?
    let gate : String?
    let delay : String?
    let scheduled : String?
    let estimated : String?
    let actual : String?
    let estimated_runway : String?
    let actual_runway : String?

    enum CodingKeys: String, CodingKey {

        case airport = "airport"
        case timezone = "timezone"
        case iata = "iata"
        case icao = "icao"
        case terminal = "terminal"
        case gate = "gate"
        case delay = "delay"
        case scheduled = "scheduled"
        case estimated = "estimated"
        case actual = "actual"
        case estimated_runway = "estimated_runway"
        case actual_runway = "actual_runway"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        airport = try? values.decodeIfPresent(String.self, forKey: .airport)
        timezone = try? values.decodeIfPresent(String.self, forKey: .timezone)
        iata = try? values.decodeIfPresent(String.self, forKey: .iata)
        icao = try? values.decodeIfPresent(String.self, forKey: .icao)
        terminal = try? values.decodeIfPresent(String.self, forKey: .terminal)
        gate = try? values.decodeIfPresent(String.self, forKey: .gate)
        delay = try? values.decodeIfPresent(String.self, forKey: .delay)
        scheduled = try? values.decodeIfPresent(String.self, forKey: .scheduled)
        estimated = try? values.decodeIfPresent(String.self, forKey: .estimated)
        actual = try? values.decodeIfPresent(String.self, forKey: .actual)
        estimated_runway = try? values.decodeIfPresent(String.self, forKey: .estimated_runway)
        actual_runway = try? values.decodeIfPresent(String.self, forKey: .actual_runway)
    }

}
