//
//  AddSupplier.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 1.07.2022.
//

import SwiftUI
import Alamofire

struct AddSupplier: View {
  
  @State private var suppliers: [SupplierModel] = []
  @State private var companyName: String = ""
  @State private var contactName: String = ""
  @State private var contactTitle: String = ""
  
  var body: some View {
    
    ZStack {
      Form {
        Section("Supplier Information") {
          TextField("Company Name", text: $companyName)
          TextField("Contact Name", text: $contactName)
          TextField("Contact Title", text: $contactTitle)
          RoundedRectangle(cornerRadius: .zero)
            .foregroundColor(.clear)
            .overlay( Button("Add New") {
              let newSupplier : [String : Any] = [
                "companyName" : companyName,
                "contactName" : contactName,
                "contactTitle" : contactTitle
              ]
              AF.request("https://northwind.vercel.app/api/suppliers", method: .post, parameters: newSupplier, encoding: JSONEncoding.default).responseDecodable(of: SupplierModel.self) { response in
              }
            })
        }
      }
    }
    
    
    
  }
}

struct AddSupplier_Previews: PreviewProvider {
  static var previews: some View {
    AddSupplier()
  }
}
