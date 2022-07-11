//
//  LikeControl.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 07.07.2022.
//

import UIKit

class LikeControl: UIControl {
    @IBOutlet var likePicture: UIImageView!

    var isLike:Bool = false

    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
