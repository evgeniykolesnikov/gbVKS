//
//  LoadingViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 17.03.2023.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet var avatarAnimationTap: UIImageView!
    @IBOutlet var loadingView: UIView!
    @IBOutlet var showLoadingView: UIButton!
    @IBOutlet var loadingCircleThird: UIImageView!
    @IBOutlet var loadingCircleSecond: UIImageView!
    @IBOutlet var loadingCircleFirst: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingCircleFirst.layer.opacity = 0
        loadingCircleSecond.layer.opacity = 0
        loadingCircleThird.layer.opacity = 0
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        avatarAnimationTap.isUserInteractionEnabled = true
        avatarAnimationTap.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    @IBAction func buttonPressed() {
        
        UIView.animate(withDuration: 0.9, delay: 1, options: [.repeat, .autoreverse]) {
            self.loadingCircleFirst.alpha = 0.8        }
        
        UIView.animate(withDuration: 0.9, delay: 1.2, options: [.repeat, .autoreverse]) {
            self.loadingCircleSecond.alpha = 0.8        }
        
        UIView.animate(withDuration: 0.9, delay: 1.3, options: [.repeat, .autoreverse]) {
            self.loadingCircleThird.alpha = 0.8        }
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        print("\(hours):\(minutes):\(seconds)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            let today = Date()
            let hours   = (Calendar.current.component(.hour, from: today))
            let minutes = (Calendar.current.component(.minute, from: today))
            let seconds = (Calendar.current.component(.second, from: today))
            print("\(hours):\(minutes):\(seconds)")
        }
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.avatarAnimationTap.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: []) {
            self.avatarAnimationTap.transform = .identity
        }
    }
    
}








