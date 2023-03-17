//
//  AnimationViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 17.03.2023.
//

import Foundation
import UIKit

class AnimationViewController: UIViewController {
    

    @IBOutlet var animatableButton: UIButton!
    @IBOutlet var animatableView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//                UIView.animate(withDuration: 3, delay: 1, options: [.repeat, .autoreverse, .curveEaseInOut]) { [self] in
//                    animatableView.frame.origin.x += 150
//                    animatableView.backgroundColor = .systemBlue
//                    animatableView.alpha = 0.2
//                } completion: { _ in }
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: []) {
            self.animatableView.transform = CGAffineTransform(translationX: 0, y: -150)
        }
        
        UIView.animate(withDuration: 1, delay: 3, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: []) {
            self.animatableView.transform = .identity
        }
        
//        let positionAnimation = CABasicAnimation(keyPath: "position.x")
//
//        positionAnimation.fromValue = animatableView.frame.size.width/2 + animatableView.frame.origin.x
//        positionAnimation.toValue = animatableView.frame.size.width/2 + animatableView.frame.origin.x + 150
//
//        positionAnimation.duration = 3
//        positionAnimation.beginTime = CACurrentMediaTime() + 1
//
//        positionAnimation.repeatCount = .infinity
//        positionAnimation.autoreverses = true
//        positionAnimation.fillMode = .both
//
//        positionAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//
//        animatableView.layer.add(positionAnimation, forKey: nil)
//
//
//        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
//
//        opacityAnimation.fromValue = 1
//        opacityAnimation.toValue = 0.2
//
//        opacityAnimation.duration = 3
//        opacityAnimation.beginTime = CACurrentMediaTime() + 1
//
//        opacityAnimation.repeatCount = .infinity
//        opacityAnimation.autoreverses = true
//        opacityAnimation.fillMode = .both
//
//        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//
//        animatableView.layer.add(opacityAnimation, forKey: nil)
    
        
        
      
        
    }
    
    @IBAction func buttonPressed() {
        UIView.transition(with: animatableButton, duration: 0.3, options: [.transitionCrossDissolve]) {
            let title = self.animatableButton.currentTitle == "START" ? "STOP" : "START"
            self.animatableButton.setTitle(title, for: [])
        } completion: { _ in
        
        }
    }
    
    
    
}

