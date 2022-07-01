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
  @State private var suppliers: SupplierModel = SupplierModel()
  
  var body: some View {
    VStack {
      List {
        Text(String(suppliers.id))
        Text(String(suppliers.companyName))
        Text(String(suppliers.contactName))
        Text(String(suppliers.contactTitle ?? ""))
      }
      
    }.onAppear() {
      let request = AF.request("https://northwind.vercel.app/api/suppliers/\(id)")
      request.responseDecodable(of: SupplierModel.self) { response in
        suppliers = response.value!;
      }
    }
  }
}
