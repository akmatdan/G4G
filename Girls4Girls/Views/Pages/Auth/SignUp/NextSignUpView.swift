//
//  NextSignUpView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI
//import FirebaseAuth

struct NextSignUpView: View {
    
    @StateObject private var loginData = UserStateViewModel()
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var showAlert = false
    
    @State private var isPopoverShown = false
    @State private var isToggleOn = false
    
    
    @State private var isDetailActive = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var region: DropdownMenuOption? = nil
    
    var body: some View {
        
        ZStack {
            ZStack(alignment: .topLeading) {
                GeometryReader { _ in
                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            // Navigation
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
                                        Text("Регистрация")
                                            .frame(width: UIScreen.main.bounds.height * (1/4))
                                            .foregroundColor(Color.theme.darkPurple)
                                        Spacer()
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            
                            VStack {
                                // Title of page
                                Text("Расскажи немоного о себе")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                    .padding()
                                
                                VStack(spacing: 10) {
                                    Text("Дата рождения")
                                    
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
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.theme.purple, lineWidth: 1)
                                    )
                                    .padding()
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("Пол")
                                        HStack(spacing:40) {
                                            SelectButton(
                                                isSelected: $isSelected,
                                                color: Color.theme.purple,
                                                text: "М")
                                            .onTapGesture {
                                                isSelected.toggle()
                                                
                                                if isSelected {
                                                    isSelected2 = false
                                                    loginData.gender = "М"
                                                }
                                            }
                                            
                                            SelectButton(
                                                isSelected: $isSelected2,
                                                color: Color.theme.purple,
                                                text: "Ж")
                                            .onTapGesture {
                                                isSelected2.toggle()
                                                
                                                if isSelected2 {
                                                    isSelected = false
                                                    loginData.gender = "Ж"
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 70)
                                    
                                    Spacer()
                                    
                                    Text("Регион")
                                    
                                    DropdownMenu(
                                        selectedOption: Binding<String>(
                                            get: {
                                                // Map the loginData.region string to a new string value
                                                return loginData.region ?? ""
                                            },
                                            set: { newValue in
                                                // Update the loginData.region string when the selected option changes
                                                loginData.region = newValue
                                            }
                                        ),
                                        placeholder: "Выбери регион",
                                        options: DropdownMenuOption.testAllNames
                                    )
                                    
                                    
                                    Spacer()
                                    
                                }
                            }
                            .padding()
                        }
                        .navigationBarHidden(true)
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct NextSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NextSignUpView()
    }
}
