//
//  HeaderView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/3/23.
//

import SwiftUI

struct HeaderView: View {
    
    @State var showLoginView: Bool = true
    @State private var scrollViewOffset: CGFloat = 0
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("backNav")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Spacer()
                    Text(title)
                        .frame(width: UIScreen.main.bounds.height * (1/4))
                        .font(.custom(FontsManager.Mulish.medium, size: 18))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.theme.darkPurple)
                    Spacer()
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            
        }
        
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Main")
    }
}
