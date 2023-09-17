//
//  CirclesGroupView.swift
//  Restart
//
//  Created by Ahmed Ezz on 10/09/2023.
//

import SwiftUI

struct CirclesGroupView: View {
    @State var opacity: CGFloat
    @State var color: Color
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            Circle().stroke(color.opacity(opacity),lineWidth: 40.0)
                .frame(width: 260,height: 260)
            Circle().stroke(color.opacity(opacity),lineWidth: 80)
                .frame(width: 260,height: 260)
        }.blur(radius: isAnimating ? 0: 10).scaleEffect(x: isAnimating ? 1 : 0,y: isAnimating ? 1 : 0)
            .animation(.easeIn(duration: 2), value: isAnimating)
            .onAppear() {
            isAnimating = true
        }
    }
}

struct CirclesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.red)
            CirclesGroupView(opacity: 0.2, color: .white)
        }
        
    }
}
