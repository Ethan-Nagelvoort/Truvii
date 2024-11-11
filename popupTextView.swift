//
//  popupView.swift
//  TruviiPrototype_Ver.1
//
//  Created by Ethan Nagelvoort on 7/7/24.
//

import SwiftUI

struct popupTextView: View {
    @Binding var infoText : Text
    var body: some View {
        VStack(spacing: .zero) {
            infoText
                .font(Font.system(size:25))
        }
        .padding()
        .multilineTextAlignment(.center)
        .background(RoundedCorners(color: .white,
                                   tl: 10,
                                   tr: 10,
                                   bl: 10,
                                   br: 10))
    }
}

#Preview {
    popupTextView(infoText: .constant(Text("Info info info")))
        .previewLayout(.sizeThatFits)
        .background(.blue)
}

/* gotten from https://gist.github.com/AndyQ/83b82963075f16fb1128eb31dd8466bc */
struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    var top: Bool = true
    var bottom: Bool = true
    var left: Bool = true
    var right: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(self.color)
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: 0 + tl, y: 0))
                if tl != 0 || tr != 0 || top == true {
                    path.addLine(to: CGPoint(x: w - tr, y: 0))
                    path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                } else {
                    path.move(to: CGPoint(x: w, y: 0))
                }
                if tr != 0 || br != 0 || right == true {
                    path.addLine(to: CGPoint(x: w, y: h - br))
                    path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                } else {
                    path.move(to: CGPoint(x: w, y: h))
                }
                
                if br != 0 || bl != 0 || bottom == true {
                    path.addLine(to: CGPoint(x: bl, y: h))
                    path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                } else {
                    path.move(to: CGPoint(x: 0, y: h))
                }
                if bl != 0 || tl != 0 || left == true {
                    path.addLine(to: CGPoint(x: 0, y: tl))
                    path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                }
            }
            .stroke(Color.black, lineWidth: 2)
        }
    }
}
