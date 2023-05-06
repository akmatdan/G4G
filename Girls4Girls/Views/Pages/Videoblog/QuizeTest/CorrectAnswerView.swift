//
//  CorrectAnswerView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 31/3/23.
//

import SwiftUI

struct CorrectAnswerView: View {
    let selectedOptions: [Int?]

    var body: some View {
        VStack {
            Text("Correct Answers")
                .font(.largeTitle)
                .padding(.top, 50)

            ScrollView {
                
            }

            Button(action: {
                // Navigate to a new view here, using NavigationLink or whatever method you prefer
            }) {
                Text("Done")
                    .font(.title2)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 50)
        }
    }
}
