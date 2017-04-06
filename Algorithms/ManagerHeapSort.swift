//
//  ManagerHeapSort.swift
//  Algorithms
//
//  Created by Loc Tran on 4/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerHeapSort {
    
    var animate: AnimationHeap!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [HeapStep]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelBehind: [SortingLabel]!
    var arrayLabelOne: [SortingLabel]!
    var arrayLabelTwo: [SortingLabel]!
    var arrayLabelThree: [SortingLabel]!
    
    var graph: HeapGraph!
    var sort: HeapSort!
    
    var ptu:Int!
    
    var btnStart: UIButton!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayLabelOne = []
        self.arrayLabelTwo = []
        self.arrayLabelThree = []
        self.arrayLabelBehind = []
        
        self.arrayColor = []
        if arrayInput.count%2 != 0  {
            ptu = arrayInput.count + 1
            
        }
        
        for index in 0..<self.arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(SWAP_COLOR)
        }
        
        graph = HeapGraph(frame: CGRect(x: 0, y: 100,
                                         width: viewcontroller.view.bounds.size.width,
                                         height: viewcontroller.view.bounds.size.height),
                           arrayDisplay: self.arrayDisplay,
                           colors: self.arrayColor)
        
        
        
        viewcontroller.view.addSubview(graph)
        
        
        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelOne = self.graph.arrayLabelOne
        self.arrayLabelTwo = self.graph.arrayLabelTwo
        self.arrayLabelThree = self.graph.arrayLabelThree
        self.arrayLabelBehind = self.graph.arrayLabelBehind
        
    }
    
    func getArrayAction(array: [Int]) -> [HeapStep] {
        
        sort = HeapSort(arrayInput: array)
        return sort.actionArray
        
    }
    
    @objc func run(sender: UIButton) {
        
        animate = AnimationHeap(arrayLabel: self.arrayLabel,  arrayLabelBehind: self.arrayLabelBehind, arrayLabelOne: self.arrayLabelOne, arrayLabelTwo: self.arrayLabelTwo, arrayLabelThree: self.arrayLabelThree, arrayAction: self.arrayAction, graphHeap: graph)
        animate.loop()
        
    }

    
}
