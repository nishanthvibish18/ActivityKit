//
//  FlightViewModel.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation
import Combine
import ActivityKit

@MainActor
class FlightViewModel: ObservableObject{
    
    @Published var flightDetailsArray : [FlightDetailCellListViewModel] = []
    @Published var isLoading: Bool = true
    var activityId = ""
    
//    MARK: Get Flight Details
    func getFlightDetails() async throws {
        do{
            
            let result = try await Webservice.sharedInstance.webRequest(apiRequestBuilder: APIRequestMethodService.FlightRequestService)
            
            if let resultData = result?.data{
                let resultModel = resultData.map(FlightDetailCellListViewModel.init)
                self.flightDetailsArray = resultModel
                self.isLoading = false
            }
        }
        catch let error{
            print(error)
        }
    }
    
    
    func updateActivity(details: FlightDetailCellListViewModel){
      let activityAttributes = LiveActivityAttribute(title: "Live Flight Status")
        let flightState = LiveActivityAttribute.ContentState(arrivalName: details.arrivalAirportCode, departureName: details.departureAirportCode, arrivalAirportName: details.arrivalAirportname, departureAirportName: details.departureAirportname)
        do{
            if let updateActivity = Activity<LiveActivityAttribute>.activities.filter({$0.id == activityId}).first{
                
                Task{
                    await updateActivity.update(using: flightState)
                }
                
            }
            else{
                
                let activity = try Activity<LiveActivityAttribute>.request(attributes: activityAttributes, contentState: flightState, pushType: nil)
                activityId = activity.id
            }
        }
        catch (let error){
            print("error activity:::\(error.localizedDescription)")
        }
    }
    
    
    
    
    func stopActivity(){
        do{
            Activity<LiveActivityAttribute>.activities.forEach { activity in
                Task{
                   await activity.end(using: activity.contentState, dismissalPolicy: .immediate)
                }
            }
        }
        catch (let error){
            print("error activity stop::: \(error.localizedDescription)")
        }
    }
    
}


struct FlightDetailCellListViewModel: Identifiable{
    let flightData: FlightData
    let id = UUID()
    
    var flightname: String{
        return flightData.airline?.name ?? ""
    }
    
    var flightNumber: String{
        return flightData.flight?.number ?? ""
    }
    var departureAirportCode: String{
        return flightData.departure?.iata ?? ""
    }
    var arrivalAirportCode: String{
        return flightData.arrival?.iata ?? ""
    }
    
    var arrivalAirportname: String{
        return flightData.arrival?.airport ?? ""
    }
    
    var departureAirportname: String{
        return flightData.departure?.airport ?? ""
    }
    
    var timing: String{
        return flightData.departure?.actual ?? ""
    }
    var flightStatus: String{
        return flightData.flight_status ?? ""
    }
    
}
