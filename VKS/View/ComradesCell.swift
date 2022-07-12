//
//  ComradesCell.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 02.07.2022.
//

import UIKit

class ComradesCell: UITableViewCell {

    // MARK: - IBOutlet

    @IBOutlet var shadowAvatarComrade: UIView!
    @IBOutlet var avatarComrade: UIImageView!
    @IBOutlet var nameComradeLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

        avatarComrade.layer.cornerRadius = avatarComrade.bounds.width / 2
        shadowAvatarComrade.layer.cornerRadius = shadowAvatarComrade.bounds.width / 2
        shadowAvatarComrade.layer.backgroundColor = UIColor.clear.cgColor
        shadowAvatarComrade.layer.shadowColor = UIColor.black.cgColor
        shadowAvatarComrade.layer.shadowOffset = CGSize.zero
        shadowAvatarComrade.layer.shadowRadius = 5
        shadowAvatarComrade.layer.shadowOpacity = 0.9
        shadowAvatarComrade.clipsToBounds = false


    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
