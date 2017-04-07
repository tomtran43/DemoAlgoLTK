//
//  ViewController.swift
//  Algorithms
//
//  Created by TTung on 4/5/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var spacing:CGFloat!
    var widthRatio = 3
    var btnSizeWidth:CGFloat!
    var btnSizeHeight:CGFloat!
    var x:CGFloat!
    var btnReset:UIButton!
    var btnInfo:UIButton!
    var btnStep:UIButton!
    var btnRun:UIButton!
    
    var y: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spacing = view.bounds.size.width/CGFloat(widthRatio*4 + 5)
        btnSizeWidth = spacing*CGFloat(widthRatio)
        btnSizeHeight = btnSizeWidth*2/3
        y = view.bounds.size.height - spacing * 2 - btnSizeHeight
        yMax = y
        x = 2*spacing + btnSizeWidth
        addBtnReset()
        addBtnInfo()
        addBtnStep()
        addBtnRun()
    }
    
    func addBtnReset() {
        
        btnReset = UIButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnReset.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnReset.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnReset.setTitle("Reset", for: .normal)
        btnReset.layer.cornerRadius = 10
        view.addSubview(btnReset)
    }
    
    func addBtnInfo() {
        
        btnInfo = UIButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnInfo.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnInfo.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnInfo.setTitle("Info", for: .normal)
        btnInfo.layer.cornerRadius = 10

        
        view.addSubview(btnInfo)
    }
    
    func addBtnStep() {
        
        btnStep = UIButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnStep.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnStep.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStep.setTitle("Step", for: .normal)
        btnStep.layer.cornerRadius = 10

        view.addSubview(btnStep)
    }
    
    func addBtnRun() {
        
        btnRun = UIButton(frame: CGRect(x: 2*x+btnSizeWidth, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnRun.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnRun.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnRun.setTitle("Run", for: .normal)
        btnRun.layer.cornerRadius = 10

        view.addSubview(btnRun)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    

   
}
