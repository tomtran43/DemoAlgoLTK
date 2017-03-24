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
    
    var animate: AnimationSort!
    var viewcontroller: UIViewController!
    
    var arrayInput: [Int]!
    var arrayAction: [Step]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    var arrayLabel: [SortingLabel]!
    
    var graph: Graph!
    var sort: BubbleSort!
    
    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]){
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
        self.arrayDisplay = []
        self.arrayColor = []
        
        for index in 0..<arrayInput.count{
            self.arrayDisplay.append(arrayInput[index])
            self.arrayColor.append(DEFAULT_COLOR)
        }
        
        graph = Graph(frame: CGRect(x: 0, y: viewcontroller.view.bounds.size.height/2,
                                    width: viewcontroller.view.bounds.size.width,
                                    height: viewcontroller.view.bounds.size.height),
                      arrayDisplay: self.arrayDisplay,
                      colors: self.arrayColor)
        
        viewcontroller.view.addSubview(graph)
        
        self.arrayLabel = self.graph.arrayLabel
        
        self.addBtnRun(toView: viewcontroller.view)
        
        print(arrayDisplay)
    }
    
    func getArrayAction(array: [Int]) -> [Step]{
        
        sort = BubbleSort(arrayInput: array)

        return sort.arrayAction

    }
    
    func getArrayLabel(aryDisplay: [Int], aryColor: [UIColor]) -> [SortingLabel]{
        
        graph = Graph(frame: CGRect(x: 0, y: self.viewcontroller.view.bounds.size.height/2,
                                    width: self.viewcontroller.view.bounds.size.width,
                                    height: self.viewcontroller.view.bounds.size.height),
                      arrayDisplay: aryDisplay,
                      colors: aryColor)
        
        self.viewcontroller.view.addSubview(graph)
        
        return graph.arrayLabel
        
    }
    
    func addBtnRun(toView view: UIView){
        
        let btnStart = UIButton(frame: CGRect(x: view.bounds.size.width/2-40, y: 30, width: 80, height: 50))
        btnStart.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnStart.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStart.setTitle("Run", for: .normal)
        btnStart.addTarget(self, action: #selector(run(sender:)), for: .touchUpInside)
        view.addSubview(btnStart)
    }
    
    @objc func run(sender: UIButton){
        
        animate = AnimationSort(arrayLabel: self.arrayLabel, arrayAction: self.arrayAction)
        
        print("run")
        animate.loop()
    }
}
