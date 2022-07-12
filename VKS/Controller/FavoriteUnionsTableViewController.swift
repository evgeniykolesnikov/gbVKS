//
//  FavoriteUnionsTableViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 02.07.2022.
//

import UIKit

class FavoriteUnionsTableViewController: UITableViewController {

    var unions = [
        Union(name: "Союз Писателей", image: UIImage(systemName: "pencil.circle")),
        Union(name: "Профсоюз Курьер", image: UIImage(systemName: "bicycle")),
        Union(name: "Профсоюз работников высшей школы и научных учреждений", image: UIImage(systemName: "brain")),
        Union(name: "Профсоюз актеров театра и кино", image: UIImage(systemName: "paintpalette")),
        Union(name: "Союз шоферов", image: UIImage(systemName: "car.fill")),
        Union(name: "Союз слесарей", image: UIImage(systemName: "gear")),
        Union(name: "Профсоюза работников медико-санитарного труда", image: UIImage(systemName: "heart")),
        Union(name: "Профсоюза работников народного образования и науки", image: UIImage(systemName: "brain.head.profile")),
    ]

    var sortedUnions = [Character: [Union]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "UnionXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "UnionXib")

        self.sortedUnions = sort(unions: unions)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func sort(unions: [Union]) -> [Character: [Union]] {
        var unionsDict = [Character: [Union]]()

        unions.forEach() { union in

            guard let firstChar = union.name.first else {return }

            if var thisCharUnions = unionsDict[firstChar] {
                thisCharUnions.append(union)
                unionsDict[firstChar] = thisCharUnions
            } else {
                unionsDict[firstChar] = [union]
            }
        }

        return unionsDict
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedUnions.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedUnions.keys.sorted()
        let unions = sortedUnions[keySorted[section]]?.count ?? 0

        return unions
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnionXib",
                                                       for: indexPath) as? UnionXIBTableViewCell else {
            preconditionFailure("Error")
        }

        let firstChar = sortedUnions.keys.sorted()[indexPath.section]

        let unions = sortedUnions[firstChar]!

        let union: Union = unions[indexPath.row]

        cell.unionLabelView.text = union.name
        cell.unionImageView.image = union.image

        return cell
    }


    @IBAction func addSelectedUnion(segue: UIStoryboardSegue) {

        if let sourseVC = segue.source as? AllUnionsTableViewController,
           let indexPath = sourseVC.tableView.indexPathForSelectedRow {
            let union = sourseVC.unions[indexPath.row]
            if !unions.contains(where: {$0.name == union.name}) {
            unions.append(union)

            tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedUnions.keys.sorted()[section])
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            unions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
