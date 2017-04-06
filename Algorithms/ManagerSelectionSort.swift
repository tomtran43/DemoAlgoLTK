//
//  ManagerSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class ManagerSelectionSort: UpdateCount {
    
    var animate: AnimationSelection!
    var viewcontroller: UIViewController!
    
    internal func updateSwapCount(swapCount: Int) {         //
        lblswapCountText.text = "Swap: \(swapCount)"
    }
    
    internal func updateCompareCount(compareCount: Int) {           //
        lblcompareCount.text = "Compare: \(compareCount)"
        
    }

    
    var arrayInput: [Int]!
    var arrayAction: [Step]!
    var arrayDisplay: [Int]!
    var arrayColor: [UIColor]!
    
    var arrayLabel: [SortingLabel]!
    var arrayLabelAbove: [SortingLabel]!
    var arrayLabelMiddle: [SortingLabel]!
    var arrayLabelBelow: [SortingLabel]!
    
    var graph: Graph!
    var sort: SelectionSort!
    var lblcompareCount: UILabel!               //
    var lblswapCountText: UILabel!              //

    
    func initSortWith(viewcontroller: UIViewController, arrayInput: [Int]) {
        
        self.viewcontroller = viewcontroller
        
        self.arrayInput = arrayInput
        self.arrayAction = getArrayAction(array: arrayInput)
        
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
        
        viewcontroller.view.addSubview(graph)
        
        
        self.arrayLabel = self.graph.arrayLabel
        self.arrayLabelMiddle = self.graph.arrayLabelMiddle
        self.arrayLabelBelow = self.graph.arrayLabelBelow
        self.arrayLabelAbove = self.graph.arrayLabelAbove
        
        self.addCompareCount(toView: viewcontroller.view)               //
        self.addSwapCount(toview: viewcontroller.view)                  //

    }
    
    func getArrayAction(array: [Int]) -> [Step] {
        
        sort = SelectionSort(arrayInput: array)
        return sort.arrayAction
        
    }
    
    @objc func run(sender: UIButton) {
        print(self.arrayAction)
        
        animate = AnimationSelection(arrayLabel: self.arrayLabel, arrayLabelMiddle: self.arrayLabelMiddle, arrayLabelAbove: self.arrayLabelAbove, arrayLabelBelow: self.arrayLabelBelow, arrayAction: self.arrayAction)
       
        self.animate.delegate = self
        
        animate.loop()
    }
    func addCompareCount(toView view:UIView){               //
        lblcompareCount = UILabel(frame:CGRect(x: view.bounds.size.width/2 - 160, y: view.bounds.size.height - 200, width: 100, height: 50))
        lblcompareCount.text = "Compare: 0"
        view.addSubview(lblcompareCount)
        
    }
    func addSwapCount(toview view: UIView){                 //
        lblswapCountText = UILabel(frame: CGRect(x: view.bounds.size.width/2 + 60, y: view.bounds.size.height - 200, width: 100, height: 50))
        lblswapCountText.text = "Swap: 0"
        view.addSubview(lblswapCountText)
    }

}
