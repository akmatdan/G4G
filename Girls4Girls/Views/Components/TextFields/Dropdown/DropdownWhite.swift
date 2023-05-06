//
//  DropdownWhite.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 4/4/23.
//

import SwiftUI

struct DropdownWhite: View {
    
    @State private var isOptionsPresented: Bool = false
    @Binding var selectedOptions: DropdownMenuOption?
    
    let text: String
    let placeholder: String
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
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.purple, lineWidth: 5)
                            .frame(width: 350, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                    }
                
                    VStack {
                        Text(text)
                            .font(.custom(FontsManager.Mulish.black, size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                            .frame(width: 310, alignment: .leading)
                        
                        HStack {
                            Spacer()
                            Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                                .padding(.trailing, 25)
                        }
                        
                        HStack {
                            if selectedOptions == nil {
                                Text(placeholder)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 25)
                                    .padding(.bottom, 10)
                            } else {
                                Text(selectedOptions!.option)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .padding(.leading, 25)
                                    .padding(.bottom, 10)
                            }
                            
                            Spacer()
                        }
                    }
                }
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
            }
            .frame(width: 310)
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

struct DropdownWhite_Previews: PreviewProvider {
    static var previews: some View {
        DropdownWhite(selectedOptions: .constant(nil), text: "Pol", placeholder: "",
                      bind: "Имя", options: DropdownMenuOption.testAllNames)
    }
}
