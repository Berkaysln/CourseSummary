//
//  ContentView.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 28.06.2022.
//

import SwiftUI

class SupplierCounter: ObservableObject {
  @Published var counter: Int = 0
}

struct ContentView: View {
  var body: some View {
    NavigationView {
      Form {
        NavigationLink("Multiply", destination: Multiply())
        NavigationLink("ArrayForm", destination: ArrayForm())
        NavigationLink("UserList", destination: UserList())
        NavigationLink("To-Do List", destination: ToDos())
        NavigationLink("Suppliers", destination: Suppliers())

      }
    }
    .environmentObject(SupplierCounter())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
