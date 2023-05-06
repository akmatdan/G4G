//
//  DropDownMenuOption.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI
import Foundation

struct DropDownMenuOption: View{
    
    @State private var selection = 0
    let items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
            VStack {
                Picker(selection: $selection, label: Text("Dropdown")) {
                    ForEach(0..<items.count) { index in
                        Section(header: Text("Section \(index)")) {
                            Text(items[index])
                        }
                    }
                }
                .pickerStyle(.wheel)
                .labelsHidden()
                .frame(maxWidth: 200)
                .clipped()
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .strokeBorder(Color.blue, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
            }
            .padding()
        }
    
}

struct DropDownMenuOption_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenuOption()
    }
}
