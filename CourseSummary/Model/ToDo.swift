//
//  ToDo.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 29.06.2022.
//

import Foundation

struct ToDo: Hashable, Decodable {
  let userID, id: Int
  let title: String
  let completed: Bool
  
  init(userId: Int, id: Int, title: String, completed: Bool) {
    self.userID = userId
    self.id = id
    self.title = title
    self.completed = completed
  }
  
  func updateCompletion() -> ToDo {
    return ToDo(userId: userID, id: id, title: title, completed: !completed)
  }
  
  enum CodingKeys: String, CodingKey {
    case userID = "userId"
    case id, title, completed
  }
}

typealias Todo = [ToDo]
