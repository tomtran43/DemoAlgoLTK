//
//  AnimationHeap.swift
//  Algorithms
//
//  Created by Loc Tran on 4/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class AnimationHeap: NSObject {
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelBehind: [SortingLabel]!
    var arrayLabelOne: [SortingLabel]!
    var arrayLabelTwo: [SortingLabel]!
    var arrayLabelThree: [SortingLabel]!
    
    var arrayAction: [HeapStep]!
    var colSolution = 0
    var currentStep: HeapStep!
    var graphHeap: HeapGraph!
    
    
    init(arrayLabel:[SortingLabel], arrayLabelBehind: [SortingLabel], arrayLabelOne: [SortingLabel], arrayLabelTwo: [SortingLabel], arrayLabelThree: [SortingLabel], arrayAction: [HeapStep], graphHeap: HeapGraph){
        
        self.arrayLabel = arrayLabel
        self.arrayLabelBehind = arrayLabelBehind
        self.arrayLabelOne = arrayLabelOne
        self.arrayLabelTwo = arrayLabelTwo
        self.arrayLabelThree = arrayLabelThree
        
        self.arrayAction = arrayAction
        self.graphHeap = graphHeap
        
        print(arrayAction)
        
    }
    
    func animation() {
        UIView.animate(withDuration: 1, animations: {
            
        })
    }
    
    func loop(){
        
    }
    
}
