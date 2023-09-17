//
//  OnBoardingHeader.swift
//  Restart
//
//  Created by Ahmed Ezz on 18/09/2023.
//

import SwiftUI

struct OnBoardingHeader: View {
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .transition(.opacity)
                .id(title)
            
            Text("""
                 its not how much we give but how much love we put into giving
                 """)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal,10)
        }

    }
}

struct OnBoardingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingHeader(title: "share")
    }
}
