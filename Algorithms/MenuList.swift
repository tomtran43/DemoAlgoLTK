//
//  MenuList.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

struct Menu {
    var title: String
    var viewClass: String
};

struct MenuSection {
    var section: String
    var menus: [Menu]
}

class MenuList: NSObject {
    
    var menu : [MenuSection]!
    class func boot(window:UIWindow){
        let basic = MenuSection(section: "Sort", menus:[
            Menu(title: "Bubble Sort", viewClass: "BubbleSortSVC"),
            Menu(title: "Selection Sort", viewClass: "SelectionSortSVC"),
            Menu(title: "Insertion Sort", viewClass: "InsertionSortSVC"),
            Menu(title: "Merge Sort", viewClass: "MergeSortSVC"),
            Menu(title: "Quick Sort", viewClass: "QuickSortSVC"),
            Menu(title: "Heap Sort", viewClass: "HeapSortSVC"),
            Menu(title: "Bubble Sort Input", viewClass: "BubbleSortIVC"),
            Menu(title: "Selection Sort Input", viewClass: "SelectionSortIVC")



            ])
        
        let inter = MenuSection(section: "inter", menus:[
            Menu(title: "Rock", viewClass: "ClassVC"),
            Menu(title: "Home", viewClass: "ClassVC")
            ])
        
        let advance = MenuSection(section: "advance", menus:[
            Menu(title: "Rock", viewClass: "ClassVC"),
            Menu(title: "Home", viewClass: "ClassVC")
            ])
        
        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
        mainScreen.menu = [basic, inter, advance]
        mainScreen.title = "Algorithms"
        mainScreen.about = "KLTD Team"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        window.rootViewController = nav
        
    }
}
