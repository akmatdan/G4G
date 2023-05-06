//
//  MentorshipForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 10/4/23.
//

import SwiftUI

struct MentorshipForm: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @Environment(\.presentationMode) var presentationMode
    let mentorshipProgram: Mentorships
    
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
                        Text("Заявка на менторскую программу")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.horizontal, 25)
                        
//                        let eventId = String(mentorshipProgram.id)
//                        TextField("", text: Binding(
//                            get: { String(userVM.event) },
//                            set: { _,_ in userVM.event = Int(eventId) ?? 0 }
//                        ))
//                        .foregroundColor(.white)
//                        .opacity(1)
//                        
//                        AppField(text: "Фамилия и имя", bind: $userVM.full_name, placeholder: "")
//                        AppField(text: "Электронная почта", bind: $userVM.email, placeholder: "")
//                        AppField(text: "Номер телефона", bind: $userVM.phone_number, placeholder: "")
                        
                        DateOfBirth()
                        
                        RegionForm()
                        
                        PurposeForm(mentorshipProgram: mentorshipProgram)
                        
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
//                            userVM.registerUserForm()
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
                    }
                }
            }
            .themeGradient()
        }
    }
}

struct MentorshipForm_Previews: PreviewProvider {
    static var previews: some View {
        MentorshipForm(mentorshipProgram: Mentorships(id: 3, event: "", start_date: "", end_date: "", image: "", created_date: "", is_active: true, name: "MentorshipName", city: "Bish", description: "blalbalbla", location: "Tynystanova"))
    }
}

struct DateOfBirth: View {
    
    @State private var date: Date?
    @StateObject private var loginData = UserStateViewModel()
    
    var body: some View {
        Text("Дата рождения")
            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .padding(.horizontal, 25)
        
        DatePickerTextField(placeholder: "дд/мм/гггг",
                            date: Binding(
                                get: {
                                    let components = DateComponents(year: Int(loginData.date_of_birth ?? ""))
                                    return Calendar.current.date(from: components)
                                },
                                set: { newDate in
                                    if let newDate = newDate {
                                        let year = Calendar.current.component(.year, from: newDate)
                                        loginData.date_of_birth = String(year)
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

struct RegionForm: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @State private var region: DropdownMenuOption? = nil
    
    var body: some View {
        Text("Из какого вы региона")
            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .padding(.horizontal, 25)
        
        DropdownApp(selectedOptions: self.$region, text: "", bind: loginData.region ?? "", options: DropdownMenuOption.testAllNames)
            
        AppField(text: "Укажите район и село", bind: $loginData.district, placeholder: "Н-р: Ак-Талинский район, село Баетова")
    }
}

struct PurposeForm: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @StateObject private var eventVM = NetworkViewModel()
    let mentorshipProgram: Mentorships
    
    var body: some View {
        VStack {
            
            /*
            ScrollView(.vertical) {
                VStack {
                    ForEach(eventVM.eventsQuestions, id: \.id) { question in
                        Text(question.question_text)
                    }.onAppear {
                        eventVM.fetchData(for: .eventsQuestions)
                    }
                }
            }
            */
            
            
            Text("Опишите ваши конкретные цели на ближайшие 2 года? Используйте формат S.M.A.R.T для постановки цели.")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, 10)

            TextField("", text: $loginData.emtyVar)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .topLeading)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            
            Text("Макс 250/0")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
        
        PurposeForm1()

        selectionOption()

        MentorDescription()

        ResumeCV()

        selectionOption2()
    }
}

struct PurposeForm1: View {
    
    @StateObject private var loginData = UserStateViewModel()
    
    var body: some View {
        VStack {
            Text("Как участие в программе поможет вам в достижении ваших перечисленных выше целей?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
            
            TextField("", text: $loginData.emtyVar)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .topLeading)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            
            Text("Макс 250/0")
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

struct selectionOption: View {
    
    @State private var selectedOption: Int?
    @State private var otherOptionText: String = ""
    
    var body: some View {
        VStack {
            Text("Имеется ли у вас опыт работы с ментором?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 25)
            
            ForEach(0..<3) { index in
                Button(action: {
                    self.selectedOption = index
                }) {
                    HStack {
                        Circle()
                            .stroke(Color.theme.purple, lineWidth: 2)
                            .background(self.selectedOption == index ? Circle().stroke(Color.theme.purple, lineWidth: 7) : nil)
                            .frame(width: 22, height: 22)
                            .padding(.leading, 20)
                        
                        Text(index == 0 ? "Да" : index == 1 ? "Нет" : "Другое")
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

struct MentorDescription: View {
    @StateObject private var loginData = UserStateViewModel()
    
    var body: some View {
        VStack {
            Text("Опишите своего идеального ментора")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, 10)
            
            TextField("", text: $loginData.emtyVar)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .topLeading)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
            
            Text("Макс 250/0")
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

struct ResumeCV: View {
    
    @StateObject private var loginData = UserStateViewModel()
    
    var body: some View {
        VStack {
            Text("Прикрепите свое резюме или CV")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 10)
            
            Button {
                
            } label: {
                ZStack {
                    HStack {
                        Image("resumeLogo")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(10)
                        
                        Text("Прикрепить файл")
                            .font(.custom(FontsManager.Mulish.bold, size: 16))
                            .foregroundColor(Color.theme.purple)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.purple, lineWidth: 1)
                            .padding(.trailing, 120)
                    }
                }
                .padding(.horizontal,10)
            }
        }
        .padding()
    }
}

struct selectionOption2: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @State private var selectedOption: Int?
    @State private var otherOptionText: String = ""
    
    var body: some View {
        VStack {
            Text("Где вы узнали о программе?")
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.horizontal, 25)
            
            ForEach(0..<3) { index in
                Button(action: {
                    self.selectedOption = index

                }) {
                    HStack {
                        Circle()
                            .stroke(Color.theme.purple, lineWidth: 2)
                            .background(self.selectedOption == index ? Circle().stroke(Color.theme.purple, lineWidth: 7) : nil)
                            .frame(width: 22, height: 22)
                            .padding(.leading, 20)
                        
                        Text(index == 0 ? "Инстаграм" : index == 1 ? "Фейсбук" : (index == 2 ? "От друзей" : (index == 3 ? "Другое" : "")))
                            .foregroundColor(.black)
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            
            TextField("", text: $loginData.emtyVar)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .multilineTextAlignment(.leading)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .padding(.horizontal)
        }
    }
}
