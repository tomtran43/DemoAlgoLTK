//
//  QuickSortVC.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class QuickSortVC: ViewController {
    
    var managerSort: ManagerQuickSort!
    var btnStart:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.managerSort = ManagerQuickSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1,0,5,7])
        view.backgroundColor = UIColor.white
        
        
        
        btnRun.addTarget(self.managerSort, action: #selector(ManagerQuickSort.run(sender:)), for: .touchUpInside)
        
        btnInfo.addTarget(self, action: #selector(info(sender:)), for: .touchUpInside)
        
    }
    
    
    func info(sender:UIButton){
        let vc = InfoBubbleSortVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

