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
    @State private var isEditing = false

    //VIEW
    private let columns : [GridItem] = [
        GridItem(.fixed(200), spacing: 16),
        GridItem(.fixed(200), spacing: 16),
    ]
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(listCharacters) { character in
                            ZStack {
                                NavigationLink(
                                    destination: DetailCharacterView(character: character)
                                ) {
                                    CharacterCardView(
                                        Character: character
                                    )
                                }
                                VStack{
                                    HStack{
                                        Spacer()
                                        if isEditing {
                                           Button(action: {
                                               deleteCharacter(characterToDelete: character)
                                           }) {
                                               ZStack {
                                                   Circle().frame(width: 40, height: 40)
                                                       .foregroundColor(.white)
                                                   Image(systemName: "xmark.circle.fill")
                                                       .resizable()
                                                       .foregroundColor(.red)
                                                       .frame( width: 40, height: 40 )
                                               }
                                               
                                           }
                                        }
                                    }
                                    
                                        Spacer().frame(height: 150)
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationTitle(Text("Character List"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(isEditing ? "Done" : "Remove") {
                            withAnimation {
                                isEditing.toggle()
                            }
                        }
                    }

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
