//
//  MainViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 19.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    @IBAction func dismissButtonPressed(_ sender: UIButton) {

        //self.dismiss(animated: true)

        navigationController?.popViewController(animated: true)
    }
}
