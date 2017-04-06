//
//  MergeSortVC.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class MergeSortVC: ViewController {
    
    var managerSort: ManagerMergeSort!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerMergeSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [6,4,3,2,8,6,1])
        view.backgroundColor = UIColor.white
        
        btnRun.addTarget(self.managerSort, action: #selector(managerSort.run(sender:)), for: .touchUpInside)
        
        btnInfo.addTarget(self, action: #selector(info(sender:)), for: .touchUpInside)
        
    }
    
    func info(sender:UIButton){
        let vc = MergeSortVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}
