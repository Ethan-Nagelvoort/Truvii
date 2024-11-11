//
//  ColorsView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 4/14/24.
//

import SwiftUI

struct ColorsView: View {
    @Binding var bgColor: Color
    @State public var mainColorChange = true
    @State public var accent1Change = false
    @State public var accent2Change = false
    @State public var mainColor = Color(.sRGB, red: 1, green: 0.79, blue: 0.73)
    @State public var accent1Color = Color(.sRGB, red: 1, green: 0.79, blue: 0.73)
    @State public var accent2Color = Color(.sRGB, red: 1, green: 0.79, blue: 0.73)
    //@State public var babyblue = Color(.sRGB, red: 0.58, green: 0.85, blue: 0.98)
    var body: some View {
        NavigationView{
            VStack {
                Text("VIBES")
                    .font(.custom("Krub", fixedSize: 60))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 30)
                VStack {
                    Spacer()
                    HStack {
                        Text(" Main Color     ")
                            .font(.custom("Krub", fixedSize: 30))
                            .foregroundColor(.white)
                        Rectangle()
                            .fill(mainColorChange ? .white : .black)
                            .frame(width: 58, height: 58)
                            .cornerRadius(15)
                            .overlay {
                                Button(" ")
                                {
                                    mainColorChange = true
                                    accent1Change = false
                                    accent2Change = false
                                }
                                .frame(width: 50, height: 50)
                                .background(mainColor)
                                .cornerRadius(15)
                                .padding()
                            }
                    }
                    Spacer()
                    HStack {
                        Text(" Accent Color 1")
                            .font(.custom("Krub", fixedSize: 30))
                            .foregroundColor(.white)
                        Rectangle()
                            .fill(accent1Change ? .white : .black)
                            .frame(width: 58, height: 58)
                            .cornerRadius(15)
                            .overlay {
                                Button(" ")
                                {
                                    mainColorChange = false
                                    accent1Change = true
                                    accent2Change = false
                                }
                                .frame(width: 50, height: 50)
                                .background(accent1Color)
                                .cornerRadius(15)
                                .padding()
                            }
                    }
                    Spacer()
                    HStack {
                        Text(" Accent Color 2")
                            .font(.custom("Krub", fixedSize: 30))
                            .foregroundColor(.white)
                        Rectangle()
                            .fill(accent2Change ? .white : .black)
                            .frame(width: 58, height: 58)
                            .background(.black)
                            .cornerRadius(15)
                            .overlay {
                                Button(" ")
                                {
                                    mainColorChange = false
                                    accent1Change = false
                                    accent2Change = true
                                }
                                .frame(width: 50, height: 50)
                                .background(accent2Color)
                                .cornerRadius(15)
                                .padding()
                            }
                    }
                }
                .offset(y: -300)
                ColorPicker("ColorPicker", selection: (mainColorChange ? $mainColor : (accent1Change ? $accent1Color : $accent2Color)))
                    .scaleEffect(CGSize(width:10, height:10))
                    .labelsHidden()
                    .frame(alignment: .bottom)
                    .offset(y: -150)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ColorsView(bgColor: .constant( Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)))
}
