//
//  SelectionSortVC.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class SelectionSortVC: ViewController {
    
    
    var managerSort: ManagerSelectionSort!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.managerSort = ManagerSelectionSort()
        self.managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1])
        view.backgroundColor = UIColor.white
        
        btnRun.addTarget(self.managerSort, action: #selector(managerSort.run(sender:)), for: .touchUpInside)
        
        btnInfo.addTarget(self, action: #selector(info(sender:)), for: .touchUpInside)
        
        btnStep.addTarget(self.managerSort, action: #selector(managerSort.step(sender:)), for: .touchUpInside)
        
        btnReset.addTarget(self, action:  #selector(reset(sender:)), for: .touchUpInside)
        
    }
    
    func info(sender:UIButton){
        let vc = SelectionSortVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func reset(sender:UIButton){
        self.managerSort.graph.removeFromSuperview()
        btnRun.isUserInteractionEnabled = true
        btnStep.isUserInteractionEnabled = true
        managerSort.initSortWith(viewcontroller: self, arrayInput: [2,6,4,3,2,7,1])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

