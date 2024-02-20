//
//  ContentView.swift
//  MemoryGame
//
//  Created by Joao Leal on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👻", "👽", "👾", "🤡", "👺", "💀", "🎃", "🕷️","💊"].shuffled()
    
    var body: some View {
        HStack{
            
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
            }
            }
        .preferredColorScheme(.dark)
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView: View {
    
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        ZStack{
            var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content )
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }}
#Preview {

    ContentView()
}
