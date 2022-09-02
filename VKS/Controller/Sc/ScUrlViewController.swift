//
//  ScUrlViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 01.09.2022.
//

import UIKit

class ScUrlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlCons = URLComponents()
        urlCons.scheme = "https"
        urlCons.host = "jsonplaceholder.typicode.com"
        urlCons.path = "/post"

        urlCons.queryItems = [
            URLQueryItem(name: "title", value: "Moscow,DE"),
            URLQueryItem(name: "userId", value: "1")
        ]

        //2 setting
        let config = URLSessionConfiguration.default

        var request = URLRequest(url: urlCons.url!)
        request.httpMethod = "POST"

        //3 session
        let session = URLSession(configuration: .default)
        // Do any additional setup after loading the view.

        let task = session.dataTask(with: request) { data, res, err in
            if let err = err {
                print(err.localizedDescription)
            } else {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)

                //print(json)
            }
        }
        task.resume()
    }
    

}
