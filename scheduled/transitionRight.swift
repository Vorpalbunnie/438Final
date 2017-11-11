//
//  transitionRight.swift
//  scheduled
//
//  Created by labuser on 11/10/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation

import UIKit

class transitionFromRight: UIStoryboardSegue {
    
    override func perform() {
        
        let src = self.source
        let dst = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.3
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        src.view.window?.layer.add(transition, forKey: nil)
        src.present(dst, animated: false, completion: nil)
        
    }
    
    
}
