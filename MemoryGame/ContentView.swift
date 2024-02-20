//
//  ContentView.swift
//  MemoryGame
//
//  Created by Joao Leal on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65))]
    
    @State var cardCount: Int = 4
    let emojis: [String] = ["👻", "👽", "👾", "🤡", "👺", "💀", "🎃", "🕷️","💊"]
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
                Spacer()
                cardCountAdjusters
            }
            .preferredColorScheme(.dark)
            .padding()
        }
    
    func cardAdjuster (offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
            }, label: {
                Image(systemName: symbol)
            }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            CardRemover
            Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    
    var cards: some View{
        LazyVGrid(columns: columns){
            
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)          }} .foregroundStyle(.orange)
    }
    
    
    var CardAdder: some View {
        return cardAdjuster(offset: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var CardRemover: some View {
        return cardAdjuster(offset: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
}
struct CardView: View {
    
    @State var isFaceUp = true
    let content: String
    
    var body: some View {
        ZStack{
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content )
                    .font(.largeTitle)
            
            }
            .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }}
#Preview {

    ContentView()
}
