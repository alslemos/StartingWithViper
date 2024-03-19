//
//  BaseModel.swift
//  StartingWithViper
//
//  Created by Alexandre Lemos da Silva on 18/03/24.
//

import Foundation
import UIKit

struct BaseModel: Codable {
    
    var title: String
    var description: String
    
    
    static let exampleDummyModels =  [
        BaseModel(title: "Dummy1", description: "Dummy1"),
        BaseModel(title: "Dummy2", description: "Dummy1"),
        BaseModel(title: "Dummy3", description: "Dummy1"),
        BaseModel(title: "Dummy4", description: "Dummy1")
        
    ]
    
}
