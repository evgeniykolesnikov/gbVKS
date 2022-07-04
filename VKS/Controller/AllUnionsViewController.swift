//
//  AllUnionsViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 03.07.2022.
//

import UIKit

class AllUnionsViewController: UIViewController {

    let unions = [
        Comrades(name: "Союз Писателей", image: UIImage(systemName: "pencil.circle")),
        Comrades(name: "Профсоюз Курьер", image: UIImage(systemName: "bicycle")),
        Comrades(name: "Профсоюз работников высшей школы и научных учреждений", image: UIImage(systemName: "brain")),
        Comrades(name: "Профсоюз актеров театра и кино", image: UIImage(systemName: "paintpalette")),
        Comrades(name: "Союз шоферов", image: UIImage(systemName: "car.fill")),
        Comrades(name: "Союз слесарей", image: UIImage(systemName: "gear")),
        Comrades(name: "Профсоюза работников медико-санитарного труда", image: UIImage(systemName: "heart")),
        Comrades(name: "Профсоюза работников народного образования и науки", image: UIImage(systemName: "brain.head.profile")),

    ]

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllUnionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        unions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllUnions", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = unions[indexPath.row].name
        content.image = unions[indexPath.row].image

        cell.contentConfiguration = content

        return cell
    }


}
