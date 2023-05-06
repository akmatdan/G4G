//
//  DropdownList.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 25/2/23.
//

import SwiftUI

struct DropdownList: View {
    
    let options: [DropdownMenuOption]
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(options) { option in
                    DropdownListRow(option: option, onSelectedAction: self.onSelectedAction)
                }
            }
        }
        .frame(height: CGFloat(self.options.count * 32) > 300 ? 300 : CGFloat(self.options.count * 32))
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.purple, lineWidth: 2)
        }
    }
}

struct DropdownList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownList(options: DropdownMenuOption.testAllNames, onSelectedAction: { _ in })
    }
}
