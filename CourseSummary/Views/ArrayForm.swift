//
//  ArrayForm.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 29.06.2022.
//

import SwiftUI

struct ArrayForm: View {
//  @State private var route: Void = UserDefaults.standard.set(["İstanbul", "Ankara"], forKey: "Route")

  @State private var route = ["İstanbul", "Ankara", "İzmir", "Sakarya", "Sivas", "Denizli"]
  @State private var newRoute: String = ""
  init(){
            UITableView.appearance().backgroundColor = UIColor(Color("Periwinkle Crayola"))
        }
  
  var body: some View {
    
    ZStack {
      VStack {
        HStack {
          Text("Enter a new Route")
            .foregroundColor(Color("Cornflower Blue"))
            .padding(.top)
          Spacer()
        }
        .padding(.horizontal)
        
        TextField("New route", text: $newRoute)
          .textFieldStyle(.roundedBorder)
          .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color("Neon Blue"), lineWidth: 2))
          .padding(.horizontal)
        
        Button("Add") {
          route.append(newRoute)
        }
        .frame(width: 100, height: 12)
        .padding()
        .background(Color("Cornflower Blue"))
        .foregroundColor(Color("Light Cyan"))
        .cornerRadius(12)
        
        .background(Color("Periwinkle Crayola"))
        List {
          ForEach(route, id: \.self) { places in
            Text(places)
          }
          .onDelete(perform: delete)
          .onMove(perform: moveRow)
        }
        
        .navigationBarTitle(Text("Turkey Route"), displayMode: .inline)
        .toolbar {
          ToolbarItem { EditButton() }
        }
      }
      
      .background(Color("Periwinkle Crayola"))
    }
  }
  
  func delete(at indexes: IndexSet) {
    if let first = indexes.first {
      route.remove(at: first)
    }
  }
  func moveRow(from indexes: IndexSet, to destination: Int) {
    if let first = indexes.first {
      route.insert(route.remove(at: first), at: destination)
    }
  }
}


struct ArrayForm_Previews: PreviewProvider {
  static var previews: some View {
    ArrayForm()
  }
}
