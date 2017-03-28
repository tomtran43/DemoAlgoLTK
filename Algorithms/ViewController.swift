//
//  ViewController.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var managerSort: ManagerSelectionSort!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerSelectionSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

