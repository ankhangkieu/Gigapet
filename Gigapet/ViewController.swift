//
//  ViewController.swift
//  Gigapet
//
//  Created by Ak Kieu on 1/11/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var snailChoice: UIButton!
    @IBOutlet weak var golemChoice: UIButton!
    @IBOutlet weak var prompt: UILabel!
    
    @IBOutlet weak var ground: UIImageView!
    @IBOutlet weak var characterImg: MonsterImg!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet weak var livepanel: UIImageView!
    @IBOutlet weak var heart: DragImg!
    @IBOutlet weak var food: DragImg!
    @IBOutlet weak var book: DragImg!
    
    var soundEff:AVAudioPlayer!
    var biteSound:AVAudioPlayer!
    var deathSound:AVAudioPlayer!
    var skullSound:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do{
            try soundEff = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try biteSound = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try deathSound = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try skullSound = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            soundEff.prepareToPlay()
            biteSound.prepareToPlay()
            deathSound.prepareToPlay()
            skullSound.prepareToPlay()
            
            soundEff.play()
        } catch let err as NSError{
            print(err.description)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.characterHappy), name: "onTargetDropped", object: nil)
    }
    
    func characterHappy(){
        
    }

    @IBAction func onSnailTapped(btn: UIButton){
        characterImg.characterName = "blue"
        characterImg.playIdle()
        food.image = UIImage(named: "fruit")
        addTarget()
        changeScreen()
    }
    
    @IBAction func onGolemTapped(btn: UIButton){
        characterImg.characterName = "golem"
        characterImg.playIdle()
        food.image = UIImage(named: "food")
        addTarget()
        changeScreen()
    }
    
    func addTarget(){
        heart.target = characterImg
        food.target = characterImg
        book.target = characterImg
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

