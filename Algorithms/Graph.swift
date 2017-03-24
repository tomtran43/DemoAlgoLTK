//
//  Graph.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit


class Graph: UILabel {
      
    let widthRatio = 2
    var arrayLabel: [SortingLabel]!
    var viewcontroller: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(viewcontroller: UIViewController, frame: CGRect, arrayDisplay: [Int], colors: [UIColor]) {
        
        super.init(frame: frame)
        
        self.viewcontroller = viewcontroller
        self.arrayLabel = [SortingLabel]()
        self.drawGraph(arrayDisplay: arrayDisplay, colors: colors)
        
    }
    
    private func drawGraph(arrayDisplay: [Int], colors: [UIColor]){
        
        
        var spacing = frame.width/CGFloat(self.widthRatio * arrayDisplay.count + arrayDisplay.count + 1)
        var rectSize = CGFloat(widthRatio) * spacing
        
        var x = spacing
        
        for index in 0..<arrayDisplay.count{
            
            let sortingLabel = SortingLabel(frame: CGRect(x: x, y: frame.height/2,
                                                   width: rectSize, height: rectSize),
                                     color: colors[index],
                                     value: String(arrayDisplay[index]))
            
            arrayLabel.append(sortingLabel)
            
            self.viewcontroller.view.addSubview(sortingLabel)
            
            x = x + spacing + rectSize
            
        }
    }
}
