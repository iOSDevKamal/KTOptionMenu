//
//  ViewController.swift
//  KTOptionMenu
//
//  Created by iOSDevKamal on 11/06/2021.
//  Copyright (c) 2021 iOSDevKamal. All rights reserved.
//

import UIKit
import KTOptionMenu

class ViewController: UIViewController {
    
    @IBOutlet weak var clickMeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        clickMeBtn.layer.cornerRadius = clickMeBtn.frame.height/2
    }
    
    @IBAction func clickMeAction(_ sender: UIButton) {
                
        KTOptionMenu(sender: sender, options: ["Edit", "View", "Rename", "Delete", "Favorite", "Unfavorite"]) { index in
            //Do actions on click
            if index == 0 {
                //Edit
            }
            else if index == 1 {
                //View
            }
            else if index == 2 {
                //Rename
            }
            else if index == 3 {
                //Delete
            }
            else if index == 4 {
                //Favorite
            }
            else {
                //Unfavorite
            }
            
        }
    }
}
