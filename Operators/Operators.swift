//
//  Operators.swift
//  AR World
//
//  Created by Nate Sesti on 11/5/18.
//  Copyright © 2018 Nate Sesti. All rights reserved.
//

import Foundation
import UIKit


// - = x
// | = y
infix operator +-: AdditionPrecedence
infix operator +|: AdditionPrecedence
postfix operator ++
postfix operator --
infix operator *-: MultiplicationPrecedence
infix operator *|: MultiplicationPrecedence
infix operator /-: MultiplicationPrecedence
infix operator /|: MultiplicationPrecedence
infix operator **: MultiplicationPrecedence
infix operator %=: MultiplicationPrecedence //Divisible by
infix operator ~: AdditionPrecedence
