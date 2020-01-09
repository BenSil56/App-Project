//
//  MyDayViewController.swift
//  SSSAS
//
//  Created by Chase Albritton on 8/10/19.
//  Copyright © 2019 Chase Albritton. All rights reserved.
//

import UIKit

class MyDayViewController: UIViewController {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  ************ This is for the UIImage Profile Image for circular shape (Could not get to work yet) ***********
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
        profilePic.clipsToBounds = true

        profilePic.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.borderWidth = 2
        //
        //        ************************************************
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        print("Sign out button tapped")
    }
   
}
