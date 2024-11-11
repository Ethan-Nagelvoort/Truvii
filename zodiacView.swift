//
//  zodiacView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 7/8/24.
//

import SwiftUI

struct zodiacView: View {
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    @State public var zodiac = "zodiac_star"
    @State var selectedDate: Date = Date()
    @State public var birth_day = 0
    @State public var birth_month = 0
    @State public var birth_year = 0
    @State public var refresh = false
    var body: some View {
        NavigationView{
            VStack {
                Text("VIBES")
                    .font(.custom("Krub", fixedSize: 60))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 30)
                Image(zodiac)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .position(x:200,y:100)
                Text("Enter you birthday...")
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .frame(width: 500, height: 50)
                    .position(x: 150,y: 130)
                DatePicker("" ,
                            selection: $selectedDate,
                            displayedComponents: [.date]
                 )
                 .datePickerStyle(.wheel)
                 .frame(width: 300, height: 300)
                 .colorInvert()
                     .colorMultiply(Color.white)
                 .offset(y:-50)
                 .clipped()
                 .onChange(of: selectedDate) {
                     let birthComponents = Calendar.current.dateComponents([.month, .day, .year], from: selectedDate)
                     if birthComponents.month != nil
                     {
                         birth_month = birthComponents.month!
                     }
                     if birthComponents.day != nil
                     {
                         birth_day = birthComponents.day!
                     }
                     if birthComponents.year != nil
                     {
                         birth_year = birthComponents.year!
                     }
                     if (birth_month == 3 && birth_day >= 21) || (birth_month == 4 && birth_day <= 19)
                     {
                         zodiac = "Aries"
                     }
                     if (birth_month == 4 && birth_day >= 20) || (birth_month == 5 && birth_day <= 20)
                     {
                         zodiac = "Taurus"
                     }
                     if (birth_month == 5 && birth_day >= 21) || (birth_month == 6 && birth_day <= 20)
                     {
                         zodiac = "Gemini"
                     }
                     if (birth_month == 6 && birth_day >= 21) || (birth_month == 7 && birth_day <= 22)
                     {
                         zodiac = "Cancer"
                     }
                     if (birth_month == 7 && birth_day >= 23) || (birth_month == 8 && birth_day <= 22)
                     {
                         zodiac = "Leo"
                     }
                     if (birth_month == 8 && birth_day >= 23) || (birth_month == 9 && birth_day <= 22)
                     {
                         zodiac = "Virgo"
                     }
                     if (birth_month == 9 && birth_day >= 23) || (birth_month == 10 && birth_day <= 22)
                     {
                         zodiac = "Libra"
                     }
                     if (birth_month == 10 && birth_day >= 23) || (birth_month == 11 && birth_day <= 21)
                     {
                         zodiac = "Scorpio"
                     }
                     if (birth_month == 11 && birth_day >= 22) || (birth_month == 12 && birth_day <= 21)
                     {
                         zodiac = "Sagittarius"
                     }
                     if (birth_month == 12 && birth_day >= 22) || (birth_month == 1 && birth_day <= 19)
                     {
                         zodiac = "Capricorn"
                     }
                     if (birth_month == 1 && birth_day >= 20) || (birth_month == 2 && birth_day <= 18)
                     {
                         zodiac = "Aquarius"
                     }
                     if (birth_month == 2 && birth_day >= 19) || (birth_month == 3 && birth_day <= 20)
                     {
                         zodiac = "Pisces"
                     }
                 }

            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    zodiacView()
}
