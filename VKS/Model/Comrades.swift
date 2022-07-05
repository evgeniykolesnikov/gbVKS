//
//  Comrades.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 02.07.2022.
//

import UIKit

struct Comrade {

    let name: String
    let image: UIImage?

    let comrade: [NewComrade]
    }

struct NewComrade {

    let name: String
    let image: UIImage?
}

let newComrade = [
    NewComrade(name: "Владимир Ильич Ленин", image: UIImage(named: "sourseImageComradeVladimirIlyichLenin")),
    NewComrade(name: "Сергей Павлович Королев", image: UIImage(named: "sourseImageComradeSergeiPavlovichKorolev")),
    NewComrade(name: "Андрей Дмитриевич Сахаров", image: UIImage(named: "sourseImageComradeAndreyDmitrievichSakharov")),
    NewComrade(name: "Юрий Алексеевич Гагарин", image: UIImage(named: "sourseImageComradeYuriAlekseyevichGagarin")),
    NewComrade(name: "Сергей Анатольевич Курёхин", image: UIImage(named: "sourseImageComradeSergeiAnatolievichKuryokhin")),
    NewComrade(name: "Виктор Робертович Цой", image: UIImage(named: "sourseImageComradeViktorRobertovichTsoi")),
    NewComrade(name: "Георгий Константинович Жуков", image: UIImage(named: "sourseImageComradeGeorgyKonstantinovichZhukov")),
    NewComrade(name: "Маяковский Владимир Владимирович", image: UIImage(named: "sourseImageComradeMayakovskyVladimirVladimirovich")),
    NewComrade(name: "Пастернак Борис Леонидович", image: UIImage(named: "sourseImageComradePasternakBorisLeonidovich")),
    NewComrade(name: "Цветаева Марина Ивановна", image: UIImage(named: "sourseImageComradeTsvetaevaMarinaIvanovna")),
    NewComrade(name: "Ахматова Анна Андреевна", image: UIImage(named: "sourseImageComradeAkhmatovaAnnaAndreevna")),
    NewComrade(name: "Рождественский Роберт Иванович", image: UIImage(named: "sourseImageComradeRozhdestvenskyRobertIvanovich")),
    NewComrade(name: "Булгаков Михаил Афанасьевич", image: UIImage(named: "sourseImageComradeBulgakovMikhailAfanasyevich")),
]

