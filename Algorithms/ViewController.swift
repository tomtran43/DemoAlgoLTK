//
//  ViewController.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrayInput = [4,6,8,3,5,7]
    var animate: AnimationSort!
    
    
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animate = AnimationSort(viewController: self, inputArray: arrayInput)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}

