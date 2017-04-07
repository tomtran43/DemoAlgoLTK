//
//  SortingLabel.swift
//  Algorithms
//
//  Created by Loc Tran on 3/23/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

class SortingLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(".....")
    }
    
    init(frame: CGRect, color: UIColor, value: String) {
        super.init(frame: frame)
        
        self.backgroundColor = color
        self.text = value
        self.textColor = UIColor.white
        self.textAlignment = NSTextAlignment.center
        self.layer.cornerRadius = frame.width/2
        self.clipsToBounds = true
        self.alpha = DEFAULT_ALPHA
    }
}
