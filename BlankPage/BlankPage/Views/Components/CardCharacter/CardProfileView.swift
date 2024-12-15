//
//  CardProfileView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 15/12/24.
//

import SwiftUI

struct CardProfileView: View {
    
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
                        Text("Cristofor Doamre")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(colorText)
                        HStack{
                            Text("Age")
                                .font(.subheadline)
                                .foregroundColor(colorText)
                            Text("23")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(colorText)
                        }
                        
                        Divider()
                            .frame( width: 150, height: 1.5) // Spessore della linea
                            .background(colorText)
                        Spacer().frame(height: 15)
                        
                        Text("Description")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(colorText)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.subheadline)
                            .foregroundColor(colorText)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }.padding(16)
                }
                
                
                
            }.padding()
                
            VStack{
                ZStack{
                    
                    //Circle().frame(width: 250).foregroundStyle(Color("SecondaryColor"))
                    if let image = "🧙🏽‍♂️".emojiToImage() {
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
    CardProfileView()
}
