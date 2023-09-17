//
//  OnBoardingView.swift
//  Restart
//
//  Created by Ahmed Ezz on 10/09/2023.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onBoarding") var onBoarding : Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    @State private var title = "Share."
    
    func changeTitle(_ title: String) {
        withAnimation(.linear(duration: 0.1)) {
            self.title = title
        }
    }
    
    // MARK: -Body
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all)
            VStack(spacing: 20) {
                Spacer()
                OnBoardingHeader(title: title)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y:isAnimating ? 0 : -40)
                    .animation(.easeIn(duration: 1), value: isAnimating)
                
                ZStack {
                    CirclesGroupView(opacity: 0.2, color: .white)
                        .offset(x :imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width/5))
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .offset(imageOffset)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .rotationEffect(Angle(degrees: imageOffset.width / 20))
                        .scaleEffect(x:isAnimating ? 1 : 0.5,y: isAnimating ? 1 : 0.5)
                        .animation(.easeIn(duration: 0.5), value: isAnimating)
                        .gesture(DragGesture().onChanged { gesture in
                            if (abs(imageOffset.width) <= 200) {
                                changeTitle("Give.")
                                imageOffset.width = gesture.translation.width
                            }
                        }.onEnded { _ in
                            imageOffset = .zero
                            changeTitle("Share.")
                        })
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                }
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get started.")
                        .font(.system(.title3,design: .rounded))
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    HStack {
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: 80 + buttonOffset)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: 80)
                            
                            Capsule()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.forward.2")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                        }
                        .offset(x:buttonOffset)
                        .frame(width: 80,height: 80,alignment: .center)
                        .gesture(DragGesture().onChanged { value in
                                if value.translation.width > 0 && buttonOffset <= buttonWidth-80 {
                                    buttonOffset = value.translation.width
                                }
                            }.onEnded{_ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    if buttonOffset < (buttonWidth / 2) {
                                        buttonOffset = 0
                                    } else {
                                        buttonOffset = (buttonWidth - 80)
                                        onBoarding = false
                                    }
                                }
                            })
                        Spacer()
                    }
                }
                .frame(width: buttonWidth,height: 80,alignment: .center)
                .opacity(isAnimating ? 1 : 0)
                .offset(y:isAnimating ? 0 : 40)
                .animation(.easeIn(duration: 1), value: isAnimating)
            }
        }.onAppear() {
            isAnimating = true
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
