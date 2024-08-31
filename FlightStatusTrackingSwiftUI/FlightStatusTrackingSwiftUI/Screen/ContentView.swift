//
//  ContentView.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var flightVm = FlightViewModel()
    var body: some View {
        VStack {
            
            if flightVm.isLoading{
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
            }
            else{
                List(self.flightVm.flightDetailsArray, id: \.id) { items in
                    FlightDetailCell(flightDetails: items)
                        .onTapGesture(perform: {
                     
                            self.flightVm.updateActivity(details: items)
                        })
                        .onTapGesture(count: 2, perform: {
                            self.flightVm.stopActivity()
                        })
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
        }
        .task {
            
            try? await flightVm.getFlightDetails()
        }
    }
}

#Preview {
    ContentView()
}


