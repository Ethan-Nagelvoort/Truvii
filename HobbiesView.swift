//
//  HobbiesView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 4/14/24.
//

import SwiftUI

struct HobbiesView: View {
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    @State public var currentHobbyDisplayed = "Gaming"
    @State public var hobbiesArray = ["Painting",
                                      "Rollerblading",
                                      "Singing",
                                      "Gaming",
                                      "Photography",
                                      "Chess",
                                      "Reading",
                                      "Gardening",
                                      "Tennis",
                                      "Cooking",
                                      "Camping",
                                      "Knitting",
                                      "Music",
                                      "Skating",
                                      "Sewing",
                                      "Surfing",
                                      "Fishing"]
    @State public var numberOfHobbies = 17
    @State public var hobbyArray = ["Gaming", "Gaming", "Gaming"]
    @State public var currentHobbyDisplay = 0
    @State public var hobby1 = "Hobby 1"
    @State public var hobby2 = "Hobby 2"
    @State public var hobby3 = "Hobby 3"
    @State public var imageSwitchTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView{
            VStack {
                Text("VIBES")
                    .font(.custom("Krub", fixedSize: 60))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: 30)
                Image(hobbyArray[currentHobbyDisplay])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 225, height: 225)
                    .position(x:180,y:20)
                    .onReceive(imageSwitchTimer) { _ in
                            // Go to the next image. If this is the last image, go
                            // back to the image #0
                            self.currentHobbyDisplay = (self.currentHobbyDisplay + 1) % self.hobbyArray.count
                        }
                VStack {
                    Spacer()
                    DropdownMenuButton {
                        ForEach(0..<numberOfHobbies)
                        { i in
                            Button(hobbiesArray[i]){
                                hobbyArray[0] = hobbiesArray[i]
                                hobby1 = hobbyArray[0]
                            }
                            .background(bgColor)
                        }
                    } label: {
                        Text("\(hobby1)")
                            .foregroundColor(.white)
                    }
                    .font(Font.system(size:25))
                    .foregroundColor(.white)
                    .background(bgColor)
                    Spacer()
                    DropdownMenuButton {
                        ForEach(0..<numberOfHobbies)
                        { i in
                            Button(hobbiesArray[i]){
                                hobbyArray[1] = hobbiesArray[i]
                                hobby2 = hobbyArray[1]
                            }
                            .background(bgColor)
                        }
                    } label: {
                        Text("\(hobby2)")
                            .foregroundColor(.white)
                    }
                    .font(Font.system(size:25))
                    .foregroundColor(.white)
                    .background(bgColor)
                    Spacer()
                    DropdownMenuButton {
                        ForEach(0..<numberOfHobbies)
                        { i in
                            Button(hobbiesArray[i]){
                                hobbyArray[2] = hobbiesArray[i]
                                hobby3 = hobbyArray[2]
                            }
                            .background(bgColor)
                        }
                    } label: {
                        Text("\(hobby3)")
                            .foregroundColor(.white)
                    }
                    .font(Font.system(size:25))
                    .foregroundColor(.white)
                    .background(bgColor)
                }
                .position(x: 175, y:50)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
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
    HobbiesView()
}

//bottom gotten from https://stackoverflow.com/questions/71685102/wrap-menu-text-thru-menustyle
struct DropdownMenuButton<Label, Content> : View where Label : View, Content : View {
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    @ViewBuilder let content: () -> Content
    @ViewBuilder let label: () -> Label

    var body: some View {
        Menu(content: self.content,
        label: {
            HStack {
                self.label()
                Spacer()
                Text("⌵").offset(y: -4)
            }
        })
        .menuStyle(DropdownMenuStyle())
        .background(bgColor)
        .ignoresSafeArea()
    }
}

struct DropdownMenuStyle: MenuStyle {
    @State public var bgColor = Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 1)
            )
            .contentShape(Rectangle())
            .foregroundColor(.white)
            .background(bgColor)
            .ignoresSafeArea()
    }
}
