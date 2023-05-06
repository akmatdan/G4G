//
//  TestVideoView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 29/3/23.
//

import SwiftUI

struct TestVideoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var questionViewModel = QuestionViewModel()
    @State private var showProgress = false
    let video: Videos
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    ZStack {
                        Image("backNav")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image("back")
                            }
                            Spacer()
                            Text("Видео")
                                .frame(width: UIScreen.main.bounds.height * (1/4))
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.leading, 20)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                
                ScrollView {
                    Text("Тест по видео-уроку: Как избавиться от прокрастинации?")
                        .font(.title3)
                        .frame(width: 370, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                        .padding(.top, 10)
                    
                    ForEach(questionViewModel.questions, id: \.id) { question in
                        QuestionOptionView(question: question)
                    }
                    
                    Button(action: {
                        withAnimation {
                            showProgress = true
                        }
                    }) {
                        Text("Завершить тест")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.purple)
                            .cornerRadius(10)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 20)
                    }
                    .disabled(questionViewModel.userAnswer.count != questionViewModel.questions.count)
                }
                .fullScreenCover(isPresented: $showProgress) {
                    ProgressCircleView(videoData: video)
                }
            }
        }
        .environmentObject(questionViewModel)
    }
}

struct TestVideoView_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoView(video: Videos(id: 2, url: "", categories: [], title: "", speaker: "", description: ""))
            .environmentObject(QuestionViewModel())
    }
}
