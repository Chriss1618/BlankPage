import SwiftUI


struct EmoticonPicker: View {
    
    let emoticons: [String]
    @Binding var selectedEmoticon: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Pick an Emoticon")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                ForEach(emoticons, id: \.self) { emoticon in
                    Button(action: {
                        selectedEmoticon = emoticon
                        dismiss()
                    }) {
                        Text(emoticon)
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            .background(Circle().foregroundStyle(.blue.opacity(0.2)))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()

            StrokeButtonView<Any>(text: "Canel", type: TypeButton.cancel) {
                _ in
                dismiss()
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var selectedEmoticon: String = "😎"
    
    EmoticonPicker(emoticons:["😀", "😂", "🥳", "😎", "🤔", "❤️", "🔥"] , selectedEmoticon: $selectedEmoticon)
}
