//
//  CharactersViewModel.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 12/12/24.
//

import Foundation

@Observable
class CharactersViewModel {
    var characters: [CharacterModel] = [
        CharacterModel(
            name: "Cristofor il distruttore",
            description: "Stupid Hero",
            icon: "😎"
        ),
        CharacterModel(
            name: "Genny OG",
            description: "Amazing Hero",
            icon: "🧚‍♀️"
        ),
    ]
}
