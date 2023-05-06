//
//  FormApplForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 11/4/23.
//

import SwiftUI

struct FormApplForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    let forumData: Forum
    
    @StateObject var formVM = FormViewModel()
    @State var isFinished: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.5)
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
                            Text("Анкета")
                                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
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
                        Text("Заявка на форум")
                            .font(.custom(FontsManager.Mulish.semiBold, size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.horizontal, 25)
                        
                        AppField(text: "Фамилия и имя", bind: $formVM.name, placeholder: "")
                        AppField(text: "Электронная почта", bind: $formVM.email, placeholder: "")
                        AppField(text: "Номер телефона", bind: $formVM.phone, placeholder: "")

                        DateOfBirthForm()
                        
                        RegionForm2()
                        
//                        Button {
//
//                        } label: {
//                            HStack {
//                                Text("Сохранить")
//                                    .fontWeight(.semibold)
//                                    .font(.title3)
//                                    .foregroundColor(Color.theme.darkPurple)
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.white)
//                                    .cornerRadius(10)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .stroke(Color.theme.darkPurple, lineWidth: 1)
//                                    )
//                                    .padding()
//                                    .padding(.horizontal, 10)
//
//                            }
//                        }
                        
                        Button {
                            formVM.registerForm(eventId: forumData.id)
                            isFinished = true
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
                        .padding(.horizontal,25)
                        .fullScreenCover(isPresented: $isFinished) {
                            FinishAppForm()
                        }
                    }
                }
            }
        }
    }
}

struct DateOfBirthForm: View {

    @State private var date: Date?
    @StateObject private var loginData = UserStateViewModel()
    
    var body: some View {
        Text("Дата рождения")
            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .padding(.horizontal, 25)
        
        DatePickerTextField(placeholder: "dd-MM-yyyy",
                             date: Binding(
                                get: {
                                    if let dateString = loginData.date_of_birth {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "dd-MM-yyyy"
                                        if let date = dateFormatter.date(from: dateString) {
                                            return date
                                        }
                                    }
                                    return nil
                                },
                                set: { newDate in
                                    if let newDate = newDate {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "dd-MM-yyyy"
                                        loginData.date_of_birth = dateFormatter.string(from: newDate)
                                    }
                                }
                             ))

        .disableAutocorrection(true)
        .autocapitalization(.none)
        .padding()
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}

struct RegionForm2: View {
    
    @ObservedObject var viewModel = FormViewModel()
    @State private var region: DropdownMenuOption? = nil
    
    var body: some View {
        Text("Из какого вы региона")
            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .padding(.horizontal, 25)
        
        DropdownApp(selectedOptions: self.$region, text: "", bind: viewModel.region ?? "", options: DropdownMenuOption.testAllNames)
            
        AppField(text: "Укажите район и село", bind: $viewModel.city, placeholder: "Н-р: Ак-Талинский район, село Баетова")
    }
}

struct FormApplForm_Previews: PreviewProvider {
    static var previews: some View {
        FormApplForm(forumData: Forum(id: 1, event: "", name: "", description: "", start_date: "", end_date: "", created_date: "", image: "", is_active: false, city: "", location: ""), isFinished: true)
    }
}
