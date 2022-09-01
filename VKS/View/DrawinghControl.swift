//
//  DrawinghControl.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 05.07.2022.
//

import UIKit

@IBDesignable

class DrawinghControl: UIControl {

    @IBInspectable var isToggle: Bool = true

    @IBOutlet var switchView: UISwitch! {
        didSet {
            switchView.isOn = isToggle
        }
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        super.draw(rect)

        let colorTwo: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        guard let context = UIGraphicsGetCurrentContext() else {return}

        context.setFillColor(colorTwo.cgColor)

        context.saveGState()

        if isToggle {
            let rectengialGreen = CGRect(x: rect.width / 2, y: rect.height / 2, width: rect.width/4, height: rect.height/4)

            context.fill(rectengialGreen)

        }


        context.move(to: CGPoint(x: rect.width / 2, y: 0))
        context.addLine(to: CGPoint(x: rect.width / 2, y: rect.width / 2))
        context.addLine(to: CGPoint(x: 0, y: rect.width / 2))
        context.closePath()

        context.setFillColor(UIColor.yellow.cgColor)
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.strokePath()

        context.restoreGState()

        let triangel = UIBezierPath()

        triangel.move(to: CGPoint(x: 0, y: rect.width / 2))
        triangel.addLine(to: CGPoint(x: 0, y: rect.height))
        triangel.addLine(to: CGPoint(x: rect.width / 2, y: rect.width))

        triangel.close()

        context.addPath(triangel.cgPath)
        context.fillPath() 

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.9
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }

    private func setupGesture() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipe.direction = .right
        addGestureRecognizer(swipe)
    }
    @objc private func swiped(_ swipeGesture: UISwipeGestureRecognizer) {

        isToggle.toggle()
        switchView.isOn = isToggle
        print(isToggle)
        print("Swipe")

        sendActions(for: .valueChanged)
    }
}
