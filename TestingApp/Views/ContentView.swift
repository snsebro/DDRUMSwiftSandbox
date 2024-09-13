//
//  ContentView.swift
//  TestingApp
//
//  Created by Shayne Sebro on 12/4/23.
//

import SwiftUI
import DatadogRUM

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.746, saturation: 0.735, brightness: 0.745))
        .padding()
        .preferredColorScheme(.dark)
        .trackRUMView(name: "Content View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
