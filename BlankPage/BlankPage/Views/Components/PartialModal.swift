//
//  PartialModal.swift
//  BlankPage
//
//  Created by Cristofor Doamre on 10/12/24.
//
import SwiftUI

struct PartialModalView: View {
    @State private var offsetY: CGFloat = 300 // Altezza iniziale della modale
    @State private var dragOffset: CGFloat = 0 // Offset corrente durante il trascinamento
    @State private var fullHeight: CGFloat = UIScreen.main.bounds.height * 0.8

    var body: some View {
            // Modale parziale
            GeometryReader { geometry in
                VStack {
                    Capsule()
                        .frame(width: 40, height: 6)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    // Calcola l'offset durante il trascinamento
                                    dragOffset = value.translation.height
                                }
                                .onEnded { value in
                                    print("offset: \(offsetY)  dragOffest \(dragOffset)" )
                                    // Determina la posizione finale della modale
                                    if  dragOffset < 0 {
                                        offsetY = 300 // Ritornare alla posizione minimizzata
                                    } else {
                                        offsetY = fullHeight // Mostrare tutta la modale
                                    }
                                    
                                    dragOffset = 0
                                }
                        )
                    
                    // Contenuto della modale
                    VStack(spacing: 16) {
                        TextField("Cerca qui...", text: .constant(""))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)

                        Text("Altro contenuto qui")
                        Spacer()
                    }
                    .padding()
                }
                .frame(width: geometry.size.width, height: fullHeight, alignment: .top)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(radius: 10)
                )
                .offset(y: offsetY + dragOffset)
                .animation(.interactiveSpring(), value: offsetY + dragOffset)
            }
            .ignoresSafeArea()
        
    }
}

struct PartialModalView_Previews: PreviewProvider {
    static var previews: some View {
        PartialModalView()
    }
}

