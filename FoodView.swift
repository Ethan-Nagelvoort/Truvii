//
//  FoodView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 8/30/24.
//

import SwiftUI

struct FoodView: View {
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    @State var searchText : String = ""
    //private let food = ["Burritos", "Mazesoba", "Chees Wheel Pasta", "Espresso Martini", "Matcha Latte", "Tiramisu",
                        //"Viral Circle Croissant"]
    //private var searchResults : [String] {
            //searchText.isEmpty ? food : food.filter { $0.contains(searchText) }
        //}
    @State var foods = ["-", "-", "-"]
    @State var drinks = ["-", "-", "-"]
    @State var desserts = ["-", "-", "-"]
    @State private var isEditing = false
    var body: some View {
        NavigationView{
            VStack {
                Text("VIBES")
                    .font(.custom("Krub", fixedSize: 60))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 30)
                Image("FoodMasterList")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .multilineTextAlignment(.center)
                    .position(x: 175, y:75)
                Text("Food Master List")
                    .font(.custom("Krub", fixedSize: 45))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .position(x: 175, y:95)
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                    TextField("Search... ", text: $searchText, prompt: Text("Search... "))
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "xmark.circle.fill")
                                .padding()
                                .foregroundColor(.black)
                                .onTapGesture {
                                    searchText = ""
                                }
                            ,alignment: .trailing
                        )
                }
                .frame(height: 40)
                .font(.headline)
                .background(
                    RoundedRectangle(cornerRadius: 40).stroke(.white, lineWidth: 1)
                        .fill(.white)
                )
                .position(x: 175, y:100)
                Text("Foods")
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:140)
                Text(foods[0])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    //.multilineTextAlignment(.)
                    .position(x: 40, y:120)
                Text(foods[1])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:105)
                Text(foods[2])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:90)
                Text("Drinks")
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:90)
                Text(drinks[0])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:80)
                Text(drinks[1])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:70)
                Text(drinks[2])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:60)
                Text("Desserts")
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 60, y:50)
                Text(desserts[0])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:40)
                Text(desserts[1])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:30)
                Text(desserts[2])
                    .font(.custom("Krub", fixedSize: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .position(x: 40, y:20)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .foregroundColor(bgColor)
            .ignoresSafeArea()
            }
        }
    }

#Preview {
    FoodView()
}
