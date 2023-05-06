//
//  ProfileCheckView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct ProfileCheckView: View {
    
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()
    
    var body: some View {
        NavigationView {
            Text("Check profile")
        }
    }
}

struct ProfileCheckView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCheckView()
    }
}
