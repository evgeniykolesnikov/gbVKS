//
//  Formators.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 11.07.2022.
//

import Foundation

class Formators {
    static let dateFormator: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH:mm"
        df.timeZone = TimeZone.current
        return df
    }()
}
