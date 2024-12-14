//
//  StrokeButtonView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 14/12/24.
//

import SwiftUI

struct StrokeButtonView<T>: View {
    
    var text : String = "Button"
    var type : TypeButton = .normal
    
    var action: (T?) -> Void = { _ in }
    var parameter: T? = nil
    
    
    var body: some View {
        
        let color = (type != TypeButton.cancel ) ? ButtonColors.primaryButtonColor  : ButtonColors.cancelButtonColor
        Button( action: { action(parameter) } ) {
            Text(text)
                .fontWeight( .bold )
                .frame(width: 150)
                .font(.subheadline)
                .foregroundColor( color )
                .padding()
                .cornerRadius(20)
        }.background(
            RoundedRectangle(cornerRadius: 20)
                .stroke( color , lineWidth: 2)
        )
    }
    
}

#Preview {
    StrokeButtonView<Any>()
}
