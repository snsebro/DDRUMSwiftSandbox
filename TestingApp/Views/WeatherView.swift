//
//  WeatherView.swift
//  TestingApp
//
//  Created by Shayne Sebro on 12/4/23.
//

import SwiftUI

struct WeatherView: View {
    @State private var selected = 1
    var weather: ResponseBody
    
//    var action: throws -> Void
    
    enum MyError: Error {
        case runtimeError(String)
    }
    
    func didTapButton() {
        fatalError("Crash the app")}
    
    func throwError () throws {
        throw MyError.runtimeError("basic error")
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack (alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size:40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                            .font(.system(size:50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 10)
                    
                    AsyncImage(url: URL(string: "https://imgix.datadoghq.com/img/gated-asset/Monitoring_Modern_Infra_LPG_assets_aws_solution_brief_form_header_1010x600.png?auto=compress,format")) { image in image.resizable().aspectRatio(contentMode: .fit).frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Button(
                        "Crash App",
                        action: didTapButton
                    )
//                    Button (
//                        "Throw Error",
//                        action: throwError
//                    )
//                    NavigationView{
//                        VStack {
//                            NavigationLink(destination: RUMS_2115_View()) {
//                                Text("go to RUMS_2115_View")
//                            }
//                        }
//                    }
//                    .padding()
//                    VStack {
//                        Picker(selection: $selected, label: Text("Radio Buttons")) {
//                                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pulvinar neque laoreet suspendisse interdum. Dui id ornare arcu odio ut sem. Eleifend quam adipiscing vitae proin sagittis nisl. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Mauris augue neque gravida in fermentum. Non odio euismod lacinia at quis risus sed. Nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae. Sit amet commodo nulla facilisi nullam vehicula ipsum a arcu. Sollicitudin tempor id eu nisl. Orci porta non pulvinar neque laoreet suspendisse interdum. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc. Eu lobortis elementum nibh tellus molestie nunc. Morbi tristique senectus et netus. Eget magna fermentum iaculis eu non diam phasellus. Congue mauris rhoncus aenean vel. Vulputate ut pharetra sit amet aliquam id diam Nibh sed pulvinar proin gravida hendrerit. Quam nulla porttitor massa id neque. Amet nisl suscipit adipiscing bibendum est ultricies. Vel risus commodo viverra maecenas. Sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Tristique magna sit amet purus gravida quis blandit turpis. Augue ut lectus arcu bibendum at. Pretium viverra suspendisse potenti nullam ac tortor vitae. Arcu felis bibendum ut tristique et egestas quis. Mi tempus imperdiet nulla malesuada pellentesque. Semper risus in hendrerit gravida rutrum quisque non tellus orci. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Magna ac placerat vestibulum lectus mauris ultrices. In nibh mauris cursus mattis. Tincidunt vitae semper quis lectus. Feugiat vivamus at augue eget arcu dictum. Est velit egestas dui id.").tag(1)
//                                        Text("Green").tag(2)
//                                        Text("Blue").tag(3)
//                                        Text("Other").tag(4)
//                                    }
//                        .pickerStyle(.segmented)
//                    }
//                    .padding()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                    
                    HStack{
                        WeatherRow(logo:"thermometer", name:"Min temp", value:(weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo:"thermometer", name:"Max temp", value:(weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo:"wind", name:"Wind Speed", value:(weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo:"humidity", name:"Humidity", value:(weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
//                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.746, saturation: 0.735, brightness: 0.745))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.746, saturation: 0.735, brightness: 0.745))
        .padding()
        .preferredColorScheme(.dark)
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
}
