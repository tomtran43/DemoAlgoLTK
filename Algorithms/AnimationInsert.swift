//
//  AnimationInsert.swift
//  Algorithms
//
//  Created by Loc Tran on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class AnimationInsert: AnimationSort{
    
    var arrayAction: [InsertStep]!
    var colSolution = 0
    var currentStep = InsertStep()
    var isMOVE = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(arrayLabel:[SortingLabel] , arrayLabelMiddle: [SortingLabel], arrayLabelAbove: [SortingLabel], arrayLabelBelow: [SortingLabel], arrayAction: [InsertStep]){
        super.init()
        
        self.arrayAction = arrayAction
        self.arrayLabel = arrayLabel
        self.arrayLabelAbove = arrayLabelAbove
        self.arrayLabelBelow = arrayLabelBelow
        self.arrayLabelMiddle = arrayLabelMiddle
        
    }
    
    override func animation(){
        
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 1, animations: {
            if (self.currentStep.act == "start"){
                self.isMOVE = false
                self.arrayLabel[self.currentStep.i].backgroundColor = KEY_COLOR
                self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                
            }
            if (self.currentStep.act == "move"){
                self.isMOVE = true
                self.arrayLabel[self.currentStep.i].backgroundColor = COMPARE_COLOR
                self.moveLabel(from: self.arrayLabel[self.currentStep.i], to:self.arrayLabelMiddle[self.currentStep.j] )
                self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelAbove[self.currentStep.i])
                self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)
                
                
            }
            if (self.currentStep.act == "end"){
                if(self.isMOVE){
                    self.arrayLabel[self.currentStep.key].backgroundColor = SWAP_COLOR
                    
                }else{
                    
                    self.arrayLabel[self.currentStep.key].backgroundColor = COMPARE_COLOR
                }
                self.moveLabel(from: self.arrayLabel[self.currentStep.key], to: self.arrayLabelMiddle[self.currentStep.key])
            }
            
        }){_ in
            if (self.currentStep.act == "move"){
                self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
            }
            if (self.currentStep.act == "end"){
                self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                self.arrayLabel[self.currentStep.key].backgroundColor = DEFAULT_COLOR
                
                
            }
            self.continueAnimation()
        }
    }
    
    override func continueAnimation(){
        self.colSolution += 1
        
        if (self.colSolution == self.arrayAction.count) {
            return
        }
        self.currentStep = self.arrayAction[self.colSolution]
        self.animation()
    }
    
    override func loop(){
        currentStep = self.arrayAction[self.colSolution]
        animation()
    }
}
