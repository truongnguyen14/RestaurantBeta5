//
//  WelcomeView.swift
//  ContactList
//
//  Created by Truong, Nguyen Tan on 02/08/2023.//

import SwiftUI

struct Welcomeview: View {
    @State var isWelcomeActive: Bool = true
    var body: some View {
        ZStack {
            if isWelcomeActive {
                Greeting(active: $isWelcomeActive)
            } else {
                Restaurantlist()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Welcomeview()
    }
}
