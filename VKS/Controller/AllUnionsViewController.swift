//
//  AllUnionsViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 03.07.2022.
//

import UIKit

class AllUnionsViewController: UIViewController {

    let unions = [
        Unions(name: "Союз Писателей", image: UIImage(systemName: "pencil.circle")),
        Unions(name: "Профсоюз Курьер", image: UIImage(systemName: "bicycle")),
        Unions(name: "Профсоюз работников высшей школы и научных учреждений", image: UIImage(systemName: "brain")),
        Unions(name: "Профсоюз актеров театра и кино", image: UIImage(systemName: "paintpalette")),
        Unions(name: "Союз шоферов", image: UIImage(systemName: "car.fill")),
        Unions(name: "Союз слесарей", image: UIImage(systemName: "gear")),
        Unions(name: "Профсоюза работников медико-санитарного труда", image: UIImage(systemName: "heart")),
        Unions(name: "Профсоюза работников народного образования и науки", image: UIImage(systemName: "brain.head.profile")),

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
