//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Loc Tran on 3/22/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class BubbleSort {
    
    var acionArray = [Step]()
    var inputArray = [Int]()
    
    init(inputArray: [Int]){
        self.inputArray = inputArray
        bubbleSort(array: inputArray)
    }
    
    func bubbleSort(array: [Int]){
        var n = array.count
        
        for i in 0..<n{
            for j in 0..<(n-i-1){
                if (lessThan(i: j+1, j: j) == true){
                    swap(i: j, j: j+1)
                }
            }
        }
    }
    
    func compare(i: Int, j: Int) -> Int{
        self.acionArray.append(Step(act: "compare", i: i, j: j))
        return inputArray[i]-inputArray[j]
    }
    
    func lessThan(i: Int, j: Int) -> Bool{
        if compare(i: i, j: j) > 0{
            return false
        }
        return true
    }
    
    func swap(i: Int, j: Int){
        self.acionArray.append(Step(act: "swap", i: i, j: j))
        var temp = self.inputArray[i];
        self.inputArray[i] = self.inputArray[j]
        self.inputArray[j] = temp
    }
    

}
