//
//  ProductsModel.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 1.07.2022.
//

import Foundation

struct SupplierModel: Codable, Hashable {
    var id: Int = 0
    var companyName: String = ""
    var contactName: String = ""
    var contactTitle: String?
}
