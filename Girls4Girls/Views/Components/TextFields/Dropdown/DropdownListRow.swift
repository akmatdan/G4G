//
//  DropdownListRow.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 25/2/23.
//

import SwiftUI

struct DropdownListRow: View {
    
    let option: DropdownMenuOption
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void

    var body: some View {
            
        Button {
            self.onSelectedAction(option)
        } label: {
            HStack {
                Text(option.option)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Image("circleMenu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

struct DropdownListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownListRow(option: DropdownMenuOption.testSingleName, onSelectedAction: { _ in })
    }
}
