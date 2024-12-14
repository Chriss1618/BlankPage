//
//  TextFieldView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 11/12/24.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    var hint : String = "Hint"
    var body: some View {
        TextField( hint , text: $text)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke( Color("TextBorderColor"), lineWidth: 1)
            )
    }
}

#Preview {
    @Previewable @State var previewText = ""
        
    TextFieldView( text: $previewText )
}
