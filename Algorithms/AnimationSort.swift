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

struct Position {
    var col: Int!
}

class SortingLabel: UILabel {
    var identifier: Int!
    var position: Position!
}

class AnimationSort {
    
    var spacing: CGFloat!
    var rectSize: CGFloat!
    var widthRatio = 2
    
    var bubbleSort: BubbleSort!
    var color: UIColor!
    var inputArray: [Int]!
    var arrayDisplay: [Int]!
    var colors: [UIColor]!
    var actionArray: [Step]!
    var graph: Graph!
    var colSolution = 0
    var currentStep = Step()
    var arrayLabel = [SortingLabel]()
    
    
    
    init(viewController: UIViewController,inputArray: [Int]){
        self.bubbleSort = BubbleSort(inputArray: inputArray)
        self.inputArray = inputArray
        self.arrayDisplay = []
        self.actionArray = self.bubbleSort.acionArray
        self.colors = []
        
        self.spacing = viewController.view.bounds.size.width/CGFloat(self.widthRatio * self.inputArray.count + self.inputArray.count + 1)
        self.rectSize = CGFloat(self.widthRatio) * self.spacing
        
        for index in 0..<inputArray.count{
            self.arrayDisplay.append(inputArray[index])
            self.colors.append(DEFAULT_COLOR)
        }
        
        self.addBtnMove(toView: viewController.view)
        
        self.drawGraph(toView: viewController.view, arrayDisplay: arrayDisplay, colors: colors)
    }
    
    
    
    func addBtnMove(toView view: UIView)
    {
        var btnStart = UIButton(frame: CGRect(x: view.bounds.size.width/2-40, y: 30, width: 80, height: 50))
        btnStart.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnStart.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStart.setTitle("Start", for: .normal)
        btnStart.addTarget(self, action: #selector(move(sender:)), for: .touchUpInside)
        view.addSubview(btnStart)
    }
    
    @objc func move(sender: UIButton){
        loop()
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
            
            self.currentStep = self.actionArray[self.colSolution]
            
            if (self.colSolution == self.actionArray.count - 1){
                return
            }
            
            self.animation()
            
        }
    }
    
    func loop(){
        currentStep = self.actionArray[self.colSolution]
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
    
    
    func drawGraph(toView view: UIView, arrayDisplay: [Int], colors: [UIColor]){
        
        var x = self.spacing
        
        for index in 0..<arrayDisplay.count{
            
            let label = SortingLabel(frame: CGRect(x: x!, y: 300, width: rectSize, height: rectSize))
            
            label.backgroundColor = colors[index]
            label.text = String(arrayDisplay[index])
            label.textColor = UIColor.black
            label.textAlignment = NSTextAlignment.center
            
            arrayLabel.append(label)
                        
            view.addSubview(label)
            
            x = x! + self.spacing + self.rectSize
            
        }
    }
    
}
