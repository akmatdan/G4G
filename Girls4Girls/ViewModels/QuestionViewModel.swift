//
//  QuestionViewModel.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 2/4/23.
//

import Foundation

class QuestionViewModel: ObservableObject {
    @Published var questions = [Question]()
    @Published var currentQuestionIndex = 0
    @Published var userAnswer = [Int: Int]()
    @Published var showScore = false
    @Published var score = 0
    
    init() {
        let question1 = Question(
            id: 0,
            title: "Как избавиться от прокрастинации?",
            options: [
                "Разделить задачи на более мелкие",
                "Устанавливать строгие дедлайны",
                "Сделать все дела за один раз",
                "Начинать с самой сложной задачи"
            ],
            correctIndex: 0,
            explanation: "Разделение задач на более мелкие помогает сделать их более управляемыми и легче справиться с ними."
        )

        let question2 = Question(
            id: 1,
            title: "Как победить лень?",
            options: [
                "Работать больше часов в день",
                "Следить за привычками",
                "Определять более жесткие цели",
                "Взять более мотивирующий проект"
            ],
            correctIndex: 1,
            explanation: "Следить за своими привычками и формировать полезные привычки помогает бороться с ленью."
        )

        let question3 = Question(
            id: 2,
            title: "Как улучшить свою концентрацию?",
            options: [
                "Избегать мультитаскинга",
                "Повысить уровень шума",
                "Принимать крепкий кофе",
                "Заниматься на свежем воздухе"
            ],
            correctIndex: 0,
            explanation: "Избегание мультитаскинга и фокусирование на одной задаче помогают улучшить концентрацию."
        )

        let question4 = Question(
            id: 3,
            title: "Как не откладывать дела на потом?",
            options: [
                "Сразу же приступать к работе",
                "Установить дедлайн на завершение",
                "Думать о последствиях откладывания",
                "Сделать себе наказание за откладывание"
            ],
            correctIndex: 1,
            explanation: "Мысли о последствиях и осознание их серьезности могут помочь избежать откладывания дел на потом."
        )
        
        let question5 = Question(
            id: 4,
            title: "Как победить лень?",
            options: [
                "Работать больше часов в день",
                "Следить за привычками",
                "Определять более жесткие цели",
                "Взять более мотивирующий проект"
            ],
            correctIndex: 0,
            explanation: "Следить за своими привычками и формировать полезные привычки помогает бороться с ленью."
        )

        let testQuestions = [question1, question2, question3, question4, question5]
        questions = testQuestions
    }
    
    func selectAnswer(question: Question, answer: String) {
        if let index = question.options.firstIndex(of: answer) {
            userAnswer[question.id] = index
        }
    }

    func calculateScore() -> Int {
        var score = 0
        for question in questions {
            if let userAnswerIndex = userAnswer[question.id], userAnswerIndex == question.correctIndex {
                score += 1
            }
        }
        return score
    }
}
