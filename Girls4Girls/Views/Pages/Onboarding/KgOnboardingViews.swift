//
//  KgOnboardingViews.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct KgOnboardingViews: View {
    
    @State private var pageIndex = 0
    private let pages: [Page] = Page.KgOnboardings
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
                
                VStack {
                    TabView(selection: $pageIndex) {
                                ForEach(pages) { page in
                                    VStack {
                                        Image("\(page.imageURL)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 281, height: 300)
                                        
                                        Text("\(page.title)")
                                            .foregroundColor(Color.theme.darkPurple)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .frame(alignment: .center)
                                            .multilineTextAlignment(.center)
                                            .padding(10)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .tag(page.tag)
                                }
                        
                            }
                            .animation(.easeInOut, value: pageIndex)
                            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    
                    HStack {
                        ForEach(0..<pages.count) { index in
                            Button {
                                pageIndex = index
                            } label: {
                                Circle()
                                    .fill(pageIndex == index ? Color.theme.purple : Color.gray)
                                    .frame(width: 15, height: 15)
                            }
                        }
                    }
                    
                    HStack {
                        NavigationLink {
                            MainSignIn()
                        } label: {
                            Text("Пропустить")
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    Spacer()
                }
    }
    }
}

struct KgOnboardingViews_Previews: PreviewProvider {
    static var previews: some View {
        KgOnboardingViews()
    }
}
