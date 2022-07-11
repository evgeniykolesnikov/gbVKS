//
//  TruthTableViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 06.07.2022.
//

import UIKit
import Foundation

class TruthTableViewController: UITableViewController {
    let today = Date.now

    let myNews = [
        News(dateAndTimePost: Formators.dateFormator.string(from: Date.now), avatarImage: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), authorsNameTruthPost: "Юрий Алексеевич Гагарин", textPost: "Поехали!!!", imagePost: UIImage(named: "newsGagarinStart")),
        News(dateAndTimePost: "12 апреля 1961 в 09:07", avatarImage: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), authorsNameTruthPost: "Юрий Алексеевич Гагарин", textPost: "Поехали!!!", imagePost: UIImage(named: "newsGagarinStart")),
        News(dateAndTimePost: "12 апреля 1961 в 09:07", avatarImage: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), authorsNameTruthPost: "Юрий Алексеевич Гагарин", textPost: "Поехали!!!", imagePost: UIImage(named: "newsGagarinStart")),
        News(dateAndTimePost: "12 апреля 1961 в 09:07", avatarImage: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), authorsNameTruthPost: "Юрий Алексеевич Гагарин", textPost: "Поехали!!!", imagePost: UIImage(named: "newsGagarinStart")),
        News(dateAndTimePost: "12 апреля 1961 в 09:07", avatarImage: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), authorsNameTruthPost: "Юрий Алексеевич Гагарин", textPost: "Поехали!!!", imagePost: UIImage(named: "newsGagarinStart")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return myNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TruthTableViewCell",
                                                       for: indexPath) as? TruthTableViewCell else {
            preconditionFailure("Error")
        }
        
        cell.avatarImage.image = myNews[indexPath.row].avatarImage
        cell.imagePost.image = myNews[indexPath.row].imagePost
        cell.authorsNameTruthPost.text = myNews[indexPath.row].authorsNameTruthPost
        cell.dateAndTimePost.text = myNews[indexPath.row].dateAndTimePost
        cell.textPost.text = myNews[indexPath.row].textPost


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
