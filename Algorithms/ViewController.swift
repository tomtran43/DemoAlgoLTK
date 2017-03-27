//
//  ViewController.swift
//  Algorithms
//
//  Created by Loc Tran on 3/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var managerSort: ManagerSort!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [4,6,8,3,5,7,2,2,9])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

