//
//  FavoriteComradesTableViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 02.07.2022.
//

import UIKit

class FavoriteComradesTableViewController: UITableViewController {

    var comrades = [
        Comrades(name: "Владимир Ильич Ленин", image: UIImage(named: "imageComradeVladimirIlyichLenin")),
        Comrades(name: "Сергей Павлович Королев", image: UIImage(named: "imageComradeSergeiPavlovichKorolev")),
        Comrades(name: "Андрей Дмитриевич Сахаров", image: UIImage(named: "imageComradeAndreyDmitrievichSakharov")),
        Comrades(name: "Юрий Алексеевич Гагарин", image: UIImage(named: "imageComradeYuriAlekseyevichGagarin")),
        Comrades(name: "Сергей Анатольевич Курёхин", image: UIImage(named: "imageComradeSergeiAnatolievichKuryokhin")),
        Comrades(name: "Виктор Робертович Цой", image: UIImage(named: "imageComradeViktorRobertovichTsoi")),
        Comrades(name: "Георгий Константинович Жуков", image: UIImage(named: "imageComradeGeorgyKonstantinovichZhukov")),
        Comrades(name: "Маяковский Владимир Владимирович", image: UIImage(named: "imageComradeMayakovskyVladimirVladimirovich")),
        Comrades(name: "Пастернак Борис Леонидович", image: UIImage(named: "imageComradePasternakBorisLeonidovich")),
        Comrades(name: "Цветаева Марина Ивановна", image: UIImage(named: "imageComradeTsvetaevaMarinaIvanovna")),
        Comrades(name: "Ахматова Анна Андреевна", image: UIImage(named: "imageComradeAkhmatovaAnnaAndreevna")),
        Comrades(name: "Рождественский Роберт Иванович", image: UIImage(named: "imageComradeRozhdestvenskyRobertIvanovich")),
        Comrades(name: "Булгаков Михаил Афанасьевич", image: UIImage(named: "imageComradeBulgakovMikhailAfanasyevich")),
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
        return comrades.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComradesCell",
                                                       for: indexPath) as? ComradesCell else {
            preconditionFailure("Error")
        }

        cell.nameComradeLabel.text = comrades[indexPath.row].name
        cell.imageComrade.image = comrades[indexPath.row].image


        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showAvatar",
           let destinationVC = segue.destination as? ComradeImagesCollectionViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let nameComrade = comrades[indexPath.row].name
            destinationVC.title = nameComrade
            destinationVC.comradImages.append(comrades[indexPath.row].image!)
        }
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
