//
//  AplicationView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 24/2/23.
//

import SwiftUI

struct ApplicationView: View {
    var body: some View {
        ApplicationTabBar()
    }
}

struct ApplicationTabBar: View {

    @State var selectedIndex = 0
    
    let tabBarImageNames = ["Тренинги", "Форумы"]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Image("backNav")
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Spacer()
                        Text("\(tabBarImageNames[selectedIndex])")
                            .frame(width: UIScreen.main.bounds.height * (1/4))
                            .foregroundColor(Color.theme.darkPurple)
                        Spacer()
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                
                // SelectedIndex of TabBar
                HStack {
                    ForEach(0..<2) { num in
                        Button {
                            selectedIndex = num
                        } label: {
                            Spacer()
                                Text("\(tabBarImageNames[num])")
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedIndex == num ? Color(red: 0.2, green: 0.0, blue: 0.7) : .init(white: 0.7))
                                    .padding(.bottom, 10)
                                    .overlay(
                                        ZStack {
                                            if selectedIndex == num {
                                                Capsule()
                                                    .fill(Color(red: 0.2, green: 0.0, blue: 0.7))
                                                    .frame(height: 2)
                                            }
                                        }
                                        ,alignment: .bottom
                                    )
                            Spacer()
                        }
                    }
                }
                switch selectedIndex {
                case 0:
                    TreningsView()
                default:
                    ForumsView()
                }
            }
            
        }
        
    .background(
        LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.7)
            .ignoresSafeArea()
    )
    }
    
}
struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
    }
}
