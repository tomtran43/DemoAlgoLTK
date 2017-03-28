//
//  BarGraph.swift
//  Algorithms
//
//  Created by Loc Tran on 3/27/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class BarGraph: UIView {
    
    let widthRatio = 2
    var arrayBar: [Bar]!
    var arrayBarBelow: [Bar]!
    var arrayBarBehind: [Bar]!
    var arrayDisplay: [Int]!
    var viewcontroller: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(viewcontroller: UIViewController,frame: CGRect, arrayDisplay: [Int], colors: [UIColor]) {
        super.init(frame:frame)
        
        
        self.viewcontroller = viewcontroller
        self.arrayDisplay = arrayDisplay
        self.arrayBar = [Bar]()
        self.arrayBarBelow = [Bar]()
        self.arrayBarBehind = [Bar]()
        
        self.drawBarGraph(arrayDisplay: arrayDisplay, colors: colors)
        
    }
    
    private func getMin()->Int{
        var min = self.arrayDisplay[0]
        
        for index in 1..<self.arrayDisplay.count{
            if (min > self.arrayDisplay[index]){
                min = self.arrayDisplay[index]
            }
        }
        return min
    }
    
    private func getMax()->Int{
        var max = self.arrayDisplay[0]
        
        for index in 1..<self.arrayDisplay.count{
            if (max < self.arrayDisplay[index]){
                max = self.arrayDisplay[index]
            }
        }
        return max
    }
    
    private func convertY(y: Int)->CGFloat{
        let a = self.viewcontroller.view.bounds.size.height/CGFloat(self.getMin() - self.getMax())
        let b = CGFloat(self.getMax())*self.viewcontroller.view.bounds.size.height/CGFloat(self.getMax() - self.getMin())
        
        return a*CGFloat(y)+b
    }
    
    private func drawBarGraph(arrayDisplay: [Int], colors: [UIColor]){
        let spacing = frame.width/CGFloat(widthRatio * arrayDisplay.count + arrayDisplay.count + 1)
        let barWidth = spacing * CGFloat(widthRatio)
        var x = spacing
        let yZero = self.convertY(y: 0)
        
        for index in 0..<arrayDisplay.count {
            
            let y = self.convertY(y: arrayDisplay[index])
            print(y)
            let bar = Bar(frame: CGRect(x: x, y: y,
                                        width: barWidth, height: yZero - y),
                          color: colors[index])
            
            self.arrayBar.append(bar)
            
            self.addSubview(bar)
            
            x = x + spacing + barWidth
        }
    }
        
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

















