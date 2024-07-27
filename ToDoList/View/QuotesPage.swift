//
//  QuotesPage.swift
//  ToDoList
//
//  Created by Saish Tiwari on 27/07/2024.
//

import SwiftUI

struct QuotesPage: View {
    @State private var currentQuoteIndex = 0
    @State private var animate = false
    
    private let quotes: [String] = [
        "The secret of getting ahead is getting started.",
        "It's not the load that breaks you down, it's the way you carry it.",
        "The way to get started is to quit talking and begin doing.",
        "Do not wait to strike till the iron is hot; but make it hot by striking.",
        "The future depends on what you do today.",
        "Dream big and dare to fail.",
        "It always seems impossible until it's done.",
        "The harder you work for something, the greater you’ll feel when you achieve it.",
        "Don’t watch the clock; do what it does. Keep going.",
        "The key to success is to start before you are ready.",
        "Believe you can and you're halfway there.",
        "You don’t have to be great to start, but you have to start to be great.",
        "Don’t wish it were easier. Wish you were better.",
        "Success is the sum of small efforts, repeated day in and day out.",
        "Don’t count the days, make the days count.",
        "Start where you are. Use what you have. Do what you can.",
        "Little by little, one travels far.",
        "If you get tired, learn to rest, not to quit.",
        "The only limit to our realization of tomorrow is our doubts of today.",
        "Act as if what you do makes a difference. It does.",
        "The more I want to get something done, the less I call it work.",
        "The only way to do great work is to love what you do.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The only place where success comes before work is in the dictionary.",
        "What we fear of doing most is usually what we most need to do.",
        "Don’t stop when you’re tired. Stop when you’re done.",
        "The best way to predict the future is to invent it.",
        "If you’re going through hell, keep going.",
        "Believe in yourself and all that you are.",
        "You are never too old to set another goal or to dream a new dream.",
        "Keep going. Everything you need will come to you at the perfect time.",
        "The only way to achieve the impossible is to believe it is possible.",
        "If it’s important to you, you’ll find a way. If not, you’ll find an excuse.",
        "Your limitation—it’s only your imagination.",
        "Push yourself, because no one else is going to do it for you.",
        "Great things never come from comfort zones.",
        "Dream it. Wish it. Do it.",
        "Success doesn’t just find you. You have to go out and get it.",
        "The harder you work, the luckier you get.",
        "Don’t stop until you’re proud.",
        "Success is what happens after you have survived all your mistakes.",
        "Wake up with determination. Go to bed with satisfaction.",
        "Do something today that your future self will thank you for.",
        "Little things make big days.",
        "It’s going to be hard, but hard does not mean impossible.",
        "Don’t wait for opportunity. Create it.",
        "Sometimes we’re tested not to show our weaknesses, but to discover our strengths.",
        "Success is not for the lazy.",
        "The best way to get something done is to begin.",
        "The difference between ordinary and extraordinary is that little extra."
    ]
    
    private let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect() // 5 hours = 18000 seconds

    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack {
                ForEach(0..<quotes.count, id: \.self) { index in
                    if index == currentQuoteIndex {
                        Text(quotes[index])
                            .font(.largeTitle)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    
                                    .fill(Color.green.opacity(0.2))
                                    
                                
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 1), value: animate)
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onReceive(timer) { _ in
            animate.toggle()
            currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
        }
    }
}

#Preview {
    QuotesPage()
}
