//
//  ComradeTableViewCell.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 12.07.2022.
//

import UIKit

class ComradeTableViewCell: UITableViewCell {

    // MARK: - IBOutlet

    @IBOutlet var comradeImageView: UIImageView!
    @IBOutlet var comradeShadowView: UIView!
    @IBOutlet var comradeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        comradeImageView.layer.cornerRadius = comradeImageView.bounds.width / 2
        comradeShadowView.layer.cornerRadius = comradeShadowView.bounds.width / 2
        comradeShadowView.layer.backgroundColor != UIColor.clear.cgColor
        comradeShadowView.layer.shadowColor = UIColor.black.cgColor
        comradeShadowView.layer.shadowOffset = CGSize.zero
        comradeShadowView.layer.shadowRadius = 5
        comradeShadowView.layer.shadowOpacity = 0.9
        comradeShadowView.clipsToBounds = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
