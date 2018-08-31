//
//  TeachersTableTableViewController.swift
//  MyTeachers
//
//  Created by Daniel Aguiar on 31/08/18.
//  Copyright © 2018 Daniel Aguiar. All rights reserved.
//

import UIKit

import CoreData

class TeachersTableTableViewController: UITableViewController {

    var fetchedResultController: NSFetchedResultsController<Teacher>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadteachers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _ = sender as? UITableViewCell else {return}
        
        guard let vc = segue.destination as? TeacherViewController else {return}
        
        let teacher = fetchedResultController.object(at: tableView.indexPathForSelectedRow!)
        
        vc.teacher = teacher
    }
    
    
    func loadteachers() {
        let fetchRequest: NSFetchRequest<Teacher> = Teacher.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "theme", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultController.delegate = self
        
        try? fetchedResultController.performFetch()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let teacher = fetchedResultController.object(at: indexPath)
        
        cell.textLabel?.text = teacher.name
        cell.detailTextLabel?.text = teacher.theme

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let teacher = fetchedResultController.object(at: indexPath)
            
            context.delete(teacher)
            
            try? context.save()
            
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
extension TeachersTableTableViewController: NSFetchedResultsControllerDelegate{
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange andObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
        
        tableView.reloadData()
        
    }
    
    
}


