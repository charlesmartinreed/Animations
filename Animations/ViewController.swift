//
//  ViewController.swift
//  Animations
//
//  Created by Charles Martin Reed on 9/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    var imageCount = 1

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "frame\(imageCount).gif")
    }

    @IBAction func nextFrame(_ sender: Any) {
        //loop through all the images
        
        imageCount += 1
            
        imageView.image = UIImage(named: "frame\(imageCount).gif")
        
        if imageCount == 10 {
            imageCount = 1
            
            imageView.image = UIImage(named: "frame\(imageCount).gif")
        }
        
        
    }
    
}

