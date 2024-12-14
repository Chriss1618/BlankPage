//
//  buttonView.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 11/12/24.
//

import SwiftUI

struct ButtonView: View {
    
    var action: () -> Void = { }
    var icon :String  = "plus"
    var text : String = ""
    
    var body: some View {
        Button(action: action) {
            Label(text, systemImage: icon)
        }
    }
}

#Preview {
    ButtonView()
}
