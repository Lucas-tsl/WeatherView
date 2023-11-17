//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Lucas- Troteseil on 13/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Angers")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 7 :  12)
                
                HStack(spacing: 20){
                    
                    WeatherDayView(dayOfWeek: "Mardi", imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", temperature: isNight ? 6 : 13)
                    
                    WeatherDayView(dayOfWeek: "Mercredi", imageName: isNight ? "moon.fill" : "sun.rain.fill", temperature: isNight ? 5 : 13)
                    
                    WeatherDayView(dayOfWeek: "Jeudi", imageName: isNight ? "moon.fill" : "sun.rain.fill", temperature: isNight ? 8 : 14)
                    
                    WeatherDayView(dayOfWeek: "Vendredi", imageName: isNight ? "moon.stars.fill" : "sun.haze.fill", temperature: isNight ? 7 : 16)
                    
                    WeatherDayView(dayOfWeek: "Samedi", imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: isNight ? 10 : 18)
                    
                                        
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue, 
                                  backgroundColor: .white)
                    
                }
                Spacer()
                
            
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(.white)
        }
    }
}



struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

 

struct CityTextView : View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView : View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 40)
    }
}

 
