//
//  AnimationSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

struct Step {
    var act: String!
    var i: Int!
    var j: Int!
}

class AnimationSort {
        
    var bubbleSort: BubbleSort!
    
    var color: UIColor!
    var colors: [UIColor]!

    var arrayAction: [Step]!
    var arrayLabel: [SortingLabel]!
    
    var colSolution = 0
    var currentStep = Step()
    
    
    init(arrayLabel: [SortingLabel], arrayAction: [Step]){
        
        self.arrayLabel = arrayLabel
        self.arrayAction = arrayAction
        
    }
    
    func animation(){
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            
            if (self.currentStep.act == "compare"){
                
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR
                
                self.arrayLabel[self.currentStep.i].center = CGPoint(x: self.arrayLabel[self.currentStep.i].center.x, y: self.arrayLabel[self.currentStep.i].center.y + 20)

                self.arrayLabel[self.currentStep.j].center = CGPoint(x: self.arrayLabel[self.currentStep.j].center.x, y: self.arrayLabel[self.currentStep.j].center.y + 20)
                
            }else if (self.currentStep.act == "swap"){
                
                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR
                
                self.arrayLabel[self.currentStep.i].center = CGPoint(x: self.arrayLabel[self.currentStep.i].center.x, y: self.arrayLabel[self.currentStep.i].center.y + 20)
                
                self.arrayLabel[self.currentStep.j].center = CGPoint(x: self.arrayLabel[self.currentStep.j].center.x, y: self.arrayLabel[self.currentStep.j].center.y + 20)
                
                self.swapAnimation(i: self.currentStep.i, j: self.currentStep.j)
                
                
            }
            
            
            
        }) { (finished) in
            
            self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
            self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
            
            self.arrayLabel[self.currentStep.i].center = CGPoint(x: self.arrayLabel[self.currentStep.i].center.x, y: self.arrayLabel[self.currentStep.i].center.y - 20)
            
            self.arrayLabel[self.currentStep.j].center = CGPoint(x: self.arrayLabel[self.currentStep.j].center.x, y: self.arrayLabel[self.currentStep.j].center.y - 20)
            
            self.colSolution += 1
            
            self.currentStep = self.arrayAction[self.colSolution]
            
            if (self.colSolution == self.arrayAction.count - 1){
                return
            }
            
            self.animation()
            
        }
    }
    
    func loop(){
        currentStep = self.arrayAction[self.colSolution]
        animation()
    }
    
    func swapAnimation(i: Int, j: Int){
        
        self.swapPosition(labelA: arrayLabel[i], labelB: arrayLabel[j])
        
        var temp = arrayLabel[i]
        arrayLabel[i] = arrayLabel[j]
        arrayLabel[j] = temp
    }
    
    func swapPosition(labelA: SortingLabel,labelB: SortingLabel){
        
        var temp = labelA.center
        labelA.center = labelB.center
        labelB.center = temp
    }
    
}
