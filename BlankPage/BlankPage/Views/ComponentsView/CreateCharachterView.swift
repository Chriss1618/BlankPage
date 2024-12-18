//
//  CreateCharachterView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 09/12/24.
//

import SwiftUI

struct CreateCharachterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isExpandedBasicInfo: Bool = false
    @State private var isExpandedDetails: Bool = false
    
    @State var character: CharacterModel?
    
    @State var name : String = ""
    @State private var descriptionCharacter : String = ""
    @State private var particularSigns : String = ""
    
    var addCharacter : ( _ newCharacter : CharacterModel ) -> Void
    
    @State private var selectedEmoticon: String = "😎"
    
    @State private var age = 9

    private let emoticons = ["😀","🧙🏽‍♂️","😎", "🔥","👨🏻‍🎤","🧑🏼‍🚀","🦹🏽","🧚🏻","🧛🏻","🤴🏾","👸🏾","🧝🏽‍♂️ ","👱🏼","👩🏽"]

    
    @State private var isShowingPicker: Bool = false
        
    
    var body: some View {
       
        ZStack{
            VStack{
                ScrollView{
                    
                    iconEmoji
                    
                    DisclosureGroup("Basic Information", isExpanded: $isExpandedBasicInfo) {
                        basicInformation.padding()
                        
                    }.listRowSeparator(.hidden)
                    .padding(.horizontal,20)
                    .padding(.vertical,5)
                    .background(.background)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                    .padding(.horizontal, 10)
                    .padding(.top, 20)
                    
                    DisclosureGroup("Details", isExpanded: $isExpandedDetails) {
                        details
                            .padding()
                        
                    }.listRowSeparator(.hidden)
                    
                        .padding(.horizontal,20)
                        .padding(.vertical,5)
                        .background(.background)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                        .padding(.horizontal, 10)
                    
                }.padding()
                RoundedButton<Any>( text: "Create Character"){ _ in
                    print("pressed Add Character")
                    createCharacter()
                }
               
            }
            
        }
        
    }
    
    func createCharacter(){
        self.character = CharacterModel(name : name, age: age, description: descriptionCharacter, icon: selectedEmoticon, particularSigns: particularSigns)
        addCharacter(character!)
        presentationMode.wrappedValue.dismiss()

    }
    
    var iconEmoji : some View {
        Button(action: {
            isShowingPicker = true // Mostra il foglio modale
        }) {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle( Color.accentColor )
                .overlay(
                    Text(selectedEmoticon)
                        .font(.system(size: 70))
                )
        }
        .padding()
        .sheet(isPresented: $isShowingPicker) {
            ZStack {
                Color.accentColor.opacity(0.8)
                
                .presentationDetents([.medium])
                    .edgesIgnoringSafeArea(.all)

                EmoticonPicker(
                    emoticons: emoticons,
                    selectedEmoticon: $selectedEmoticon
                )
                    
            }
        }

    }
    var basicInformation : some View {
        
        VStack(alignment: .leading,spacing: 5){
            Text("Name").padding(.horizontal,4)
            TextFieldView( text: $name, hint : "Name" )
            
            Spacer().frame(height: 10)
            
            HStack{
                Text("Age").padding(.horizontal,4)
                Picker("", selection: $age) {
                      ForEach(9..<99) { v in
                         Text(String(format: "%02d", v))
                      }
                   }.pickerStyle(.wheel)
                    .frame( width: 100 ,height: 80)
            }
            
            Text("Description").padding(.horizontal,4)
            TextEditor(text: $descriptionCharacter)
                .padding()
                .frame(height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color("TextBorderColor"), lineWidth: 1)
                )
        
        }
        
    }
    
    var details : some View {
        VStack(alignment: .leading,spacing: 5){
            
            Text("Particular Signs").padding(.horizontal,4)
            TextEditor(text: $particularSigns)
                .padding()
                .frame(height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color("TextBorderColor"), lineWidth: 1)
                )
        
        }
        
    }
}

#Preview {
    CreateCharachterView(addCharacter: {addedCharacter in })
}
