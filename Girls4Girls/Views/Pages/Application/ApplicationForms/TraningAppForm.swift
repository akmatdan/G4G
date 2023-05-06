//
//  TraningAppForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 11/4/23.
//

import SwiftUI

struct TraningAppForm: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @Environment(\.presentationMode) var presentationMode

    let trainingId: Traning
    
    var body: some View {
        ZStack {
            
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
                            Text("Анкета")
                                .frame(width: 250)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.leading, 20)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("Заявка на тренинг")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.horizontal, 25)
                        
                        AppField(text: "Фамилия и имя", bind: $loginData.FL_name, placeholder: "")
                        AppField(text: "Электронная почта", bind: $loginData.email, placeholder: "")
                        AppField(text: "Номер телефона", bind: $loginData.phone_number, placeholder: "")
//
                        DateOfBirth()

                        RegionForm()

                        selectionOption3()
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Сохранить")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(Color.theme.darkPurple)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.theme.darkPurple, lineWidth: 1)
                                    )
                                    .padding()
                                    .padding(.horizontal, 10)
                                
                            }
                        }
                        
                        Button {
//                            loginData.userRegisterEvent()
                        } label: {
                            HStack {
                                Text("Отправить")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(Color.theme.darkPurple)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .background(Color.theme.purple)
                        .cornerRadius(10)
                        .padding(.horizontal, 25)
                        
                    }
                    
                }
            }
            .themeGradient()
        }
    }
}

struct selectionOption3: View {
    
    @State private var selectedOption: Int?
    @State private var otherOptionText: String = ""
    
    var body: some View {
        VStack {
            Text("Будет ли у вас возможность приезжать и уезжать на место тренинга в дни его проведения?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 25)
            
            ForEach(0..<2) { index in
                Button(action: {
                    self.selectedOption = index
                }) {
                    HStack {
                        Circle()
                            .stroke(Color.theme.purple, lineWidth: 2)
                            .background(self.selectedOption == index ? Circle().stroke(Color.theme.purple, lineWidth: 7) : nil)
                            .frame(width: 22, height: 22)
                            .padding(.leading, 20)
                        
                        Text(index == 0 ? "Да" : "Нет")
                            .foregroundColor(.black)
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
        }
        
        PurposeForm3()

        PurposeForm4()

        selectionOption4()

        PurposeForm5()
        
        selectionOption2()
    }
}

struct PurposeForm3: View {
    
    @StateObject private var loginData = UserStateViewModel()
    var body: some View {
        VStack {
            Text("Почему именно вы должны принять участие в этом тренинге?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, 10)
            
            TextField("", text: $loginData.emtyVar)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .padding()
                .frame(width: .infinity, height: 200, alignment: .topLeading)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            Text("Макс 100/0")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

struct PurposeForm4: View {
    @StateObject private var loginData = UserStateViewModel()
    var body: some View {
        VStack {
            Text("Что вы ожидаете от нашего тренинга? Чему вы хотите научиться?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, 10)
            
            TextField("", text: $loginData.emtyVar)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .padding()
                .frame(width: .infinity, height: 200, alignment: .topLeading)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            Text("Макс 100/0")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

struct PurposeForm5: View {
    
    @StateObject private var loginData = UserStateViewModel()
    var body: some View {
        VStack {
            Text("Какие темы вас еще интересуют?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, 10)
            
            TextField("", text: $loginData.emtyVar)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .padding()
                .frame(width: .infinity, height: 200, alignment: .topLeading)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            Text("Макс 100/0")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

struct selectionOption4: View {
    
    @State var selectedOption: [String?] = ["Карьерная готовность","Тайм-менеджмент", "Цифровая грамотность", "Здоровый образ жизни", "Школьное насилие", "Репродуктивное здоровье","Осознанность", "Соблюдение прав человека"]
    
    var body: some View {
        VStack {
            Text("Какие из тем тренинга вас интересуют больше всего?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 25)
            
            ForEach(0..<selectedOption.count) { index in
                Button(action: {
                    if self.selectedOption[index] == nil {
                                self.selectedOption[index] = nil
                            } else {
                                self.selectedOption[index] = selectedOption[index]
                            }
                }) {
                    HStack {
                        Rectangle()
                            .stroke(Color.theme.purple, lineWidth: 2)
                            .background(self.selectedOption[index] == nil ? Color.theme.purple : Color.white)
                            .frame(width: 22, height: 22)
                            .padding(.leading, 20)
            
                        Text("\(selectedOption[index] ?? "")")
                            .foregroundColor(.black)
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
//
//struct TraningAppForm_Previews: PreviewProvider {
//    static var previews: some View {
//        TraningAppForm(id: 2, traningId: Traning(id: 3, event: "", name: "", description: "", start_date: "", end_date: "", created_date: "", location: "", city: "", image: "", is_active: true))
//    }
//}
