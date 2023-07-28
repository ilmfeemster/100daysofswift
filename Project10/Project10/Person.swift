//
//  Person.swift
//  Project10
//
//  Created by Immanuel Matthews-Feemster on 7/17/23.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init (name: String, image: String) {
        self.name = name
        self.image = image
    }
}
