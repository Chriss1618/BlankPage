//
//  DetailCharacterView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 15/12/24.
//

import SwiftUI

struct DetailCharacterView: View {
    
    var character: CharacterModel
    
    var body: some View {
        iconEmoji
    }
    
    var iconEmoji : some View {
        VStack{
            CardProfileView(Character: character)
        }
        
        
        
    }
}

#Preview {
    DetailCharacterView( character: CharacterModel(name:"Chris", icon: "🧙🏽‍♂️" ))
}

