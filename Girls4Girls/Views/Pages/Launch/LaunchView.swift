//
//  LaunchView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 18/2/23.
//

import SwiftUI

struct LaunchView: View {

    @State private var showOnboard: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 204, height: 164)
                            .frame(height: UIScreen.main.bounds.height * (1/4))

                        Spacer()
                        Spacer()
                        
                        HStack(spacing: 20) {
                            Button {
                                showOnboard = true
                            } label: {
                                Text("Русский")
                                    .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("PurpleColor"), lineWidth: 3)
                                    )
                            }
                            .fullScreenCover(isPresented: $showOnboard) {
                                if #available(iOS 16.0, *) {
                                    NavigationView {
                                        RuOnboardingViews()
                                    }
                                } else {
                                    NavigationView {
                                        RuOnboardingViews()
                                    }
                                }
                            }
                            
                            Button {
                                showOnboard = true
                            } label: {
                                Text("Кыргызча")
                                    .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("PurpleColor"), lineWidth: 3)
                                    )
                            }
                            .fullScreenCover(isPresented: $showOnboard) {
                                if #available(iOS 16.0, *) {
                                    NavigationView {
                                        RuOnboardingViews()
                                    }
                                } else {
                                    NavigationView {
                                        RuOnboardingViews()
                                    }
                                }
                            }
                            
//                            SecondaryButton1(content: KgOnboardingViews(), text: "Кыргызча")
                            
//                            SecondaryButton1(content: RuOnboardingViews(), text: "Русский")
                        }
                        Spacer()
                    }
            }
            .themeGradient()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
