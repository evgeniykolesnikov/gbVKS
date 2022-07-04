//
//  ComradeImagesCollectionViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 03.07.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class ComradeImagesCollectionViewController: UICollectionViewController {

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

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComradeImage",
                                                            for: indexPath) as? ComradeImageCollectionViewCell else {
            preconditionFailure("Error")
        }
    

//        cell.imageComrade.image = comrades[indexPath.row].image
        cell.imageComrade.image = comrades[indexPath.row].image
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
