//
//  DropdownApp.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 10/4/23.
//

import SwiftUI

struct DropdownApp: View {
    
    @State private var isOptionsPresented: Bool = false
    @Binding var selectedOptions: DropdownMenuOption?
    
    let text: String
    let bind: String
    let options: [DropdownMenuOption]
    
    var body: some View {
        ZStack {
            Button {
                withAnimation {
                    self.isOptionsPresented.toggle()
                }
            } label: {
                ZStack {
                    VStack {
                        Text(text)
                            .font(.custom(FontsManager.Mulish.black, size: 16))
                            .padding(.top, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        HStack {
                            Spacer()
                            Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                                .padding(.trailing, 25)
                        }
                        
                        HStack {
                            Text(selectedOptions == nil ? bind : selectedOptions!.option)
                                .fontWeight(.medium)
                                .foregroundColor(selectedOptions == nil ? .black : .black)
                                .padding(.leading, 15)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            }
            .overlay(alignment: .top) {
                VStack {
                    if self.isOptionsPresented {
                        Spacer(minLength: 60)
                        DropdownList(options: self.options) { option in
                            self.isOptionsPresented = false
                            self.selectedOptions = option
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
                    .padding(
                        .bottom, self.isOptionsPresented
                        ? CGFloat(self.options.count * 32) > 300
                        ? 300 + 30
                        : CGFloat(self.options.count * 32) + 30
                        : 0
                    )
        }
    }
}
