//
//  Service.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 07.09.2022.
//

import Foundation
import Alamofire

class Service{

    let baseUrl = "https://api.vk.com/method"
    //https://api.vk.com/method
    //friends.get

    func getFriends(token: String){
        let url = baseUrl + "/friends.get"
        let parametrs: Parameters = [
            "access_token": token,
            "v": "5.131",
            "count": 50,
            "fields": "city,country"

        ]

        AF.request(url, method: .get, parameters: parametrs).responseJSON { responce in
            print(responce)
        }
    }

}
