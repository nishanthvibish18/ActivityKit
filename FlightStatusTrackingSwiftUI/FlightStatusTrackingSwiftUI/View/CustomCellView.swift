//
//  CustomCellView.swift
//  FlightStatusTrackingSwiftUI
//
//  Created by Nishanth on 31/08/24.
//

import Foundation
import SwiftUI


//MARK: Flight Details Cell
struct FlightDetailCell: View {
    @State private var isAnimate: Bool = false
    let flightDetails: FlightDetailCellListViewModel
    var body: some View {
        HStack(alignment: .center) {
            FlightDetailsView(airportname: flightDetails.departureAirportname, code: flightDetails.departureAirportCode, flightIcon: "airplane.departure")
                .frame(width: 100)
            
            Spacer()
            
            VStack(spacing: 8) {
                HStack(alignment: .center,spacing: 10, content: {
                    Text("-------")
                        .font(.system(size: 10, weight:.regular))
                        .foregroundStyle(Color.gray)
                    
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(LinearGradient(colors: [Color.black,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Text("-------")
                        .font(.system(size: 10, weight:.regular))
                        .foregroundStyle(Color.gray)
                    
                    
                })
                
                Text("1 h 25 min, 11: 15 AM")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
            }
            
            Spacer()
            
            FlightDetailsView(airportname: flightDetails.arrivalAirportname, code: flightDetails.arrivalAirportCode, flightIcon: "airplane.arrival")
                .frame(width: 100)
            
            
        }
        .padding(.horizontal, 2)
        .padding(.bottom, 10)
        .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(
            
            LinearGradient(colors: [Color.blue, Color.black], startPoint: isAnimate ? .topLeading : .bottomLeading, endPoint:  isAnimate ? .bottomTrailing :  .topTrailing))
            .onAppear(perform: {
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: true)) {
                    self.isAnimate.toggle()
                }
            })
                .shadow(color: Color.black.opacity(0.8), radius: 1, x: 2, y: 3))
    }
}


//MARK: Flight Details View
struct FlightDetailsView: View {
    let airportname: String
    let code: String
    let flightIcon: String
    var body: some View {
        VStack(alignment: .center) {
            Text(code)
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [Color.white,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Image(systemName: flightIcon)
                .resizable()
                .frame(width: 30,height: 30)
                .foregroundStyle(LinearGradient(colors: [Color.white,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.bottom, 5)
            
            Text(airportname)
                .font(.system(size: 12))
                .foregroundStyle(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .padding(.horizontal, 3)
        .padding(.vertical, 20)
    }
}
