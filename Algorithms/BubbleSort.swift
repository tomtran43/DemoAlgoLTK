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
    
    var arrayAction = [Step]()
    var arrayInput = [Int]()
    
    init(arrayInput: [Int]){
        self.arrayInput = arrayInput
        bubbleSort(array: arrayInput)
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
        self.arrayAction.append(Step(act: "compare", i: i, j: j))
        return arrayInput[i]-arrayInput[j]
    }
    
    func lessThan(i: Int, j: Int) -> Bool{
        if compare(i: i, j: j) > 0{
            return false
        }
        return true
    }
    
    func swap(i: Int, j: Int){
        self.arrayAction.append(Step(act: "swap", i: i, j: j))
        var temp = self.arrayInput[i];
        self.arrayInput[i] = self.arrayInput[j]
        self.arrayInput[j] = temp
    }
    

}
