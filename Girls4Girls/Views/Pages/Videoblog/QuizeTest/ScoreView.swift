//
//  ScoreView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 2/4/23.
//

import SwiftUI

struct ScoreView: View {
   
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var questionViewModel: QuestionViewModel
    
    let videoData: Videos
        var body: some View {
            ZStack {
                backgroundGradient
                VStack {
                    // Nav
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
                                Text("Test")
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
                    
                    VStack {
                        ScrollView {
                            let questions = questionViewModel.questions
                            Text("Тест по видео-уроку: Как избавиться от прокрастинации?")
                                .font(.title3)
                                .frame(width: 370, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.top, 10)
                            
                            Text("Вы набрали \(questionViewModel.calculateScore()) баллов из \(questions.count).")
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(width: 370, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.top, 10)
                            
                            Text("Однако, для получения достижения Вам нужно набрать минимум 80%. Не волнуйтесь, вы в любое время можете повторить попытку!")
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(width: 370, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkGray)
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Пройти еще раз")
                                    .fontWeight(.semibold)
                                    .font(.body)
                                    .foregroundColor(Color.theme.darkPurple)
                                    .padding(10)
                                    .padding(.horizontal, 10)
                                    .background(Color.theme.purple)
                                    .cornerRadius(10)
                                    .padding(.leading, 25)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            })
                            Text("Ваши ответы:")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .frame(width: 370, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.top, 10)
                            
                            
                            ForEach(questionViewModel.questions, id: \.id) { question in
                                ResultOptionView(question: question)
                            }
                            
                            VStack {
                                Spacer()

                                Button(action: {
                                    guard let window = UIApplication.shared.windows.first else { return }
                                    let viewModel = UserStateViewModel()

                                    let rootView = NavigationView {
                                        TabBar()
                                            .environmentObject(viewModel)
                                            .navigationBarHidden(true)
                                    }

                                    window.rootViewController = UIHostingController(rootView: rootView)
                                    window.makeKeyAndVisible()
                                }, label: {
                                    Text("Завершить тест")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.theme.purple)
                                        .cornerRadius(10)
                                })
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                            }
                        }
                    }
                }
            }
        }

    var backgroundGradient: some View {
        LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.7)
            .ignoresSafeArea()
    }
}

struct ProgressCircleView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State private var progress: Double = 0.0
    let videoData: Videos
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                // Nav
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
                            Text("Test")
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
                Spacer()
                ZStack {
                    Circle()
                        .stroke(lineWidth: 30)
                        .opacity(0.3)
                        .foregroundColor(Color.red)
                    
                    Text("\(questionViewModel.calculateScore())")
                        .font(.custom(FontsManager.Mulish.medium, size: 60))
                        .foregroundColor(Color.theme.darkPurple)
                        
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(min(self.progress, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.theme.greenLight)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear(duration: 5.0))
                        .onAppear {
                            self.progress = (Double(questionViewModel.calculateScore()) / Double(questionViewModel.questions.count))
                        }
                }
                .frame(width: 200)
                .padding(40)
                .navigationBarHidden(true)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        questionViewModel.showScore = true
                    }
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $questionViewModel.showScore, content: {
            ScoreView(videoData: videoData)
        })
    }
    
    var backgroundGradient: some View {
        LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(0.7)
            .ignoresSafeArea()
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(videoData: Videos(id: 2, url: "", categories: [], title: "", speaker: "", description: ""))
        .environmentObject(QuestionViewModel())
    }
}

//questions: [
//    Question(id: 0, title: "What is 2 + 2?", options: ["3", "4", "5"], correctIndex: 1, explanation: ""),
//    Question(id: 1, title: "What is the capital of France?", options: ["Berlin", "Paris", "Madrid"], correctIndex: 1, explanation: ""),
//    Question(id: 2, title: "What is the largest country in the world?", options: ["Russia", "China", "USA"], correctIndex: 0, explanation: ""),
//]
