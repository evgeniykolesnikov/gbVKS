//
//  ScUrlViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 01.09.2022.
//

import UIKit

class ScUrlViewController: UIViewController {

    //1 url
    let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88f")
//http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88f

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlCons = URLComponents()
        urlCons.scheme = "http"
        urlCons.host = "samples.openweathermap.org"
        urlCons.path = "/data/2.5/forecast"

        urlCons.queryItems = [
            URLQueryItem(name: "q", value: "Moscow,DE"),
            URLQueryItem(name: "appid", value: "b1b15e88f")
        ]

        //2 setting
        let config = URLSessionConfiguration.default


        //3 session
        let session = URLSession(configuration: .default)
        // Do any additional setup after loading the view.

        let task = session.dataTask(with: urlCons.url!) { data, res, err in
            if let err = err {
                print(err.localizedDescription)
            } else {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)

                print(json)
            }
        }
        task.resume()
    }
    

}
