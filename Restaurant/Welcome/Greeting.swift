/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 02/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
                    Text("Bonjour")     //Hello app text
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 20)
                VStack(spacing: 20){        //Slogan
                    Text("""
                    Enhence your fine-dining experience
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    Text("In")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    Text("Ho Chi Minh city")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    
                }
                
                Image("fine-dining-icon-2")     //Icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
                Spacer()
                
                //Enter button
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
                
                //Popup button
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
                        title: Text("App author"),      //Author information
                        message: Text("""
                                      Name: Nguyen Tan Truong
                                      Student ID: s3754703
                                      Program: BP162
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
