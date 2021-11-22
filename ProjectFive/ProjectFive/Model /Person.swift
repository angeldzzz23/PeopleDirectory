//
//  Person.swift
//  ProjectFive
//
//  Created by angel zambrano on 11/21/21.
//

import Foundation
import UIKit


enum Skill {
    case ios
    case backend
    case android
    case marketing
    case design
    case indica
    case sativa
    
}


class Person {
    var name: String
    var year: String
    var skillSet: [Skill]
    var img: UIImage
    
    init(name: String, year: String, skillSet: [Skill], img: UIImage) {
        self.name = name
        self.year = year
        self.skillSet = skillSet
        self.img = img
    }
}
