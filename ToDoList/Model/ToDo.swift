//
//  ToDo.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//

import Foundation

struct ToDo {
  let whatStatus: String
  let whatToDo: String
  let moreAbout: String
}

extension ToDo {
  static func getToDoList() -> [ToDo] {
    var toDoList: [ToDo] = []
    
    let status = DataManager.shered.status
    let toDo = DataManager.shered.toDo
    let moreInfo = DataManager.shered.moreInfo
    
    let iteretionCount = min(
          status.count,
          toDo.count,
          moreInfo.count
        )
    
    for index in 0..<iteretionCount {
      let toDo = ToDo(whatStatus: status[index],
                      whatToDo: toDo[index],
                      moreAbout: moreInfo[index])
    }
    
    return toDoList
  }
}
