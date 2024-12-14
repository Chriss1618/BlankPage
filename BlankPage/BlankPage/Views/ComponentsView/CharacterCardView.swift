//
//  CharacterCardView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 11/12/24.
//

import SwiftUI
import UIKit

struct CharacterCardView: View {
    
    
    var characterName : String = "Marco Cioni"
    var iconString : String = "🚀"
    
    var body: some View {
        VStack( spacing : 10) {
            if let image = iconString.emojiToImage() {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
            Divider()
                .padding(.horizontal)
            Text(characterName)
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(width: 150)
           
            
            
        }
        .padding()
        .background(.background)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.5), radius: 10)
        .padding(.horizontal, 20)
    }
    
         
}

 
extension String {
    func emojiToImage() -> UIImage? {
            let nsString = (self as NSString)
            let font = UIFont.systemFont(ofSize: 1024) // you can change your font size here
            let stringAttributes = [NSAttributedString.Key.font: font]
            let imageSize = nsString.size(withAttributes: stringAttributes)
     
            UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
            UIColor.clear.set() // clear background
            UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
            nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
            let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
            UIGraphicsEndImageContext() //  end image context
     
            return image
        }
}
#Preview {
    CharacterCardView()
}
