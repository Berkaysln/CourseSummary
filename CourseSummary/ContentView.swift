//
//  ContentView.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      Form {
        NavigationLink("Multiply", destination: Multiply())
        NavigationLink("ArrayForm", destination: ArrayForm())
        NavigationLink("UserList", destination: UserList())
        NavigationLink("To-Do List", destination: ToDos())

      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
