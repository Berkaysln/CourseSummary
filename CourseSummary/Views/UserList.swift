//
//  UserList.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 29.06.2022.
//

import SwiftUI

struct UserList: View {
  
  private var users: [User] = [
    User(name: "Berkay", surname: "Yaslan", email: "berkaysln1@gmail.com"),
    User(name: "Eren", surname: "Yurekli", email: "erenyurekli@gmail.com"),
    User(name: "Cagatay", surname: "Yıldız", email: "cagatay@mail.com"),
    User(name: "Furkan", surname: "Kaya", email: "furkankaya@mail.com"),
    User(name: "Cenk", surname: "Deniz", email: "cenkdeniz@mail.com")
  ]
  
  var body: some View {
    List {
      ForEach(users, id:\.self) { item in
        Text("\(item.name) \(item.surname) - \(item.email)")
      }
    }
    .navigationBarTitle(Text("User List"), displayMode: .inline)
  }
}

struct UserList_Previews: PreviewProvider {
  static var previews: some View {
    UserList()
  }
}
