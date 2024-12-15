//
//  buttonView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 11/12/24.
//

import SwiftUI

struct ButtonView<T>: View {
    
    var text : String = "Button"
    
    var action: (T?) -> Void = { _ in }
    var parameter: T? = nil
    
    var icon :String  = "plus"
    
    var body: some View {
       
        
        Button(action: { action(parameter) }) {
            Label(text, systemImage: icon)
        }
    }
}

#Preview {
    ButtonView<Any>()
}
