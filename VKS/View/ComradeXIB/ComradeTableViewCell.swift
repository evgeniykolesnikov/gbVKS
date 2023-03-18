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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        comradeImageView.addGestureRecognizer(tap)
        comradeImageView.isUserInteractionEnabled = true
        
        comradeImageView.layer.cornerRadius = comradeImageView.bounds.width / 2
        comradeShadowView.layer.cornerRadius = comradeShadowView.bounds.width / 2
        comradeShadowView.layer.backgroundColor != UIColor.clear.cgColor
        comradeShadowView.layer.shadowColor = UIColor.black.cgColor
        comradeShadowView.layer.shadowOffset = CGSize.zero
        comradeShadowView.layer.shadowRadius = 5
        comradeShadowView.layer.shadowOpacity = 0.9
        comradeShadowView.clipsToBounds = false
        
       
    }
    @objc func handleTap(_: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.comradeImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.comradeImageView.transform = .identity
        }
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.comradeShadowView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.comradeShadowView.transform = .identity
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
