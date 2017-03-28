//
//  AnimationSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit


class AnimationSort {
    
    var color: UIColor!
    var colors: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    func animation(){
        
    }
    
    func continueAnimation(){
        
    }
    
    func loop(){
        
    }
    
    func swapLabel(i: Int, j: Int) {
        let temp = arrayLabel[i]
        arrayLabel[i] = arrayLabel[j]
        arrayLabel[j] = temp
    }
    
    func moveLabel(from: SortingLabel, to: SortingLabel) {
        from.center = to.center
    }
}
