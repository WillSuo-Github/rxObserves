//
//  Dog.swift
//  rxObserves
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

struct DogList {
    var users: [Dog]
}


struct Dog {
    var age : integer_t
    var name : String
}


extension Dog: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
}

func ==(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.name == rhs.name
}

extension Dog: Comparable { }

func >(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age > rhs.age
}

func >=(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age >= rhs.age
}

func <(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age < rhs.age
}

func <=(lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age <= rhs.age
}

extension Dog: CustomStringConvertible {
    var description: String {
        return "\(name)'s age is \(age)"
    }
}
