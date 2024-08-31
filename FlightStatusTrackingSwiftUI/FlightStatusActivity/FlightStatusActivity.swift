//
//  FlightStatusActivity.swift
//  FlightStatusActivity
//
//  Created by Nishanth on 31/08/24.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct FlightStatusActivity: Widget{
    
    var body: some WidgetConfiguration{
        ActivityConfiguration(for: LiveActivityAttribute.self) { context in
            ActivityFlightView(context: context)
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Text("Flight Status Check")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.yellow)
                }
            } compactLeading: {
                Image(systemName: "airplane.departure")
                    .foregroundStyle(Color.yellow)
            } compactTrailing: {
                Image(systemName: "airplane.arrival")
                    .foregroundStyle(Color.yellow)
            } minimal: {
                Text("")
            }

        }

    }
    
}



struct ActivityFlightView: View {
    let context: ActivityViewContext<LiveActivityAttribute>
    var body: some View {
        HStack(alignment: .center, content: {
            VStack(alignment: .leading, content: {
                Text(context.state.departureName)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundStyle(Color.yellow)


                Image(systemName: "airplane.departure")
                    .resizable()
                    .frame(width: 18,height: 18)
                    .foregroundStyle(Color.yellow)
            })
            
            Spacer()
            
            VStack(alignment: .center, content: {
                Text(context.state.departureAirportName)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.yellow)
                
                Text("To")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.yellow)
                    .padding(.vertical, 2)
                
                Text(context.state.arrivalAirportName)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.yellow)
            })
            
            Spacer()
            
            VStack(alignment: .leading, content: {
                Text(context.state.arrivalName)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundStyle(Color.yellow)

                
                Image(systemName: "airplane.arrival")
                    .resizable()
                    .frame(width: 18,height: 18)
                    .foregroundStyle(Color.yellow)
            })
            
        })
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        .activityBackgroundTint(Color.black)
    }
}
