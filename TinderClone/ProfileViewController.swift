//
//  ProfileViewController.swift
//  TinderClone
//
//  Created by Jacob Frick on 11/20/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toMainPage", sender: nil)
    }
    

    

}
