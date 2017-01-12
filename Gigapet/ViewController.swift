//
//  ViewController.swift
//  Gigapet
//
//  Created by Ak Kieu on 1/11/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var snailChoice: UIButton!
    @IBOutlet weak var golemChoice: UIButton!
    @IBOutlet weak var prompt: UILabel!
    
    @IBOutlet weak var ground: UIImageView!
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet weak var livepanel: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var food: UIImageView!
    @IBOutlet weak var book: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func onSnailTapped(btn: UIButton){
        characterImg.image = UIImage(named: "blue_idle1")
        changeScreen()
    }
    
    @IBAction func onGolemTapped(btn: UIButton){
        characterImg.image = UIImage(named: "idle1")
        changeScreen()
    }
    
    func changeScreen(){
        logo.hidden = true
        snailChoice.hidden = true
        golemChoice.hidden = true
        prompt.hidden = true
        
        ground.hidden = false
        characterImg.hidden = false
        skull1.hidden = false
        skull2.hidden = false
        skull3.hidden = false
        livepanel.hidden = false
        heart.hidden = false
        food.hidden = false
        book.hidden = false
    }
}

