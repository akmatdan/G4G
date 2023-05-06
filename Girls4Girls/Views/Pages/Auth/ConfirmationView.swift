//
//  ConfirmationView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        ZStack {
            // background
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
                    .ignoresSafeArea()
            VStack {
                Text("Мы отправили ссылку на электронную почту something@gmail.com для подтверждения.")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    
                
                Text("Пожалуйста проверьте свою почту")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    
                
                Text("Изменить электронную почту")
                            .underline()
                            .foregroundColor(Color.theme.darkPurple)
                            .onTapGesture {
                                guard let url = URL(string: "https://www.example.com") else { return }
                                UIApplication.shared.open(url)
                            }
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
