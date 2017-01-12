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
    
    let DIM_ALPHA:CGFloat = 0.2
    let OPAGUE:CGFloat = 1.0
    let MAXLIFE = 3
    var lifeloss = 0
    var monsterHappy: Bool = false
    var timer:NSTimer!
    
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
        restart()
    }
  
    func restart(){
        changeScreen(false)
        prepareNewGame()
        skull1.alpha = DIM_ALPHA
        skull2.alpha = DIM_ALPHA
        skull3.alpha = DIM_ALPHA
        lifeloss = 0
        monsterHappy = false
        if timer != nil{
            timer.invalidate()
        }
    }
    
    func startTimer(){
        if timer != nil{
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
  
    func characterHappy(){
        monsterHappy = true
        startTimer()
        biteSound.play()
        dimNeeds()
    }
    
    func changeGameState(){
        if !monsterHappy{
            lifeloss += 1
            skullSound.play()
            if lifeloss == 1{
                skull1.alpha = OPAGUE
            }
            else if lifeloss == 2{
                skull2.alpha = OPAGUE
            }
            else if lifeloss == 3{
                skull3.alpha = OPAGUE
            }
            if lifeloss >= MAXLIFE{
                characterImg.playDead()
                deathSound.play()
                if timer != nil{
                    timer.invalidate()
                }
                timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.restart), userInfo: nil, repeats: false)
            }
        }
        prepareNewGame()
    }
    
    func prepareNewGame(){
        let rand = arc4random_uniform(3)
        dimNeeds()
        if rand == 0{
            heart.alpha = OPAGUE
            heart.userInteractionEnabled = true
        }
        else if rand == 1{
            food.alpha = OPAGUE
            food.userInteractionEnabled = true
        }
        else{
            book.alpha = OPAGUE
            book.userInteractionEnabled = true
        }
        monsterHappy = false
    }

    func dimNeeds(){
        food.alpha = DIM_ALPHA
        food.userInteractionEnabled = false
        heart.alpha = DIM_ALPHA
        heart.userInteractionEnabled = false
        book.alpha = DIM_ALPHA
        book.userInteractionEnabled = false
    }
    
    @IBAction func onSnailTapped(btn: UIButton){
        characterImg.characterName = "blue"
        characterImg.playIdle()
        food.image = UIImage(named: "fruit")
        addTarget()
        changeScreen(true)
        startTimer()
    }
    
    @IBAction func onGolemTapped(btn: UIButton){
        characterImg.characterName = "golem"
        characterImg.playIdle()
        food.image = UIImage(named: "food")
        addTarget()
        changeScreen(true)
        startTimer()
    }
    
    func addTarget(){
        heart.target = characterImg
        food.target = characterImg
        book.target = characterImg
    }
    
    func changeScreen(gameStart: Bool){
        logo.hidden = gameStart
        snailChoice.hidden = gameStart
        golemChoice.hidden = gameStart
        prompt.hidden = gameStart
        
        ground.hidden = !gameStart
        characterImg.hidden = !gameStart
        skull1.hidden = !gameStart
        skull2.hidden = !gameStart
        skull3.hidden = !gameStart
        livepanel.hidden = !gameStart
        heart.hidden = !gameStart
        food.hidden = !gameStart
        book.hidden = !gameStart
    }
}

