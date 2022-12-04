//
//  ToDo.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//


struct ToDo {
  let whatStatus: String
//  let whatToDo: String
//  let moreAbout: String
}

extension ToDo {
  static func getToDoList() -> [ToDo] {
    var toDoList: [ToDo] = []
    
    let status = DataManager.shared.status
    let toDo = DataManager.shared.toDo
    let moreInfo = DataManager.shared.moreInfo
    
    let iteretionCount = min(
          status.count,
          toDo.count,
          moreInfo.count
        )
    
    for index in 0..<iteretionCount {
      let toDo = ToDo(whatStatus: status[index])
      toDoList.append(toDo)
    }
    
    return toDoList
  }
}
