//
//  ContentView.swift
//  Restart
//
//  Created by Ahmed Ezz on 10/09/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoarding") var onBoarding : Bool = true
    var body: some View {
        ZStack {
            if onBoarding {
                OnBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
