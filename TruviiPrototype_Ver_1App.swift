//
//  TruviiPrototype_Ver_1App.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 4/14/24.
//

import SwiftUI

@main
struct TruviiPrototype_Ver_1App: App {
    var body: some Scene {
        WindowGroup {
            //ColorsView(bgColor: .constant(Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)))
            //planningView() //transitions for info pages
            //zodiacView() //zodiac signs images
            //do one more vibe page, look into implementing fonts
            //HobbiesView()
            FoodView()
        }
    }
}
