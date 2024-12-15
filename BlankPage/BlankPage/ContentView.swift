//
//  ContentView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 09/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //SYSYEM
    @Environment(\.modelContext) private var context
    //DATA
    @Query private var listCharacters : [CharacterModel]
    
    //VIEW
    private let columns : [GridItem] = [
        GridItem(.fixed(200), spacing: 8),
        GridItem(.fixed(200), spacing: 8),
    ]
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(listCharacters) { character in
                            NavigationLink(
                                destination: DetailCharacterView(character: character)
                            ) {
                                CharacterCardView(
                                    characterName: character.name,
                                    iconString: character.icon
                                )
                            }
                        }
                        .onDelete { indexes in
                            for index in indexes {
                                deleteCharacter(characterToDelete: listCharacters[index])
                            }
                        }
                    }
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationTitle(Text("Character List"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CreateCharachterView(addCharacter: addCharacter)) {
                            Label("", systemImage: "plus")
                        }
                    }
                }
            }
            
            
        }
    }

    private func addCharacter( newCharacter : CharacterModel ) -> Void{
        withAnimation {
            context.insert(newCharacter)
        }
    }
   
    private func deleteCharacter(characterToDelete: CharacterModel) -> Void {
        withAnimation {
            context.delete(characterToDelete)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: CharacterModel.self, inMemory: true)
}
