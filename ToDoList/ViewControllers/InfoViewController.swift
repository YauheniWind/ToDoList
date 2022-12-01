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
  
  var status = ""
  var toDo = ""
  var info = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
    statusTF.text = status
    toDoTF.text = toDo
    infoTF.text = info
    }
    
}
