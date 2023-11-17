//
//  WeatherButton.swift
//  SwiftUI-weather
//
//  Created by Lucas- Troteseil on 16/11/2023.
//



import SwiftUI

struct WeatherButton: View {
    
    var title : String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 25, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
