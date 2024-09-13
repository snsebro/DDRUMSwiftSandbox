//
//  WelomeView.swift
//  TestingApp
//
//  Created by Shayne Sebro on 12/4/23.
//

import SwiftUI
import CoreLocationUI

struct WelomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Location Testing")
                    .bold().font(.title)
                Text("App to Test Basic Location Sharing")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .tint(Color(hue: 0.746, saturation: 0.559, brightness: 0.892))
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelomeView()
    }
}
