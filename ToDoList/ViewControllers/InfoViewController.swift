//
//  InfoViewController.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//

import UIKit

class InfoViewController: UIViewController {

  @IBOutlet weak var statusTF: UITextField!
  
  @IBOutlet weak var toDoTF: UITextField!
  
  @IBOutlet weak var infoTF: UITextField!
  
  var toDo: ToDo!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    statusTF.text = toDo.whatStatus
    toDoTF.text = toDo.whatToDo
    infoTF.text = toDo.moreAbout
    }
    
}
