//
//  MonsterImg.swift
//  Gigapet
//
//  Created by Ak Kieu on 1/12/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    var characterName: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playIdle(){
        self.image = UIImage(named: "\(characterName)_idle1")
        var imgArray = [UIImage]()
        for(var i = 1; i <= 4; i += 1){
            imgArray.append(UIImage(named: "\(characterName)_idle\(i)")!)
        }
        self.animationImages = nil
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDead(){
        self.image = UIImage(named: "\(characterName)_dead1")
        var imgArray = [UIImage]()
        for(var i = 1; i<=5; i+=1){
            imgArray.append(UIImage(named: "\(characterName)_dead\(i)")!)
        }
        self.animationImages = nil
        self.animationImages = imgArray
        self.animationRepeatCount = 1
        self.animationDuration = 0.8
        self.startAnimating()
    }
    
}