//
//  HomeView.swift
//  Restart
//
//  Created by Ahmed Ezz on 10/09/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoarding") var onBoarding : Bool = false
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                CirclesGroupView(opacity: 0.2, color: .gray)
                Image("character-2").resizable().scaledToFit().padding()
                    .offset(y: isAnimating ? 40 : -40)
                    .animation(.easeIn(duration: 4).repeatForever(), value: isAnimating)
            }
            Text("The time that leads to mastery is dependent on the intensity of our focus.").font(.title3)
                .fontWeight(.light).foregroundColor(.secondary)
                .multilineTextAlignment(.center).padding()
            Button(action: {
                withAnimation() {
                    onBoarding = true
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart").font(.system(.title3,design: .rounded)).fontWeight(.bold)
            }).buttonStyle(.borderedProminent).buttonBorderShape(.capsule)
                .controlSize(.large)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
