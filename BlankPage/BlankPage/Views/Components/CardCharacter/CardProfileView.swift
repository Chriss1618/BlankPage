//
//  CardProfileView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 15/12/24.
//

import SwiftUI

struct CardProfileView: View {
    
    var Character : CharacterModel
    var colorText : Color = .white
    var colorCard : Color = Color.accentColor
    
    
    var body: some View {

        ZStack {
            
            VStack{
                Spacer().frame(height: 210)
                ZStack{
                    Rectangle()
                    .foregroundStyle(colorCard)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                        )
                    .shadow(color: Color("AccentColor").opacity(0.8), radius: 6)
                    
                    VStack{
                        Spacer().frame(height: 20)
                        Text( Character.name )
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(colorText)
                            .accessibilityLabel( Character.name )
                        HStack{
                            Text("Age")
                                .font(.subheadline)
                                .foregroundColor(colorText)
                            Text(String(Character.age))
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(colorText)
                                .accessibilityLabel( "Age " + String(Character.age) )
                        }
                        
                        Divider()
                            .frame( width: 150, height: 1.5)
                            .background(colorText)
                        Spacer().frame(height: 15)
                        
                        Text("Description")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(colorText)
                        Text( Character.descriptionCharacter )
                            .font(.subheadline)
                            .foregroundColor(colorText)
                            .multilineTextAlignment(.center)
                            .accessibilityLabel( "Description " + Character.descriptionCharacter )
                        Spacer()
                    }.padding(16)
                }
                
                
                
            }.padding()
                
            VStack{
                ZStack{
                    
                    //Circle().frame(width: 250).foregroundStyle(Color("SecondaryColor"))
                    if let image = Character.icon.emojiToImage() {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( width: 250 )
                    }
                }
                
                Spacer()
            }
           
        }
        
    }
}

#Preview {
    CardProfileView( Character: CharacterModel(name: "Name", age:  0, description:  "", icon:  "🧙🏽‍♂️", particularSigns: ""))
}

