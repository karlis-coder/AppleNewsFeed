//
//  SavedNewsTableViewController.swift
//  AplleNewsFeed
//
//  Created by Karlis Butins on 15/02/2021.
//

import UIKit
import CoreData


class SavedNewsTableViewController: UITableViewController {
    
    var savedItems = [Items]()
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        //load
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //load
        loadData()
    }
    
    func loadData(){
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        
        do{
            savedItems = try (context?.fetch(request))!
        }catch{
            //alert
            print(error.localizedDescription)
        }
        tableView.reloadData()
    }
    
    #warning("//saveData()")
    //saveData()
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return savedItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "savedFeedCell", for: indexPath) as? NewsTableViewCell else{
            return UITableViewCell()
        }

        let item = savedItems[indexPath.row]
        
        if let image = UIImage(data: item.image!){
            cell.newsImageView.image = image
        }
        
        cell.newsTitleLabel.text = item.newsTitle
        cell.newsTitleLabel.numberOfLines = 0

        return cell
    }
    
    #warning("//height")
    //height
    
    
    //
    

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

    #warning("//didSelectatrowat")
//didSelectatrowat

}
