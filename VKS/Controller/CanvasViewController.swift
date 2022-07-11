//
//  CanvasViewController.swift
//  VKS
//
//  Created by Evgeniy Kolesnikov on 05.07.2022.
//

import UIKit

class CanvasViewController: UIViewController {

    // MARK: - IBAction

    @IBOutlet var drawingController: DrawinghControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        drawingController.addTarget(self, action: #selector(drawControlChange), for: .valueChanged)

    }

    @objc private func drawControlChange() {
        drawingController.setNeedsDisplay()
    }
    override func viewWillAppear(_ animated: Bool) {
        drawingController.setNeedsLayout()

        drawingController.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))

        drawingController.transform = .identity
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
