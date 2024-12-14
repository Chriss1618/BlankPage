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
    @Environment(\.modelContext) private var modelContext
    
    //DATA
    @Query private var items: [Item]
    var charactersViewModel = CharactersViewModel()
    
    //VIEW
    private let columns : [GridItem] = [
        GridItem(.fixed(200), spacing: 1),
        GridItem(.fixed(200), spacing: 1),
    ]
    
    var body: some View {
        
        ZStack{
            VStack{
                NavigationStack{
                    ScrollView {
                        
                        LazyVGrid(columns: columns,spacing: 20) {
                            ForEach(charactersViewModel.characters) { character in
                                NavigationLink ( destination: CreateCharachterView() ) {
                                    CharacterCardView(
                                        characterName: character.name,
                                        iconString: character.icon
                                    )
                                }
                            }
                            .onDelete(perform: deleteItems)
                            
                        }
                        
                    }.navigationTitle(Text("Character List"))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: CreateCharachterView()) {
                                ButtonView(action: addItem,icon: "plus")
                            }
                        }
                    }
                    
                }
                    
            }
            
        }
        
      
        

        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
