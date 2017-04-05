//
//  InsertionSortVC.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class InsertionSortVC: UIViewController {

    var managerSort: ManagerInsertionSort!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerInsertionSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1])
        view.backgroundColor = UIColor.white

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
