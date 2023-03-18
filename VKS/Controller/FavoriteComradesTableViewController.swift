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
        Comrade(name: "Владимир Владимирович Маяковский", image: UIImage(named: "sourseImageComradeMayakovskyVladimirVladimirovich"), comrade: newComrade),
        Comrade(name: "Борис Леонидович Пастернак", image: UIImage(named: "sourseImageComradePasternakBorisLeonidovich"), comrade: newComrade),
        Comrade(name: "Марина Ивановна Цветаева", image: UIImage(named: "sourseImageComradeTsvetaevaMarinaIvanovna"), comrade: newComrade),
        Comrade(name: "Анна Андреевна Ахматова", image: UIImage(named: "sourseImageComradeAkhmatovaAnnaAndreevna"), comrade: newComrade),
        Comrade(name: "Роберт Иванович Рождественский", image: UIImage(named: "sourseImageComradeRozhdestvenskyRobertIvanovich"), comrade: newComrade),
        Comrade(name: "Михаил Афанасьевич Булгаков", image: UIImage(named: "sourseImageComradeBulgakovMikhailAfanasyevich"), comrade: newComrade),
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
    // FIXME: The sega broke down to the new picture due to the fact that XIB Cell added to TableViewController

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

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedComrade.keys.sorted()[section])
        
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }

    
}
