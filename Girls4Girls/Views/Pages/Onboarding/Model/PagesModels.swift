//
//  PagesModels.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 20/2/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let imageURL: String
    let tag: Int
    
    static var RuOnboardings: [Page] = [
        Page(title: NSLocalizedString("onBoarding-title1", comment: ""), imageURL: "onboarding0", tag: 0),
        Page(title: "Наставление от лучших менторов", imageURL: "onboarding1", tag: 1),
        Page(title: "Смотри видео уроки и следи за своим прогрессом", imageURL: "onboarding2", tag: 2)
    ]
    
    static var KgOnboardings: [Page] = [
        Page(title: "Жаңы функциялар жөнүндө билип алыңыз", imageURL: "onboarding0", tag: 0),
        Page(title: "Мыкты насаатчылардын жетекчилиги", imageURL: "onboarding1", tag: 1),
        Page(title: "Видео үйрөткүчтөрдү көрүп, прогрессиңизге көз салыңыз", imageURL: "onboarding2", tag: 2)
    ]
}
