//
//  CreateCharachterView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 09/12/24.
//

import SwiftUI

struct CreateCharachterView: View {
    @State private var isExpandedBasicInfo: Bool = false
    @State private var isExpandedDetails: Bool = false
    
    @State var character: Character?
    @State var name : String = ""
    
    @State private var text: String = ""
    @State private var userInput: String = ""
    
    var body: some View {
       
        ZStack{
            VStack{
                ScrollView{
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.blue)
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
                
               
            }
            
            
        }
        
    }
    
    func createCharacter(){
        
    }
    
    var basicInformation : some View {
        
        VStack(alignment: .leading,spacing: 5){
            Text("Name").padding(.horizontal,4)
            TextFieldView( text: $text, hint : "Name" )
            
            Spacer().frame(height: 10)
            
            Text("Name").padding(.horizontal,4)
            TextFieldView( text: $text, hint : "Name" )
            
            Text("Description").padding(.horizontal,4)
            TextEditor(text: $userInput)
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
            TextEditor(text: $userInput)
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
    CreateCharachterView()
}
