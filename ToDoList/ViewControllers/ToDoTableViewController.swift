//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//

import UIKit

//protocol InfoViewControllerDelegate {
//    func saveAllTextField(with firstTF: UITextField, and secondTF: UITextField, also thirdTF: UITextField)
//}



class ToDoTableViewController: UITableViewController {

    var toDoList = ToDo.getToDoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      navigationItem.leftBarButtonItem = editButtonItem
        

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "editToDo", for: indexPath)

        let toDo = toDoList[indexPath.row]
           
        var content = currentCell.defaultContentConfiguration()
           
        content.text = toDo.whatStatus
        
           
        currentCell.contentConfiguration = content
                  

        return currentCell
    }

  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    .delete
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      toDoList.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    true
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let moveToDo = toDoList.remove(at: sourceIndexPath.row)
    toDoList.insert(moveToDo, at: destinationIndexPath.row)
    tableView.reloadData()
  }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let indexPath = tableView.indexPathForSelectedRow else { return }
      guard let infolVC = segue.destination as? InfoViewController else { return }
  
        infolVC.newToDo = toDoList[indexPath.row]
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let infoViewVC = segue.source as? InfoViewController else { return }
        
        infoViewVC.saveNewToDo()
        toDoList.append(infoViewVC.newToDo)
        tableView.reloadData()
    }

}

//extension ToDoTableViewController: InfoViewControllerDelegate {
//    func saveAllTextField(with firstTF: UITextField, and secondTF: UITextField, also thirdTF: UITextField) {
//
//    }
//}
