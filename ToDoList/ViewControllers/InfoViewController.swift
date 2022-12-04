//
//  InfoViewController.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//

import UIKit

class InfoViewController: UIViewController {

  @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBOutlet weak var statusTF: UITextField!
    
    var newToDo: ToDo!

  override func viewDidLoad() {
      super.viewDidLoad()
      
      saveButton.isEnabled = false
      
      statusTF.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
        }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func saveNewToDo() {
        newToDo = ToDo(whatStatus: statusTF.text ?? "")
    }
}

extension InfoViewController: UITextFieldDelegate {
    
    @objc private func textFieldChange() {
        
        if statusTF.text?.isEmpty == true {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
}
