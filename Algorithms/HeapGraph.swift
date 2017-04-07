//
//  HeapGraph.swift
//  Algorithms
//
//  Created by Loc Tran on 4/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class HeapGraph: UILabel {
    
    let widthRatio = 2
    var arrayLabel: [SortingLabel]!
    var arrayLabelBehind: [SortingLabel]!
    var arrayLabelOne: [SortingLabel]!
    var arrayLabelTwo: [SortingLabel]!
    var arrayLabelThree: [SortingLabel]!
    
    var arrayPosition: [SortingLabel]!
    
    var arrayLine: [CAShapeLayer]!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(frame: CGRect, arrayDisplay: [Int], colors: [UIColor]) {
        super.init(frame: frame)
        
        self.arrayLabel = [SortingLabel]()
        self.arrayLabelBehind = [SortingLabel]()
        self.arrayLabelOne = [SortingLabel]()
        self.arrayLabelTwo = [SortingLabel]()
        self.arrayLabelThree = [SortingLabel]()
        self.arrayPosition = [SortingLabel]()
        self.arrayLine = [CAShapeLayer]()
        
        self.drawGraph(arrayDisplay: arrayDisplay, colors: colors)
        
        
        self.arrayPosition.append(self.arrayLabelOne[3])
        self.arrayPosition.append(self.arrayLabelTwo[1])
        self.arrayPosition.append(self.arrayLabelTwo[5])
        self.arrayPosition.append(self.arrayLabelThree[0])
        self.arrayPosition.append(self.arrayLabelThree[2])
        self.arrayPosition.append(self.arrayLabelThree[4])
        self.arrayPosition.append(self.arrayLabelThree[6])
        
    }
    
    private func drawGraph(arrayDisplay: [Int], colors: [UIColor]) {
        
        let spacing = frame.width/CGFloat(self.widthRatio * arrayDisplay.count + arrayDisplay.count + 1)
        let rectSize = CGFloat(widthRatio) * spacing
        var x = spacing
        
        SPACING = spacing
        
        var yFloor: CGFloat
        
        for index in 0..<arrayDisplay.count {
            
            let sortingLabel = SortingLabel(frame: CGRect(x: x, y: 100,
                                                          width: rectSize, height: rectSize),
                                            color: colors[index],
                                            value: String(arrayDisplay[index]))
            
            let FloorBehind = SortingLabel(frame: CGRect(x: x, y: 100,
                                                      width: rectSize, height: rectSize),
                                        color: DEFAULT_COLOR,
                                        value: "0")
            
            FloorBehind.isHidden = true
            yFloor = FloorBehind.frame.origin.y + rectSize*2 + spacing
            
            let FloorOne = SortingLabel(frame: CGRect(x: x, y: yFloor,
                                                      width: rectSize, height: rectSize),
                                        color: DEFAULT_COLOR,
                                        value: "0")
            
            FloorOne.isHidden = true
            yFloor = FloorOne.frame.origin.y + rectSize*2 + spacing
            
            let FloorTwo = SortingLabel(frame: CGRect(x: x, y: yFloor,
                                                        width: rectSize, height: rectSize),
                                          color: DEFAULT_COLOR,
                                          value: "0")
            FloorTwo.isHidden = true
            yFloor = FloorTwo.frame.origin.y + rectSize*2 + spacing
            
            let FloorThree = SortingLabel(frame: CGRect(x: x, y: yFloor,
                                                       width: rectSize, height: rectSize),
                                         color: DEFAULT_COLOR,
                                         value: "0")
            FloorThree.isHidden = true
            
            
            self.arrayLabel.append(sortingLabel)
            self.arrayLabelOne.append(FloorOne)
            self.arrayLabelTwo.append(FloorTwo)
            self.arrayLabelThree.append(FloorThree)
            self.arrayLabelBehind.append(FloorBehind)
            
            self.addSubview(FloorBehind)
            self.addSubview(FloorOne)
            self.addSubview(FloorTwo)
            self.addSubview(FloorThree)
            self.insertSubview(sortingLabel, at: 2)
                        
            x = x + spacing + rectSize
        }
    }
    
    func drawLine(start: Int, arrayPosition: [SortingLabel]){
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        var end: Int!
        
        if start == 0 {
            end = start
        }else if (start % 2 != 0){
            end = (start-1)/2
        }else if (start % 2 == 0){
            end = (start-2)/2
        }
        
        linePath.move(to: self.arrayPosition[start].center)
        linePath.addLine(to: self.arrayPosition[end].center)
        line.path = linePath.cgPath
        line.strokeColor = GRAY_COLOR.cgColor
        line.lineWidth = 4
        self.layer.insertSublayer(line, at: 1)
        
        self.arrayLine.append(line)
    }
    
    func removeLine(){
        self.arrayLine.last?.removeFromSuperlayer()
        self.arrayLine.removeLast()
        
    }

    
    
}
