//
//  ScUrlSecondViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 01.09.2022.
//

import UIKit
import Alamofire

class ScUrlSecondViewController: UIViewController {

    let key = "e843f5f8184a42b891eb2597bfe656c6"

    let baseUrl = "https://newsapi.org"
    let path = "/v2/everything"
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let param: Parameters = [
            "q":"bitcoin",
            "apiKey": key
        ]

        let url = baseUrl + path

        // TODO: RresponseJSON deprecated and will be removed in Alamofire 6. Use responseDecodable instead.

        AF.request(url, method: .get, parameters: param).responseJSON { res in
            print(res)
        }


        // Do any additional setup after loading the view.
    }
    

}
