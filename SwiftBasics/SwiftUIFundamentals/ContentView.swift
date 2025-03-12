//
//  ContentView.swift
//  SwiftUIFundamentals
//
//  Created by Mark Dubouzet on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
             
            VStack(spacing: 10) {
                CityTextView(cityName: "Austin, TX")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      tempVal: "70")
            
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 70)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 70)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 70)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 70)
                    
                }
                
                Spacer()
                
                Button {
                    // Action
                    isNight = !isNight
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: Color.blue, backgroundColor: .white)
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
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundStyle(.red, .white, .blue)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(   .white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [isNight ? .black : Color.blue, isNight ? .gray: Color("lightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
        
        // Alternate Gradient
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var tempVal: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(tempVal)
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

