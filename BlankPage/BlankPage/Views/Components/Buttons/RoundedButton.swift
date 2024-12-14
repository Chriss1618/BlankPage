//
//  RoundedButton.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 14/12/24.
//

import SwiftUI

struct RoundedButton<T>: View {
    
    var text : String = "Button"
    
    var action: (T?) -> Void = { _ in }
    var parameter: T? = nil
    
    var body: some View {
        Button(action: { action(parameter) } ) {
            Text(text)
                .frame(width: 150)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
                .background( ButtonColors.primaryButtonColor )
                .cornerRadius(20)
                
        }
        
        
    }
}

#Preview {
    RoundedButton<Any>()
}
