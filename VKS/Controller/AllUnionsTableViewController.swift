//
//  AllUnionsTableViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 03.07.2022.
//

import UIKit

class AllUnionsTableViewController: UITableViewController {

    

    @IBOutlet override var tableView: UITableView! {
            didSet {
                tableView.dataSource = self
                tableView.delegate = self
            }

    }

    let unions = [
        Unions(name: "Союз Писателей1", image: UIImage(systemName: "pencil.circle")),
        Unions(name: "Профсоюз Курьер", image: UIImage(systemName: "bicycle")),
        Unions(name: "Профсоюз работников высшей школы и научных учреждений", image: UIImage(systemName: "brain")),
        Unions(name: "Профсоюз актеров театра и кино", image: UIImage(systemName: "paintpalette")),
        Unions(name: "Союз шоферов", image: UIImage(systemName: "car.fill")),
        Unions(name: "Союз слесарей", image: UIImage(systemName: "gear")),
        Unions(name: "Профсоюза работников медико-санитарного труда", image: UIImage(systemName: "heart")),
        Unions(name: "Профсоюза работников народного образования и науки", image: UIImage(systemName: "brain.head.profile")),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "UnionXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "UnionXib")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return unions.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UnionXib", for: indexPath) as! UnionXIBTableViewCell

        let content = cell
        content.unionLabelView.text = unions[indexPath.row].name
        content.unionImageView.image = unions[indexPath.row].image

        cell.contentConfiguration = content as? UIContentConfiguration

        return cell
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
