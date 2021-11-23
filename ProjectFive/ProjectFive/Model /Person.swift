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
    
    func getStrSkill() ->String {
        
        switch (self) {
        case .ios: return "iOS"
        case .backend: return "backend"
        case .android: return "android"
        case .marketing: return "marketing"
        case .design: return "design"
        case .indica: return "indica"
        case .sativa: return "sativa"
        }
    }
    
    
    func getColor() -> UIColor {
        switch (self) {
        case .ios: return UIColor(red: 99/255, green: 203/255, blue: 217/255, alpha: 1)
        case .backend: return UIColor(red: 90/255, green: 155/255, blue: 89/255, alpha: 1)
        case .android: return UIColor(red: 181/255, green: 171/255, blue: 167/255, alpha: 1)
        case .marketing: return UIColor(red: 240/255, green: 153/255, blue: 73/255, alpha: 1)
        case .design: return UIColor(red: 120/255, green: 99/255, blue: 249/255, alpha: 1)
        case .indica: return UIColor(red: 218/255, green: 124/255, blue: 48/255, alpha: 1)
        case .sativa: return UIColor(red: 146/255, green: 36/255, blue: 40/255, alpha: 1)
        }
    }
    
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
    
    // checks if the skill exists
    func has(skill: Skill)->Bool {
        for skl in skillSet {
            if skill == skl {
                return true
            }
        }
        return false
    }
    
}
