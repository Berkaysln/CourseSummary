//
//  ToDos.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 29.06.2022.
//

import SwiftUI
import Alamofire

struct ToDos: View {
  
  @State var toDo: [ToDo] = []
  
  var body: some View {
    VStack {
      List(toDo, id: \.self) { item in
        HStack {
          Image(systemName: item.completed == true ? "circle.fill" : "circle")
                          .foregroundColor(Color("Neon Blue"))
          
          Text(item.title)
        }.onTapGesture {
            updateItem(item: item)
        }
        
      }.onAppear() {
        let request = AF.request("https://jsonplaceholder.typicode.com/todos");
        request.responseDecodable(of: [ToDo].self) { response in
          toDo = response.value ?? []
        }
      }
      .navigationBarTitle(Text("To Do List: \(toDo.count)")
                          , displayMode: .inline)
      .toolbar { NavigationLink("Add", destination: AddToDo())
      }
    }
  }
  func updateItem(item: ToDo) {
//    if let index = toDo.firstIndex { (existingItem) -> Bool in
//      return existingItem.id == item.id
//    } {
//      // run this code
//    }
    if let index = toDo.firstIndex(where: {$0.id == item.id}) {
      toDo[index] = item.updateCompletion()
    }
  }
}

struct ToDos_Previews: PreviewProvider {
  static var previews: some View {
    ToDos()
  }
}
