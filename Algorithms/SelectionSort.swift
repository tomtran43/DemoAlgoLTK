//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class SelectionSort {
    
    var arrayAction = [Step]()
    var arrayInput = [Int]()
    
    init(arrayInput: [Int]){
        self.arrayInput = arrayInput
        selectionSort(array: arrayInput)
    }
    
    func selectionSort(array: [Int]){
        
        var n = array.count
        
        for i in 0..<(n-1){
            var min_j = i
            for j in i..<n{
                if (lessThan(i: j, j: min_j) == true){
                    min_j = j
                }
                swap(i: i, j: min_j)
            }
        }
    }
    
    
    
    func compare(i: Int, j: Int) -> Int{
        self.arrayAction.append(Step(act: "compare", i: i, j: j))
        return arrayInput[i]-arrayInput[j]
    }
    
    func lessThan(i: Int, j: Int) -> Bool{
        if compare(i: i, j: j) < 0{
            return true
        }
        return false
    }
    
    func swap(i: Int, j: Int){
        self.arrayAction.append(Step(act: "swap", i: i, j: j))
        var temp = self.arrayInput[i];
        self.arrayInput[i] = self.arrayInput[j]
        self.arrayInput[j] = temp
    }
    
    
}
