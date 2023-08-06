/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 04/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

struct Locationlist: View {
    
    @EnvironmentObject private var vm: Locationviewmodel
    
    var body: some View {
        List {
            ForEach(vm.restaurantsdata) {
                location in
                Button {
                    vm.showLocation(location: location)
                } label: {
                    Listrow(location: location)
                }
                .padding()
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct Locationlist_Previews: PreviewProvider {
    static var previews: some View {
        Locationlist().environmentObject(Locationviewmodel())
    }
}

extension Locationlist {
    
    private func Listrow(location: Restaurant) -> some View {
        HStack{
            Image(location.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
