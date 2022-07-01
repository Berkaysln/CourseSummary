//
//  Products.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 1.07.2022.
//

import SwiftUI
import Alamofire

struct Suppliers: View {
  
  @State private var suppliers: [SupplierModel] = []
  @Environment(\.editMode) var editMode
  
  var body: some View {
    ZStack {
      VStack {
        List {
          ForEach(suppliers, id: \.self) { item in
          Text(item.companyName)
          Text(item.contactName)
          Text(item.contactTitle ?? "")
          }.onDelete(perform: delete)
            .deleteDisabled(disableDelete)
            
        }
        
      }.onAppear() {
        let request = AF.request("https://northwind.vercel.app/api/suppliers");
        request.responseDecodable(of: [SupplierModel].self) { response in
          suppliers = response.value ?? []
        }
      }
      .navigationBarTitle(Text("Products"), displayMode: .inline)
      .toolbar {
        ToolbarItem { EditButton() }
      }
    }
  }
  func delete(at indexes: IndexSet) {
    if let first = indexes.first {
      suppliers.remove(at: first)
    }
  }
  var disableDelete: Bool {
      if let mode = editMode?.wrappedValue, mode != .active {
          return true
      }
      return false
  }
}

struct Products_Previews: PreviewProvider {
  static var previews: some View {
    Suppliers()
  }
}
