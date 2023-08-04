//
//  GreetingView.swift
//  ContactList
//
//  Created by Truong, Nguyen Tan on 02/08/2023.//

import SwiftUI

struct Greeting: View {
    @Binding var active: Bool
    @State var popup = false

    var body: some View {
        ZStack{
            Color("Yellow").ignoresSafeArea(.all, edges: .all)
            
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
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    Text("""
                    In
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    Text("Ho Chi Minh city")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    
                }
                
                Image("fine-dining-icon-2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
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
                
                Button(action: {
                    popup = true
                })
                {Image(systemName: "info.circle")
                        .foregroundColor(.black)
                        .padding(.leading, 290)
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                    
                }
                .alert(isPresented:$popup) {
                    Alert(
                        title: Text("App author"),
                        message: Text("""
                                      Name: Nguyen Tan Truong
                                      Student ID: s3754703
                                      Program: IT
                                      """)
                    )
                }
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        Greeting(active: .constant(true))
    }
}
