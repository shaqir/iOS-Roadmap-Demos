//
//  ContentView.swift
//  WeatherSwiftUIApp
//
//  Created by Sakir Saiyed on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: Color("lightBlue"),
                           bottomColor: Color("grey"))
            
            VStack(spacing: 16){
                
                CityWeatherView(cityName: "Edmonton, CA",
                                temperature: 78,
                                imgName: "cloud.sun.fill")
                
                HStack(spacing: 16){
                    WeatherDayView(dayOfweek: "MON",
                                   imgName: "cloud.sun.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfweek: "TUE",
                                   imgName: "wind",
                                   temperature: 20)
                    WeatherDayView(dayOfweek: "WED",
                                   imgName: "cloud.fog.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfweek: "THU",
                                   imgName: "sun.dust.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfweek: "FRI",
                                   imgName: "sun.rain.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfweek: "SAT",
                                   imgName: "snowflake",
                                   temperature: 20)
                    
                }
                Spacer()
                
                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white, action: {
                    
                    print("Tapped")
                })
                
                
                Spacer()
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfweek: String
    var imgName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfweek)
                .foregroundColor(.white)
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°F")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
                .background(Color.blue.opacity(0.2))
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityWeatherView: View {
    
    var cityName: String
    var temperature: Int
    var imgName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .background(Color.blue.opacity(0.2))
        Text("\(temperature)°F")
            .font(.system(size: 60, weight: .medium, design: .default))
            .foregroundColor(.white)
            .background(Color.blue.opacity(0.2))
        VStack{
            Image(systemName: imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        }
        .padding(.bottom, 32)
        
    }
}
