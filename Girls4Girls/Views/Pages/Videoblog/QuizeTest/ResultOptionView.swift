//
//  ResultOptionView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 2/4/23.
//

import SwiftUI

struct ResultOptionView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    let question: Question
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("\(question.id + 1). \(question.title)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .frame(width: 260, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .padding(.top, 20)
                    .padding(.leading, 10)
                
                ForEach(question.options.indices, id: \.self) { index in
                    
                    Button(action: {
                        questionViewModel.selectAnswer(question: question, answer: question.options[index])
                    }) {
                        HStack {
                            Circle()
                                .stroke(Color.theme.purple, lineWidth: 2)
                                .background(questionViewModel.userAnswer[question.id] == index ? Circle().stroke(Color.theme.purple, lineWidth: 7) : nil)
                                .frame(width: 22, height: 22)
                                .padding(.leading, 20)
                            Text(question.options[index])
                                .frame(width: 280, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .foregroundColor(.black)
                        }
                        .background(
                            questionViewModel.userAnswer[question.id] == index ?
                            (question.correctIndex == index ? Color.theme.correct : Color.theme.incorrect) :
                                (question.correctIndex == index ? Color.theme.correct : Color.white)
                            )
                        .cornerRadius(15)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 15)
                    }
                    
                }
                .onChange(of: questionViewModel.userAnswer[question.id]) { newValue in
                    if let newValue = newValue {
                        questionViewModel.userAnswer[question.id] = newValue
                    }
                }
            }
        }
}
