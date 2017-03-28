//
//  ViewController.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class BubbleSortVC: UIViewController {

    var managerSort: ManagerBubbleSort!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerBubbleSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
