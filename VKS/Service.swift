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

    func getPhotos(token: String){
        let url = baseUrl + "/photos.get"
        let parametrs: Parameters = [
            "access_token": token,
            "v": "5.131",
            "album_id": "profile"
        ]

        AF.request(url, method: .get, parameters: parametrs).responseJSON { responce in
            print("photos")
            print(responce)
        }
    }

    func getGroups(token: String){
        let url = baseUrl + "/groups.get"
        let parametrs: Parameters = [
            "access_token": token,
            "v": "5.131",
            "user_id": 320417629,
            "fields": "fixed_post,links"
        ]

        AF.request(url, method: .get, parameters: parametrs).responseJSON { responce in
            print("groups")
            print(responce)
        }
    }

    func groupsSearch(token: String){
        let url = baseUrl + "/groups.get"
        let parametrs: Parameters = [
            "access_token": token,
            "v": "5.131",
            "q": "Ледоход",
            "type": "group",
            "sort": 6
        ]

        AF.request(url, method: .get, parameters: parametrs).responseJSON { responce in
            print("Search groups")
            print(responce)
        }
    }
}
