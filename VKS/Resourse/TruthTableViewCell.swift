//
//  TruthTableViewCell.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 06.07.2022.
//

import UIKit

class TruthTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet var avatarShadowImage: UIView!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var authorsNameTruthPost: UILabel!
    @IBOutlet var dateAndTimePost: UILabel! 
    @IBOutlet var textPost: UILabel!
    @IBOutlet var imagePost: UIImageView!
    @IBOutlet var likeParentView: UIView!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)

        avatarImage.layer.cornerRadius = avatarImage.bounds.width / 2
        avatarShadowImage.layer.cornerRadius = avatarShadowImage.bounds.width / 2
        avatarShadowImage.layer.backgroundColor != UIColor.clear.cgColor
        avatarShadowImage.layer.shadowColor = UIColor.black.cgColor
        avatarShadowImage.layer.shadowOffset = CGSize.zero
        avatarShadowImage.layer.shadowRadius = 5
        avatarShadowImage.layer.shadowOpacity = 0.9
        avatarShadowImage.clipsToBounds = false
        
    }

    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControl.isLike.toggle()
        if likeControl.isLike {
            likeControl.likePicture.image = UIImage(systemName: "suit.heart.fill")
        } else {
            likeControl.likePicture.image = nil
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
