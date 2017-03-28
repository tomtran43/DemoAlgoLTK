//
//  ActionStep.swift
//  Algorithms
//
//  Created by Loc Tran on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

protocol PStep {
    var act: String! {get set}
    var i: Int! {get set}
    var j: Int! {get set}
}

struct Step: PStep {
    var act: String!
    var i: Int!
    var j: Int!
}






