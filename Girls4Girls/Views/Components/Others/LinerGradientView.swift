//
//  LinerGradientView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct LinerGradientView: View {
    
    @State private var animatedGradient = false
    
    var body: some View {
        LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: animatedGradient ? .topLeading: .bottomLeading, endPoint: animatedGradient ? .bottomTrailing: .topTrailing)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true))
                {
                    animatedGradient.toggle()
                }
            }
    }
}

struct LinerGradient_Previews: PreviewProvider {
    static var previews: some View {
        LinerGradientView()
    }
}
