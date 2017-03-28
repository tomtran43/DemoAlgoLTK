//
//  ManagerSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerSort {
    
    var animate: AnimationInsert!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [InsertStep]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    var graph: Graph!
    var barGraph: BarGraph!
    var sort: InsertionSort!
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
//        print(self.arrayAction)
                
        self.arrayDisplay = []
        self.arrayLabelAbove = []
        self.arrayLabelMiddle = []
        self.arrayLabelBelow = []
        
        self.arrayColor = []
        
        for index in 0..<arrayInput.count {
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(DEFAULT_COLOR)
        }
        
        graph = Graph(frame: CGRect(x: 0, y: viewcontroller.view.bounds.size.height/2,
                                    width: viewcontroller.view.bounds.size.width,
                                    height: viewcontroller.view.bounds.size.height),
                      arrayDisplay: self.arrayDisplay,
                      colors: self.arrayColor)
        
//        barGraph = BarGraph(viewcontroller: viewcontroller,
//            frame: CGRect(x: 0, y: viewcontroller.view.bounds.size.height/2,
//                                          width: viewcontroller.view.bounds.size.width,
//                                          height: viewcontroller.view.bounds.size.height),
//                            arrayDisplay: self.arrayDisplay,
//                            colors: self.arrayColor)
        
        viewcontroller.view.addSubview(graph)
        
//        viewcontroller.view.addSubview(barGraph)

        
        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelMiddle = self.graph.arrayLabelMiddle
        self.arrayLabelBelow = self.graph.arrayLabelBelow
        self.arrayLabelAbove = self.graph.arrayLabelAbove
        
        self.addBtnRun(toView: viewcontroller.view)
    }
    
    func getArrayAction(array: [Int]) -> [InsertStep] {
        
        sort = InsertionSort(arrayInput: array)
        return sort.arrayAction

    }
    
    func addBtnRun(toView view: UIView) {
        
        let btnStart = UIButton(frame: CGRect(x: view.bounds.size.width/2-40, y: 30, width: 80, height: 50))
        btnStart.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnStart.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStart.setTitle("Run", for: .normal)
        btnStart.addTarget(self, action: #selector(run(sender:)), for: .touchUpInside)
        view.addSubview(btnStart)
    }
    
    @objc func run(sender: UIButton) {
        print(self.arrayAction)
        
        animate = AnimationInsert(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
        
        animate.loop()
    }
}
