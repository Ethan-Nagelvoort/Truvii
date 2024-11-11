//
//  planningView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 6/11/24.
//

import SwiftUI

struct planningView: View {
    @State public var initials = "MV"
    @State public var name = "Megan V."
    @State public var city = "Berlin"
    @State public var country = "Germany"
    @State public var startingMonth = 5
    @State public var startingDay = 26
    @State public var endingMonth = 6
    @State public var endingDay = 10
    @State public var numberOfDays = 16
    @State public var others = 4
    @State public var departure = "SAN 9:00 AM"
    @State public var arrival = "BER 1:00 PM"
    @State public var rental = "1 rental car booked"
    @State public var hotel = "1 Airbnb booked"
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    @State public var iconColor = Color(.sRGB, red: 0.94, green: 0.91, blue: 0.86)
    @State public var dayNumber = 15
    @State public var numberOfEvents = 5 //includes calendar
    @State public var showingPopup = false
    @State public var disablePress = true
    @State public var popupText = "info"
    @State public var dates = ["Tuesday, 5/25","Wednesday, 5/26","Thursday, 5/27","Friday, 5/28","Saturday, 5/29",
                               "Sunday, 5/30","Monday, 6/1", "Tuesday, 6/2","Wednesday, 6/3","Thursday 6/4",
                               "Friday 6/5","Saturday, 6/6","Sunday, 6/7","Monday, 6/8","Tuesday, 6/9","Wednesday, 6/10"]
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("PLANNING")
                    .font(.custom("Krub", fixedSize: 60))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 40)
                Image("Belgium")
                    .resizable()
                    .frame(width: 500, height: 140)
                    .ignoresSafeArea()
                    .offset(y: 40)
                    .overlay(alignment: .bottom){
                        ZStack{
                            Circle()
                                .stroke(.black, lineWidth: 5)
                                .fill(iconColor)
                                .frame(width: 90, height: 90)
                            Text(initials)
                                .frame(width: 100, height: 100)
                                .font(.title)
                        }
                        .offset(x: -130, y: 80)
                        if(others > 0) {
                            Text(name + " + " + "\(others) others")
                                .offset(x: 20, y: 110)
                                .foregroundColor(.white)
                        }
                    }
                Text(city + ", " + country + " (\(startingMonth)/\(startingDay) - \(endingMonth)/\(endingDay))")
                    .frame(maxHeight: .infinity)
                    .offset(x: 0, y: 80)
                    .font(Font.system(size:25))
                    .foregroundColor(.white)
                HStack {
                    Image("plane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 60)
                        .ignoresSafeArea()
                    Text(departure + " - " + arrival)
                        .frame(maxHeight: .infinity)
                        .font(Font.system(size:25))
                        .foregroundColor(.white)
                    Button(">"){
                        withAnimation(.linear(duration: 0.50)){
                            showingPopup = true
                            popupText = "plane info"
                            disablePress = false
                        }
                    }
                        .font(Font.system(size:22))
                        .foregroundColor(.white)
                        .frame(width: 20, height: 100)
                }
                .offset(x: 0, y: 60)
                HStack {
                    Image("car")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 60)
                        .ignoresSafeArea()
                    Text(rental)
                        .frame(maxHeight: .infinity)
                        .font(Font.system(size:25))
                        .foregroundColor(.white)
                    Button(">") {
                        withAnimation(.linear(duration: 0.50)){
                            showingPopup = true
                            popupText = "car info"
                            disablePress = false
                        }
                    }
                        .font(Font.system(size:22))
                        .foregroundColor(.white)
                        .frame(width: 20, height: 100)
                }
                .offset(x: -50, y: 0)
                HStack {
                    Image("bed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 60)
                        .ignoresSafeArea()
                    Text(hotel)
                        .frame(maxHeight: .infinity)
                        .font(Font.system(size:25))
                        .foregroundColor(.white)
                    Button(">") {
                        withAnimation(.linear(duration: 0.50)){
                            showingPopup = true
                            popupText = "hotel info"
                            disablePress = false
                        }
                    }
                        .font(Font.system(size:22))
                        .foregroundColor(.white)
                        .frame(width: 20, height: 100)
                }
                .offset(x: -65, y: -50)
                HStack {
                    Text(dates[(numberOfDays-1)-dayNumber])
                        .font(Font.system(size:25))
                        .frame(width: 200)
                        .position(x: 160)
                        .foregroundColor(.white)
                    Menu(" V") {
                        ForEach(0..<numberOfDays)
                        { i in
                            Button(dates[(numberOfDays-1)-i]){
                                dayNumber = i
                            }
                                .foregroundColor(.white)
                                .frame(width: 100, height: 160)
                                .background(Color.brown)
                                .cornerRadius(15)
                                .padding()
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        }
                    }
                        .position(x: 110)
                        .font(Font.system(size:25))
                        .fontWidth(.expanded)
                        .foregroundColor(.white)
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .ignoresSafeArea()
                        .position(x: -10)
                }
                .offset(y: -20)
                ScrollView(.horizontal) {
                    HStack (spacing: 20) {
                        ForEach(1..<numberOfEvents+1)
                        { i in
                            Text("Event \(i)")
                                .foregroundColor(.white)
                                .frame(width: 100, height: 160)
                                .background(Color.brown)
                                .cornerRadius(15)
                                .padding()
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        }
                        
                    }
                }
                .offset(y: -30)
            }
            .background(bgColor)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .blur(radius: showingPopup ? 20 : 0)
            .allowsHitTesting(disablePress)
        }
        .overlay(alignment: .center){
            if showingPopup == true {
                    popupTextView(infoText: .constant(Text(popupText)))
                    .onTapGesture{
                        withAnimation(.linear(duration: 0.50)){
                            showingPopup = false
                            disablePress = true
                        }
                    }
            }
         }
    }
}
#Preview {
    planningView()
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
