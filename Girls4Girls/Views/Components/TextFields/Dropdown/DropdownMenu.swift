//
//  DropdownField.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 25/2/23.
//

import SwiftUI

struct DropdownMenu: View {
    
    
    @State private var isOptionsPresented: Bool = false
    @Binding var selectedOption: String
    
    let placeholder: String
    let options: [DropdownMenuOption]
    
    var selectedOptionIndex: Int? {
        options.firstIndex { $0.option == selectedOption }
    }
    
    var selectedDropdownMenuOption: DropdownMenuOption? {
        selectedOptionIndex.flatMap { options[$0] }
    }
    
    var body: some View {
        Button {
            withAnimation {
                self.isOptionsPresented.toggle()
            }
        } label: {
            HStack {
                Text(selectedOptionIndex == nil ? placeholder : selectedOption)
                    .fontWeight(.medium)
                    .foregroundColor(selectedOptionIndex == nil ? .gray : .black)
                
                Spacer()
                
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.purple, lineWidth: 1)
        }
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    Spacer(minLength: 60)
                    DropdownList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option.option
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(
            .bottom,
            self.isOptionsPresented
            ? CGFloat(self.options.count * 32) > 300
            ? 300 + 30
            : CGFloat(self.options.count * 32) + 30
            : 0
        )
        .onAppear {
            if self.selectedOptionIndex == nil, let firstOption = self.options.first {
                self.selectedOption = firstOption.option
            }
        }
    }
}

