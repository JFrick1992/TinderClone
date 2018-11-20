//
//  CardsViewController.swift
//  TinderClone
//
//  Created by Jacob Frick on 11/20/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var draggableImageView: UIImageView!
    var cardIniialCenter: CGPoint!
    var newCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardIniialCenter = draggableImageView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            newCenter = draggableImageView.center
            draggableImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45*Double.pi/180))
        } else if sender.state == .changed {
            draggableImageView.center = CGPoint(x: newCenter.x + translation.x, y: newCenter.y)
            //draggableImageView.transform = draggableImageView.transform.rotated(by: CGFloat(45*Double.pi/180))
        } else if sender.state == .ended {
            draggableImageView.center = cardIniialCenter
            draggableImageView.transform = CGAffineTransform.identity
        }
    }
    

}
