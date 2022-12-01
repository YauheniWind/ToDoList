//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Евгений  Гравдин  on 01/12/2022.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDoList = ToDo.getToDoList()

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
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
      let list = toDoList[indexPath.row]
      
      infolVC.status = list.whatStatus
      infolVC.toDo = list.whatToDo
      infolVC.info = list.moreAbout
//      for list in toDoList {
//        infolVC.status = list.whatStatus
//        infolVC.toDo = list.whatToDo
//        infolVC.info = list.moreAbout
//      }
//      infolVC.status = toDoList[indexPath.row]
    }

}
