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
            NavigationLink(destination: SupplierDetail(id: item.id, companyName: item.companyName, contactName: item.contactName, contactTitle: item.contactTitle)) {
              Text(item.contactName)
            }
          }
        }
      }.onAppear() {
        let request = AF.request("https://northwind.vercel.app/api/suppliers");
        request.responseDecodable(of: [SupplierModel].self) { response in
          print("response is", response)
          suppliers = response.value ?? []
        }
      }
      .navigationBarTitle(Text("Products"), displayMode: .inline)
      .toolbar {
        ToolbarItem { NavigationLink("Add New", destination: AddSupplier()) }
      }
    }
  }
  

  //  var disableDelete: Bool {
  //      if let mode = editMode?.wrappedValue, mode != .active {
  //          return true
  //      }
  //      return false
  //  }
}

struct Products_Previews: PreviewProvider {
  static var previews: some View {
    Suppliers()
  }
}
