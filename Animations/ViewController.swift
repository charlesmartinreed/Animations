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
    
    var animationIsRunning = false
    
    var timer = Timer()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "frame\(imageCount).gif")
    }

    @IBAction func nextFrame(_ sender: Any) {
        
        //loop through all the images
        animationIsRunning = !animationIsRunning
        
        if animationIsRunning {
            //change the button title
            button.setTitle("STOP", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(advanceFrame), userInfo: nil, repeats: true)
            
            
        }
        
        if !animationIsRunning {
            button.setTitle("START", for: .normal)
            timer.invalidate()
            

        }
        
        
    }
    
    @objc func advanceFrame() {
        for _ in 1...10 {
            imageView.image = UIImage(named: "frame\(imageCount).gif")
            imageCount += 1
            print(imageCount)
            
            if imageCount == 10 {
                imageCount = 1
                print(imageCount)
            }
        }
    }
    
    //MARK:- Other iOS Animations
    
    @IBAction func fadeIn(_ sender: Any) {
        imageView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 1
        }
    }
    
    @IBAction func slideIn(_ sender: Any) {
        //begin by moving the image offscreen, to the left by 500
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        
        //now move it back
        UIView.animate(withDuration: 1) {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        }
    }
    
    @IBAction func Grow(_ sender: Any) {
        //grow from the top-left of screen
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        
    }
    
    
}

