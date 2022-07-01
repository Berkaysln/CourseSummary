//
//  ProductsModel.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 1.07.2022.
//

import Foundation

struct SupplierModel: Codable, Hashable {
    let id: Int
    let companyName, contactName: String
    let contactTitle: String?
}
