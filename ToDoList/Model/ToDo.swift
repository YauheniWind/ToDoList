//
//  ToDo.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//


struct ToDo {
  let toDo: String
}

extension ToDo {
  static func getToDoList() -> [ToDo] {
    var toDoList: [ToDo] = []
    
    let toDo = DataManager.shared.toDo
    
    for index in 0..<toDo.count {
      let toDo = ToDo(toDo: toDo[index])
      toDoList.append(toDo)
    }
    
    return toDoList
  }
}
