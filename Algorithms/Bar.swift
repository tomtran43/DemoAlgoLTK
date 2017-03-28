//
//  Bar.swift
//  Algorithms
//
//  Created by Loc Tran on 3/27/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class Bar: UIView{
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        drawBar(barWidth: frame.width, barHeight: frame.height, color: color.cgColor)
        
    }
    
    func drawBar(barWidth: CGFloat, barHeight: CGFloat, color: CGColor){
        
        let bar = UIView(frame: self.frame)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bar.bounds
        maskLayer.path = UIBezierPath(rect: bar.bounds).cgPath
        bar.layer.mask = maskLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path
        borderLayer.fillColor = color
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.lineWidth = 2
        borderLayer.frame = bar.bounds
        
        self.layer.addSublayer(borderLayer)
        
    }
}
