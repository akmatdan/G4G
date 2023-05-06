//
//  MyRewardsView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct MyRewardsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedIndex = 0
    let tabBarNames = ["Мои достижения", "Все достижения"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
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
                            Text("Мои достижения")
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
                
                // MARK: CONTENT
                // SelectedIndex of TabBar
                HStack(spacing: 0) {
                    ForEach(0..<2) { num in
                        Button(action: {
                            selectedIndex = num
                        }, label: {
                            if selectedIndex == num {
                                Text("\(tabBarNames[num])")
                                    .foregroundColor(selectedIndex == num ? .white : Color.theme.purple)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .background(Color.theme.purple)
                            } else {
                                Text("\(tabBarNames[num])")
                                    .foregroundColor(selectedIndex == num ? .white : Color.theme.purple)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .background(.white)
                            }
                        }
                        )
                    }
                }
                
                switch selectedIndex {
                case 0:
                    // Mentor Applications
                    MyRewardsSection()
                default:
                    // Forum Applications
                    AllRewardsSection()
                }
                Spacer()
            }
        }
    }
}

struct AllRewardsSection: View {
    
    @ObservedObject var rewardViewModel = AllRewardsViewModel()
    @State private var isShowingReward: Bool = false
    @State private var selectedReward: RewardModel? = nil
    
