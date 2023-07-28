//
//  Picture.swift
//  Consolidation5
//
//  Created by Immanuel Matthews-Feemster on 7/25/23.
//

import UIKit

class Picture: NSObject, Codable {
    var caption: String
    var image: String
    
    init(caption: String, image: String) {
        self.caption = caption
        self.image = image
    }
}
