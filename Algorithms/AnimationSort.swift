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
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    var colSolution = 0
    var currentStep = Step()
    
    init(arrayLabel: [SortingLabel], arrayLabelMiddle: [SortingLabel], arrayLabelAbove: [SortingLabel], arrayLabelBelow: [SortingLabel], arrayAction: [Step]){
        
        self.arrayLabel = arrayLabel
        self.arrayLabelMiddle = arrayLabelMiddle
        self.arrayLabelAbove = arrayLabelAbove
        self.arrayLabelBelow = arrayLabelBelow
        self.arrayAction = arrayAction
    }
    
    func animation() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            if (self.currentStep.act == "compare") {
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR

                self.arrayLabel[self.currentStep.i].alpha = ANIMATION_ALPHA
                self.arrayLabel[self.currentStep.j].alpha = ANIMATION_ALPHA
            }
            else
            {
                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR
                
                self.arrayLabel[self.currentStep.i].alpha = ANIMATION_ALPHA
                self.arrayLabel[self.currentStep.j].alpha = ANIMATION_ALPHA
            }
        }){(finished) in
            if (self.currentStep.act == "compare") {
                UIView.animate(withDuration: 0.5, animations: {
                    self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                    self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                }) {_ in
                    
                    self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                    self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                    
                    self.executeAnimation()
                }
            }
            else
            {
                UIView.animate(withDuration: 0.5, animations: {
                    self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                    self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.j])
                }){_ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.j])
                        self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.i])
                    }){_ in
                        UIView.animate(withDuration: 0.5, animations: {
                            self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelMiddle[self.currentStep.j])
                            self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelMiddle[self.currentStep.i])
                        }){_ in
                            self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                            self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                            
                            self.arrayLabel[self.currentStep.i].alpha = DEFAULT_ALPHA
                            self.arrayLabel[self.currentStep.j].alpha = DEFAULT_ALPHA
                            
                            self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)
                            
                            self.executeAnimation()
                        }
                    }
                }
            }
        }
    }
    
    func  executeAnimation() {
        self.colSolution += 1
        
        if (self.colSolution == self.arrayAction.count) {
            return
        }
        self.currentStep = self.arrayAction[self.colSolution]
        self.animation()
    }
    
    func loop() {
        currentStep = self.arrayAction[self.colSolution]
        animation()
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
