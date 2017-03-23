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
      
    var numOfRect: Int!
    let widthRatio = 2
    var arrayLabel = [UILabel]()

    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(frame: CGRect, arrayDisplay: [Int], colors: [UIColor]) {
        super.init(frame: frame)
        self.numOfRect = arrayDisplay.count
        self.drawGraph(arrayDisplay: arrayDisplay, colors: colors)
        
    }
    
    private func drawGraph(arrayDisplay: [Int], colors: [UIColor]){
     
        var spacing = frame.width/CGFloat(self.widthRatio * self.numOfRect + self.numOfRect + 1)
        var rectSize = CGFloat(self.widthRatio) * spacing
        
        for index in 0..<self.numOfRect{
            
            let label = SortingLabel(frame: CGRect(x: spacing + CGFloat(index)*rectSize, y: frame.height/2 - rectSize, width: rectSize, height: rectSize))
            
            label.identifier = arrayDisplay[index]
            label.position = Position(col: index)
            
            label.backgroundColor = colors[index]
            label.text = String(arrayDisplay[index])
            label.textColor = UIColor.black
            label.textAlignment = NSTextAlignment.center

            arrayLabel.append(label)
            
            self.addSubview(label)
            
        }
        
    }
}
