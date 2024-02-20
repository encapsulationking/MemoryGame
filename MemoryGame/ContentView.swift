//
//  ContentView.swift
//  MemoryGame
//
//  Created by Joao Leal on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
        CardView()
            CardView()
            CardView()
            CardView()
            
            }
        .preferredColorScheme(.dark)
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp{
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }} else {
                RoundedRectangle(cornerRadius: 12)
            }
    }
}
#Preview {

    ContentView()
}
