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
    var isOffScreen: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardIniialCenter = draggableImageView.center
        isOffScreen = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            newCenter = draggableImageView.center
            if(sender.velocity(in: view).x > 0) {
                draggableImageView.transform = CGAffineTransform(rotationAngle: CGFloat(30*Double.pi/180))
            } else {
                draggableImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-30*Double.pi/180))
            }
            
        } else if sender.state == .changed {
            if translation.x > 100 { //to the right
                UIView.animate(withDuration: 0.4) {
                    self.draggableImageView.center.x = 250
                    self.cardIniialCenter.x = 550
                }
            } else if translation.x < -100 { //to the left
                UIView.animate(withDuration: 0.4) {
                    self.draggableImageView.center.x = -250
                    self.cardIniialCenter.x = -550
                }
            } else {
                draggableImageView.center = CGPoint(x: newCenter.x + translation.x, y: newCenter.y)

            }
        } else if sender.state == .ended {
            draggableImageView.center = cardIniialCenter
            draggableImageView.transform = CGAffineTransform.identity
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile" {
            let temp = segue.destination as! ProfileViewController
            temp.image = draggableImageView.image
        }
    }

}
