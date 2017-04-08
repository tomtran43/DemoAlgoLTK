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
    var btnAdd:UIButton!
    var textField:UITextField!
    var arrayView:UILabel!
    
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
        addBtnAdd()
        addTextField()
        addTextView()
        
    }
    
    func addBtnReset() {
        
        btnReset = UIButton(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnReset.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnReset.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnReset.setTitle("Reset", for: .normal)
        
        btnReset.titleLabel?.font = UIFont(name: "Heiti TC", size: 40)
        btnReset.titleLabel?.adjustsFontSizeToFitWidth = true
        btnReset.titleLabel?.numberOfLines = 0
        btnReset.titleLabel?.minimumScaleFactor = 0.2
        btnReset.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnReset.titleLabel?.baselineAdjustment = .alignCenters
        btnReset.titleLabel?.textAlignment = .center
        btnReset.layer.cornerRadius = 10
        view.addSubview(btnReset)
    }
    
    func addBtnInfo() {
        
        btnInfo = UIButton(frame: CGRect(x: x, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnInfo.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnInfo.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnInfo.setTitle("\u{1F4DA}", for: .normal)
        btnInfo.titleLabel?.textColor = UIColor.white
        btnInfo.titleLabel?.font = UIFont(name: "Heiti TC", size: 60)
        btnInfo.titleLabel?.adjustsFontSizeToFitWidth = true
        btnInfo.titleLabel?.numberOfLines = 0
        btnInfo.titleLabel?.minimumScaleFactor = 0.2
        btnInfo.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnInfo.titleLabel?.baselineAdjustment = .alignCenters
        btnInfo.titleLabel?.textAlignment = .center
        btnInfo.layer.cornerRadius = 10

        
        view.addSubview(btnInfo)
    }
    
    func addBtnStep() {
        
        btnStep = UIButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnStep1 = btnStep
        btnStep.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnStep.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnStep.setTitle("\u{25BA}", for: .normal)
        
        btnStep.titleLabel?.textColor = UIColor.white
        btnStep.titleLabel?.font = UIFont(name: "Heiti TC", size: 60)
        btnStep.titleLabel?.adjustsFontSizeToFitWidth = true
        btnStep.titleLabel?.numberOfLines = 0
        btnStep.titleLabel?.minimumScaleFactor = 0.2
        btnStep.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        
        btnStep.titleLabel?.baselineAdjustment = .alignCenters
        btnStep.titleLabel?.textAlignment = .center
        btnStep.layer.cornerRadius = 10

        view.addSubview(btnStep)
    }
    
    func addBtnRun() {
        
        btnRun = UIButton(frame: CGRect(x: 2*x+btnSizeWidth, y: view.bounds.size.height-spacing-btnSizeHeight, width: btnSizeWidth, height: btnSizeHeight))
        btnRun1 = btnRun
        btnRun.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnRun.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnRun.setTitle("Run", for: .normal)
        
        btnRun.titleLabel?.font = UIFont(name: "Heiti TC", size: 60)
        btnRun.titleLabel?.adjustsFontSizeToFitWidth = true
        btnRun.titleLabel?.numberOfLines = 0
        btnRun.titleLabel?.minimumScaleFactor = 0.2
        btnRun.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnRun.titleLabel?.baselineAdjustment = .alignCenters
        btnRun.titleLabel?.textAlignment = .center
        btnRun.layer.cornerRadius = 10

        view.addSubview(btnRun)
    }
    
    func addBtnAdd() {
        btnAdd = UIButton(frame: CGRect(x: 2*x-spacing, y: view.bounds.size.height-spacing*2-btnSizeHeight*2, width: btnSizeWidth, height: btnSizeHeight))
        btnAdd.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        btnAdd.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnAdd.setTitle("\u{23CE}", for: .normal)
        
        btnAdd.titleLabel?.font = UIFont(name: "Heiti TC", size: 60)
        btnAdd.titleLabel?.adjustsFontSizeToFitWidth = true
        btnAdd.titleLabel?.numberOfLines = 0
        btnAdd.titleLabel?.minimumScaleFactor = 0.2
        btnAdd.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        btnAdd.titleLabel?.baselineAdjustment = .alignCenters
        btnAdd.titleLabel?.textAlignment = .center
        btnAdd.layer.cornerRadius = 10
        
        view.addSubview(btnAdd)
    }
    
    func addTextField(){
        textField = UITextField(frame: CGRect(x: 2*x+btnSizeWidth, y: view.bounds.size.height-spacing*2-btnSizeHeight*2, width: btnSizeWidth, height: btnSizeHeight))
        
        textField.placeholder = "Enter text here"
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textField.layer.cornerRadius = 10
        self.view.addSubview(textField)
    }
    
    func addTextView() {
        arrayView = UILabel(frame: CGRect(x: spacing, y: view.bounds.size.height-spacing*2-btnSizeHeight*2, width: btnSizeWidth*2+spacing, height: btnSizeHeight))
        
        arrayView.font = UIFont.boldSystemFont(ofSize: 15)
        arrayView.backgroundColor = UIColor.white
        arrayView.textAlignment = .center
        arrayView.layer.cornerRadius = 10

        self.view.addSubview(arrayView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    

   
}
