//
//  SelectButtons.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct SelectButton: View {
    
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    
    var body: some View {
        ZStack {
            
            if isSelected {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.purple)
                    .cornerRadius(10)
            } else {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.purple, lineWidth: 1)
                    )
            }
        }
    }
}

struct SelectButtons_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isSelected: .constant(false), color: .blue, text: "Option")
    }
}
