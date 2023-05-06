//
//  HomeView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    @State var showLoginView: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("Открываем новые возможности к становлению лучшей версией себя!")
                            .font(.custom(FontsManager.Mulish.bold, size: 25))
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.leading, 20)
                        
                        Image("photo1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 359, height: 273)
                        
                        Text("«Girls for Girls» — проект расширения прав и возможностей молодых девушек из разных регионов Кыргызстана.")
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .foregroundColor(Color.theme.darkGray)
                        
                        Text("Наши программы")
                            .font(.custom(FontsManager.Mulish.bold, size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.theme.darkPurple)
                            
                        
                        ImageCarousel9(images: [Image("photo2"),Image("photo5"),Image("photo6"), Image("photo7")],titles: ["Менторская программа","Тренинги","Форумы","Видеоблог"],detail: [
                            "В рамках программы ты сможешь получить ценный опыт и знания от опытных менторов, которые помогут тебе развиваться и достигать своих целей. Мы создали эту программу, чтобы помочь нашим талантливым и амбициозным участникам достичь успеха в своих проектах и карьере. Если ты готов принять этот вызов и получить максимальную отдачу от нашей программы, тогда мы ждем твоей регистрации!",
                            "Тренинги - отличный способ получить новые знания и научиться применять их на практике. У нас вы найдете множество тренингов на различные темы!",
                            "Приглашаем девочек всех возрастов на наши Форумы! Здесь вы найдете сообщество единомышленников, где можно обсуждать любые темы - от моды и красоты до личных отношений и карьеры. Получайте советы от опытных участников, делитесь своими мыслями и идеями, расширяйте круг своих знакомств и вдохновляйтесь на новые достижения вместе с нами!",
                            "Увлекательные истории, темы женственности и успеха - всё это ждёт тебя в нашем видеоблоге для девочек. Наслаждайся яркими кадрами, узнавай новое и получай массу вдохновения для создания своего неповторимого стиля!"],date: ["","","",""],city: ["","","",""])
                        .padding(.leading)
                        
                        Text("Новости")
                            .font(.custom(FontsManager.Mulish.bold, size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.theme.darkPurple)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(netVM.news, id: \.id) { news in
                                    NewsView(news: news)
                                }
                            }
                            
                        }
                        .onAppear {
                            netVM.fetchData(for: .news)
                        }
                    }
                }
                .padding(.top, 60)
                
                HeaderView(title: "Главная")
                
            }
            .themeGradient()
        }
        .navigationBarHidden(true)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
