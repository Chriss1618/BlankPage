//
//  CharachterModel.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 09/12/24.
//

import SwiftData
import Foundation

@Model
class CharacterModel : Identifiable{
    
    var id: UUID = UUID()
    var icon: String
    var name: String
    var age : Int
    
    var descriptionCharacter: String
    
    init(name: String, age: Int = 0, description: String = "", icon: String = "🧙🏽‍♂️") {
        self.name = name
        self.age = age
        self.descriptionCharacter = description
        self.icon = icon
    }
}
