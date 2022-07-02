//
//  SupplierDetail.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 1.07.2022.
//

import SwiftUI
import Alamofire

struct SupplierDetail: View {
  
  var id : Int
  var companyName: String
  var contactName: String
  var contactTitle: String?
  @State private var suppliers: [SupplierModel] = []
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack {
      List {
        Text("\(id)")
        Text("\(companyName)")
        Text(("\(contactName)"))
        Text(("\(contactTitle ?? "")"))
      }
      Button("Delete") {
        AF.request("https://northwind.vercel.app/api/suppliers/\(id)", method: .delete)
          .responseData() { response in
            let request = AF.request("https://northwind.vercel.app/api/suppliers/");
            request.responseDecodable(of: [SupplierModel].self){ response in
              suppliers = response.value ?? []
            }
          }
        presentationMode.wrappedValue.dismiss()
      }
      
    }.onAppear() {
      let request = AF.request("https://northwind.vercel.app/api/suppliers\(id)");
      request.responseDecodable(of: [SupplierModel].self) { response in
        suppliers = response.value ?? []
      }
    }
  }
  func delete(at indexes: IndexSet) {
    if let first = indexes.first {
      suppliers.remove(at: first)
    }
  }
}
