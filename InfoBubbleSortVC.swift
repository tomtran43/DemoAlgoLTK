//
//  InfoBubbleSortVC.swift
//  Algorithms
//
//  Created by TTung on 4/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class InfoBubbleSortVC: UIViewController {
    
    var lblText: UILabel!
    var btnChangeText:UIButton!
    var id = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        addChangeToPseudoCode()
        addBtnChangeText()
        btnChangeText.addTarget(self, action: #selector(changeText(_:)), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addChangeToPseudoCode()
    {
        lblText = UILabel(frame:CGRect(x: 0, y: 0, width: view.bounds.size.width - 50 , height: view.bounds.size.height/2))
        lblText.center = CGPoint(x: view.center.x, y: view.center.y)
        lblText.layer.backgroundColor = UIColor.cyan.cgColor
        lblText.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblText.numberOfLines = 0
        lblText.text = String("Bubble sort is a simple and well-known sorting algorithm. It is used in practice once in a blue moon and its main application is to make an introduction to the sorting algorithms. Bubble sort belongs to O(n2) sorting algorithms, which makes it quite inefficient for sorting large data volumes. Bubble sort is stable and adaptive.")
        view.addSubview(lblText)
    }
    //
    func addBtnChangeText() {
        btnChangeText = UIButton(frame: CGRect(x: view.center.x/2, y: view.center.y + 200, width: 200, height: 50))
        btnChangeText.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnChangeText.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnChangeText.setTitle("Change To PseudoCode", for: .normal)
        btnChangeText.layer.cornerRadius = 10
        
        view.addSubview(btnChangeText)
    }
    //
    func changeText(_ sender: Any?) {
        if (id == 1) {
            btnChangeText.setTitle("Change To Definition", for: .normal)
            print("Changed To PseudoCode")
            lblText.text = String("do\nswapped = false\nfor i = 1 to indexOfLastUnsortedElement\nif leftElement > rightElement\nswap(leftElement, rightElement)\nswapped = true\nwhile swapped")
            self.id = 2
        } else {
            lblText.removeFromSuperview()
            btnChangeText.setTitle("Change To PseudoCode", for: .normal)
            addChangeToPseudoCode()
            self.id = 1
        }
    }
}
