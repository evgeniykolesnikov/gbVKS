//
//  FavoriteComradesTableViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 02.07.2022.
//

import UIKit

class FavoriteComradesTableViewController: UITableViewController {

    let myComrades = [
        Comrade(name: "Владимир Ильич Ленин", image: UIImage(named: "sourseImageComradeVladimirIlyichLenin"), comrade: newComrade),
        Comrade(name: "Сергей Павлович Королев", image: UIImage(named: "sourseImageComradeSergeiPavlovichKorolev"), comrade: newComrade),
        Comrade(name: "Андрей Дмитриевич Сахаров", image: UIImage(named: "sourseImageComradeAndreyDmitrievichSakharov"), comrade: newComrade),
        Comrade(name: "Юрий Алексеевич Гагарин", image: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin"), comrade: newComrade),
        Comrade(name: "Сергей Анатольевич Курёхин", image: UIImage(named: "sourseImageComradeSergeiAnatolievichKuryokhin"), comrade: newComrade),
        Comrade(name: "Виктор Робертович Цой", image: UIImage(named: "sourseImageComradeViktorRobertovichTsoi"), comrade: newComrade),
        Comrade(name: "Георгий Константинович Жуков", image: UIImage(named: "sourseImageComradeGeorgyKonstantinovichZhukov"), comrade: newComrade),
        Comrade(name: "Маяковский Владимир Владимирович", image: UIImage(named: "sourseImageComradeMayakovskyVladimirVladimirovich"), comrade: newComrade),
        Comrade(name: "Пастернак Борис Леонидович", image: UIImage(named: "sourseImageComradePasternakBorisLeonidovich"), comrade: newComrade),
        Comrade(name: "Цветаева Марина Ивановна", image: UIImage(named: "sourseImageComradeTsvetaevaMarinaIvanovna"), comrade: newComrade),
        Comrade(name: "Ахматова Анна Андреевна", image: UIImage(named: "sourseImageComradeAkhmatovaAnnaAndreevna"), comrade: newComrade),
        Comrade(name: "Рождественский Роберт Иванович", image: UIImage(named: "sourseImageComradeRozhdestvenskyRobertIvanovich"), comrade: newComrade),
        Comrade(name: "Булгаков Михаил Афанасьевич", image: UIImage(named: "sourseImageComradeBulgakovMikhailAfanasyevich"), comrade: newComrade),
    ]

    var sortedComrade = [Character: [Comrade]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ComradeTableViewCell", bundle: nil), forCellReuseIdentifier: "ComradeXib")

        self.sortedComrade = sort(comrades: myComrades)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func sort(comrades: [Comrade]) -> [Character: [Comrade]] {
        var comradesDict = [Character: [Comrade]]()

        comrades.forEach() { comrade in

            guard let firstChar = comrade.name.first else {return }

            if var thisCharComrades = comradesDict[firstChar] {
                thisCharComrades.append(comrade)
                comradesDict[firstChar] = thisCharComrades
            } else {
                comradesDict[firstChar] = [comrade]
            }
        }

        return comradesDict
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedComrade.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedComrade.keys.sorted()
        let comrades = sortedComrade[keySorted[section]]?.count ?? 0

        return comrades
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComradeXib",
                                                       for: indexPath) as? ComradeTableViewCell else {
            preconditionFailure("Error")
        }

        let firstChar = sortedComrade.keys.sorted()[indexPath.section]

        let comrades = sortedComrade[firstChar]!

        let comrade: Comrade = comrades[indexPath.row]

        cell.comradeLabel.text = comrade.name
        cell.comradeImageView.image = comrade.image


        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showAvatar",
           let destinationVC = segue.destination as? ComradeImagesCollectionViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let nameComrade = myComrades[indexPath.row].name
            destinationVC.title = nameComrade
            destinationVC.comradImages.append(myComrades[indexPath.row].image!)
            destinationVC.arrayComrade = myComrades[indexPath.row].comrade
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
