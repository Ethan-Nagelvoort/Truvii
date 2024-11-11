//
//  CustomizeVibesView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 4/14/24.
//

import SwiftUI

struct CustomizeVibesView: View {
    @Binding var bgColor: Color
    var body: some View {
        NavigationView{
            Form{
                NavigationLink("Change Music Vibe", destination: MusicView())
                    .font(Font.system(size:20))
                NavigationLink("Change Picture Vibe", destination: PicturesView())
                    .font(Font.system(size:20))
                NavigationLink("Change Color Vibe", destination: ColorsView(bgColor: $bgColor))
                    .font(Font.system(size:20))
                NavigationLink("Change Hobby Vibe", destination: HobbiesView())
                    .font(Font.system(size:20))
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Customize Vibes")
        }
    }
}

#Preview {
    CustomizeVibesView(bgColor: .constant(Color(.sRGB, red: 0.212, green: 0.271, blue: 0.31)))
}
