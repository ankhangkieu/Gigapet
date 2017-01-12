//
//  DragImg.swift
//  Gigapet
//
//  Created by Ak Kieu on 1/12/17.
//  Copyright © 2017 Ak Kieu. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView{
    var originalPos:CGPoint!
    var target:UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPos = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{
            let newPos = touch.locationInView(self.superview)
            self.center = CGPointMake(newPos.x, newPos.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first, let targetP = target{
            let pos = touch.locationInView(self.superview)
            if CGRectContainsPoint(targetP.frame, pos){
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        self.center = originalPos
    }
}