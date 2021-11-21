//
//  Person.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import Foundation


class Person {
    var name: String
    var year: String
    var skillSet: [String]
    
    init(name: String, year: String, skillSet: [String]) {
        self.name = name
        self.year = year
        self.skillSet = skillSet
    }
}
