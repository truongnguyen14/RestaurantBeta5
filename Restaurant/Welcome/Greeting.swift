//
//  GreetingView.swift
//  ContactList
//
//  Created by Truong, Nguyen Tan on 02/08/2023.//

import SwiftUI

struct Greeting: View {
    @Binding var active: Bool
    var body: some View {
        ZStack{
            Color("Bisque").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                Spacer()
                VStack(spacing: 0) {
                    Text("Bonjour")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 20)
                VStack(spacing: 20){
                    Text("""
                    Enhence your fine-dining experience
                    """)
                      .font(.title3)
                      .fontWeight(.light)
                      .foregroundColor(.red)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 10)
                    Text("""
                    In
                    """)
                      .font(.title3)
                      .fontWeight(.light)
                      .foregroundColor(.red)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 10)
                    Text("Ho Chi Minh city")
                      .font(.title3)
                      .fontWeight(.light)
                      .foregroundColor(.red)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 10)
                    
                }
                Spacer()


                Button(action: {
                    active = false
                }, label: {
                    Capsule()
                      .fill(Color.black.opacity(8))
                      .padding(8)
                      .frame(width: 340, height:80)
                      .overlay(Text("Discover")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                })
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        Greeting(active: .constant(true))
    }
}