    let gridItem = GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10)
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(rewardViewModel.rewards.reduce(into: [:]) { dict, reward in
                    dict[reward.category, default: []].append(reward)
                }.sorted(by: { $0.0 < $1.0 }), id: \.0) { category, rewards in
                    
                    Text(category)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    LazyVGrid(columns: [gridItem, gridItem, gridItem]) {
                        ForEach(rewards, id: \.id) { reward in
                            Button {
                                isShowingReward = true
                                selectedReward = reward
                            } label: {
                                VStack {
                                    Image(reward.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                    
                                    Text(reward.title)
                                        .font(.custom(FontsManager.Mulish.semiBold, size: 14))
                                        .foregroundColor(Color.theme.darkGray)
                                        .frame(width: 100, alignment: .center)
                                        .multilineTextAlignment(.center)
                                }
                                .padding(20)
                                
                            }
                            .sheet(isPresented: $isShowingReward) {
                                if let reward = selectedReward {
                                    if #available(iOS 16.0, *) {
                                            RewardView(reward: reward)
                                            .presentationDetents([
                                                .height(200),
                                                .fraction(0.2)])
                                            .edgesIgnoringSafeArea(.all)
                                    } else {
                                        RewardView(reward: reward)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct MyRewardsSection: View {
    
    @ObservedObject var rewardViewModel = MyRewardsViewModel()
    @State private var isShowingReward: Bool = false
    @State private var selectedReward: RewardModel? = nil
    
    let gridItem = GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10)
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(rewardViewModel.rewards.reduce(into: [:]) { dict, reward in
                    dict[reward.category, default: []].append(reward)
                }.sorted(by: { $0.0 < $1.0 }), id: \.0) { category, rewards in
                    
                    Text(category)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    LazyVGrid(columns: [gridItem, gridItem, gridItem]) {
                        ForEach(rewards, id: \.id) { reward in
                            Button {
                                isShowingReward = true
                                selectedReward = reward
                            } label: {
                                VStack {
                                    Image(reward.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                    
                                    Text(reward.title)
                                        .font(.custom(FontsManager.Mulish.semiBold, size: 14))
                                        .foregroundColor(Color.theme.darkGray)
                                        .frame(width: 100, alignment: .center)
                                        .multilineTextAlignment(.center)
                                }
                                .padding(20)
                                
                            }
                            .sheet(isPresented: $isShowingReward) {
                                if let reward = selectedReward {
                                    if #available(iOS 16.0, *) {
                                            RewardView(reward: reward)
                                            .presentationDetents([
                                                .height(200),
                                                .fraction(0.2)])
                                            .edgesIgnoringSafeArea(.all)
                                    } else {
                                        RewardView(reward: reward)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct RewardView: View {
    
    var reward: RewardModel
    
    var body: some View {
        ZStack {
            HStack {
                Image("rew_stars")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 80, maxHeight: .infinity)
                Spacer()
                Image("rew_stars2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 80, maxHeight: .infinity)
            }
            HStack {
                Image(reward.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                VStack(spacing: 5) {
                    
                    Text("Ура!")
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .foregroundColor(Color.theme.darkPurple)
                        .frame(width: 190, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    Text(reward.action)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .foregroundColor(Color.theme.darkPurple)
                        .frame(width: 190, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    Text(reward.cheer)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 12))
                        .foregroundColor(Color.theme.purple)
                        .frame(width: 190, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
        }
    }
}

struct MyRewardsView_Previews: PreviewProvider {
    static var previews: some View {
        MyRewardsView()
    }
}

struct RewardModel {
    let id: Int
    let category: String
    let title: String
    let imageName: String
    let action: String
    let cheer: String
}

class AllRewardsViewModel: ObservableObject {
    @Published var rewards = [
        
        RewardModel(id: 16, category: "Остальные", title: "Заполнение дополниельной информации о себе", imageName: "rew_4_1", action: "Ты открыла планету Сатурн!", cheer: "А ты знала, что его красивые кольца не твердые? Они состоят из кусочков льда, пыли и камня."),
        RewardModel(id: 17, category: "Остальные", title: "Загрузка  фото", imageName: "rew_4_2", action: "Ты открыла планету Юпитер!", cheer: "Юпитер — самая большая планета в нашей Солнечной системе."),
        RewardModel(id: 18, category: "Остальные", title: "2 года с нами", imageName: "rew_4_3", action: "Ты открыла планету Марс!", cheer: "А ты знала, что сутки на Марсе длятся 24,6 часа, а год на Марсе длится 687 земных суток?"),
        RewardModel(id: 19, category: "Остальные", title: "6 месяцев с нами", imageName: "rew_4_4", action: "Ты открыла планету Венера!", cheer: "А ты знала, что в отличие от других планет, Венера вращается вокруг своей оси по часовой стрелке?"),
        RewardModel(id: 20, category: "Остальные", title: "3 месяца с нами", imageName: "rew_4_5", action: "Ты открыла планету Меркурий!", cheer: "С поверхности Меркурия Солнце будет казаться более чем в три раза больше, чем если смотреть с Земли."),
        RewardModel(id: 21, category: "Остальные", title: "1 год с нами", imageName: "rew_4_6", action: "Ты открыла планету Уран!", cheer: "Уран состоит из воды, метана и аммиачных жидкостей над небольшим скалистым центром. Метан окрашивает Уран в голубой цвет."),
        RewardModel(id: 22, category: "Остальные", title: "3 года с нами", imageName: "rew_4_7", action: "Ты открыла планету Нептун!", cheer: "Нептун темный, холодный и очень ветреный. Это последняя из планет в нашей Солнечной системе. Это более чем в 30 раз дальше от Солнца, чем Земля."),
        RewardModel(id: 23, category: "Остальные", title: "1 месяца с нами", imageName: "rew_4_8", action: "Ты открыла планету Земля!", cheer: "А ты знала, что что на самом деле Земля вращается вокруг своей оси за 23 часа 56 минут и 4 секунды?"),
        
        RewardModel(id: 11, category: "За пройденные программы", title: "1 программа", imageName: "rew_3_1", action: "Ты начала строить дом!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 12, category: "За пройденные программы", title: "3 программы", imageName: "rew_3_2", action: "Ты получила милое окошко!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 13, category: "За пройденные программы", title: "5 программы", imageName: "rew_3_3", action: "Ты получила дверь!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 14, category: "За пройденные программы", title: "8 программы", imageName: "rew_3_4", action: "Ты достроила крышу!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 15, category: "За пройденные программы", title: "10 программы", imageName: "rew_3_5", action: "Ты достроила целый дом!", cheer: "Ты молодец"),
        
        RewardModel(id: 6, category: "За пройденные тесты", title: "5 тестов", imageName: "rew_2_1", action: "Ты получила самокат!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 7, category: "За пройденные тесты", title: "20 тестов", imageName: "rew_2_2", action: "Ты получила велосипед!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 8, category: "За пройденные тесты", title: "50 тестов", imageName: "rew_2_3", action: "Ты получила скутер!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 9, category: "За пройденные тесты", title: "100 тестов", imageName: "rew_2_4", action: "Ты получила мотоцикл!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 10, category: "За пройденные тесты", title: "150 тестов", imageName: "rew_2_5", action: "Ты получила автомобиль!", cheer: "Ты молодец"),
        
        RewardModel(id: 1, category: "За просмотренные видео-уроки", title: "5 видео-уроков", imageName: "rew_1_1", action: "Ты вырастила росток!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 2, category: "За просмотренные видео-уроки", title: "20 видео-уроков", imageName: "rew_1_2", action: "Ты вырастила трехлистный клевер!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 3, category: "За просмотренные видео-уроки", title: "50 видео-уроков", imageName: "rew_1_3", action: "Ты вырастила четырехлистный клевер!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 4, category: "За просмотренные видео-уроки", title: "100 видео-уроков", imageName: "rew_1_4", action: "Ты вырастила ветку!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 5, category: "За просмотренные видео-уроки", title: "150 видео-уроков", imageName: "rew_1_5", action: "Ты вырастила дерево!", cheer: "Ты молодец"),
        
    ]
}

class MyRewardsViewModel: ObservableObject {
    @Published var rewards = [
        
        RewardModel(id: 16, category: "Остальные", title: "Заполнение дополниельной информации о себе", imageName: "rew_4_1", action: "Ты открыла планету Сатурн!", cheer: "А ты знала, что его красивые кольца не твердые? Они состоят из кусочков льда, пыли и камня."),
        RewardModel(id: 17, category: "Остальные", title: "Загрузка  фото", imageName: "rew_4_2", action: "Ты открыла планету Юпитер!", cheer: "Юпитер — самая большая планета в нашей Солнечной системе."),
        RewardModel(id: 18, category: "Остальные", title: "2 года с нами", imageName: "pur_4_3", action: "Ты открыла планету Марс!", cheer: "А ты знала, что сутки на Марсе длятся 24,6 часа, а год на Марсе длится 687 земных суток?"),
        
        RewardModel(id: 11, category: "За пройденные программы", title: "1 программа", imageName: "rew_3_1", action: "Ты начала строить дом!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 12, category: "За пройденные программы", title: "3 программа", imageName: "rew_3_2", action: "Ты начала строить дом!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 13, category: "За пройденные программы", title: "3 программа", imageName: "pur_3_3", action: "", cheer: "Продолжай в том же духе"),

        RewardModel(id: 6, category: "За пройденные тесты", title: "5 тестов", imageName: "rew_2_1", action: "Ты получила самокат!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 7, category: "За пройденные тесты", title: "20 тестов", imageName: "rew_2_2", action: "Ты получила велосипед!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 8, category: "За пройденные тесты", title: "20 тестов", imageName: "pur_2_3", action: "", cheer: "Продолжай в том же духе"),
        
        RewardModel(id: 1, category: "За просмотренные видео-уроки", title: "5 видео-уроков", imageName: "rew_1_1", action: "Ты вырастила росток!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 2, category: "За просмотренные видео-уроки", title: "20 видео-уроков", imageName: "rew_1_2", action: "Ты вырастила трехлистный клевер!", cheer: "Продолжай в том же духе"),
        RewardModel(id: 3, category: "За просмотренные видео-уроки", title: "50 видео-уроков", imageName: "pur_1_3", action: "Ты вырастила четырехлистный клевер!", cheer: "Ты уже близко к финишной прямой"),
        RewardModel(id: 4, category: "За просмотренные видео-уроки", title: "100 видео-уроков", imageName: "pur_1_4", action: "Ты вырастила ветку!", cheer: "Ты уже близко к финишной прямой"),
    ]
}

