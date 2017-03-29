//
//  AnimationSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//
import Foundation
import UIKit
class AnimationSelection: AnimationSort {
    var delegate: UpdateCount!
    var arrayAction: [Step]!
    var colSolution = 0
    var currentStep = Step()
    var timeAnimation = 1
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(arrayLabel:[SortingLabel] , arrayLabelMiddle: [SortingLabel], arrayLabelAbove: [SortingLabel], arrayLabelBelow: [SortingLabel], arrayAction: [Step]){
        super.init()
        self.arrayAction = arrayAction
        self.arrayLabel = arrayLabel
        self.arrayLabelAbove = arrayLabelAbove
        self.arrayLabelBelow = arrayLabelBelow
        self.arrayLabelMiddle = arrayLabelMiddle
    }
    override func animation() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: TimeInterval(self.timeAnimation), animations: {
            if(self.currentStep.act=="compare"){
                self.arrayLabel[self.currentStep.j].backgroundColor = COMPARE_COLOR
                self.arrayLabel[self.currentStep.j].alpha = 1
            }else if(self.currentStep.act=="min"){
                self.arrayLabelBelow[self.currentStep.j].text = "MIN"
                self.arrayLabelBelow[self.currentStep.j].textAlignment = .center
                self.arrayLabelBelow[self.currentStep.j].backgroundColor = .clear
                self.arrayLabelBelow[self.currentStep.j].font = UIFont.boldSystemFont(ofSize: 20)
                self.arrayLabelBelow[self.currentStep.j].textColor = UIColor(red: 1, green: 20/255, blue: 147/255, alpha: 1)
                self.arrayLabelBelow[self.currentStep.j].alpha = 0
                self.arrayLabelBelow[self.currentStep.j].isHidden = false
                self.arrayLabel[self.currentStep.i].alpha = 1
                self.arrayLabel[self.currentStep.j].alpha = 1
            }else if(self.currentStep.act=="swap"){
                self.arrayLabel[self.currentStep.i].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.j].backgroundColor = SWAP_COLOR
                self.arrayLabel[self.currentStep.i].alpha = 0.99
                self.arrayLabelBelow[self.currentStep.j].alpha = 0.99
                self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.i])
                self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.j])
            }else{
                self.arrayLabel[self.currentStep.i].alpha = 1
                self.arrayLabel[self.currentStep.i].backgroundColor = SORT_END
            }
        }){_ in
            if(self.currentStep.act=="min"){
                self.arrayLabel[self.currentStep.j].alpha = 1
                self.arrayLabelBelow[self.currentStep.j].text = ""
                self.arrayLabelBelow[self.currentStep.j].isHidden = true
                self.checkTime()
                self.continueAnimation()
            }else
                if(self.currentStep.act=="compare"){
                    self.arrayLabel[self.currentStep.j].alpha = 0.99
                    self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                    self.checkTime()
                    self.continueAnimation()
                }else
                    if(self.currentStep.act=="swap"){
                        UIView.animate(withDuration: 0.5, animations: {
                            self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelAbove[self.currentStep.j])
                            self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelBelow[self.currentStep.i])
                            
                        }){_ in
                            UIView.animate(withDuration: 1, animations: {
                                self.moveLabel(from: self.arrayLabel[self.currentStep.i], to: self.arrayLabelMiddle[self.currentStep.j])
                                self.moveLabel(from: self.arrayLabel[self.currentStep.j], to: self.arrayLabelMiddle[self.currentStep.i])
                            }){_ in
                                self.arrayLabel[self.currentStep.i].backgroundColor = DEFAULT_COLOR
                                self.arrayLabel[self.currentStep.j].backgroundColor = DEFAULT_COLOR
                                self.swapLabel(i: self.currentStep.i, j: self.currentStep.j)
                                self.checkTime()
                                self.continueAnimation()
                            }
                        }
                    }else{
                        if(self.colSolution==self.arrayAction.count-1){
                            self.arrayLabel[self.currentStep.i+1].backgroundColor = UIColor.cyan
                            self.arrayLabel[self.currentStep.i+1].alpha = 1
                        }
                        self.checkTime()
                        self.continueAnimation()
            }
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
    func checkTime(){
        if(self.colSolution+1 != self.arrayAction.count){
            if(self.arrayAction[self.colSolution+1].act=="min"){
                self.timeAnimation = 3
            }else{
                self.timeAnimation = 1
            }
        }
    }
    override func loop(){
        currentStep = self.arrayAction[self.colSolution]
        animation()
    }
}
