//
//  SplachLogoView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct SplachLogoView: View {
    
    @State private var isActive = false
    @State private var size = 0.6
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            LaunchView()
        } else {
            ZStack {
                // background
                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                // content layers
                VStack {
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 204, height: 164)
                        .frame(height: UIScreen.main.bounds.height * (1/2))
                        .offset(y: -10)
                    
                    Spacer()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplachLogoView_Previews: PreviewProvider {
    static var previews: some View {
        SplachLogoView()
    }
}
