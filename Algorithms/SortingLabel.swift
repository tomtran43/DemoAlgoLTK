//
//  Cell.swift
//  Algorithms
//
//  Created by Loc Tran on 3/23/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class SortingLabel: UILabel{
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(frame: CGRect, color: UIColor, value: String){
        super.init(frame: frame)
        drawSortingLabel(size: frame.width, color: color, value: value)
        
    }
    
    func drawSortingLabel(size: CGFloat, color: UIColor, value: String) {
        
        let sortingLabel = UILabel(frame: self.frame)
        
        sortingLabel.backgroundColor = color
        sortingLabel.text = value
        sortingLabel.textAlignment = NSTextAlignment.center
        sortingLabel.textColor = UIColor.white
        
        self.addSubview(sortingLabel)
        
    }
    
}
