//
//  TargetSuppliers.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 2.07.2022.
//

import SwiftUI

struct TargetSuppliers: View {
  @EnvironmentObject var supplierCounter: SupplierCounter
  
  var body: some View {
    Text("Number of Suppliers: \(supplierCounter.counter)")
      .foregroundColor(Color("Cornflower Blue"))
  }
}

struct TargetSuppliers_Previews: PreviewProvider {
  static var previews: some View {
    TargetSuppliers().environmentObject(SupplierCounter())
  }
}
