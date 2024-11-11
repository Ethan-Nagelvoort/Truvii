//
//  ContentView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 4/14/24.
//

import SwiftUI

struct HomePageView: View {
    @State public var moodType = "Waiting for Vibes"
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    var body: some View {
        NavigationView{
            VStack{
                Text("TruviiRev.1")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight:.infinity,alignment:.top)
                    .foregroundColor(.brown)
                
                Text(moodType)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                
                NavigationLink("Customize Vibes", destination: CustomizeVibesView(bgColor: $bgColor))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(Color.brown)
                    .cornerRadius(15)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
        }
    }
}

#Preview {
    HomePageView()
}
