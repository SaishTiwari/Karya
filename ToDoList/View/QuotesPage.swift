import SwiftUI

struct QuotesPage: View {
    @State private var currentQuoteIndex = Int.random(in: 0...49)
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
        "The difference between ordinary and extraordinary is that little extra.",
        "Believe in the magic of new beginnings.",
        "The only limit is your mind.",
        "Push through the pain and you’ll reach new heights.",
        "Dream big, work hard, stay focused.",
        "Challenges are what make life interesting.",
        "The best time for new beginnings is now.",
        "Turn your dreams into plans.",
        "Embrace the journey, not just the destination.",
        "Your future is created by what you do today, not tomorrow.",
        "Be a voice, not an echo.",
        "Success is the result of preparation, hard work, and learning from failure.",
        "You are the artist of your own life. Don’t hand the paintbrush to anyone else."
    ]
    
    private let timer = Timer.publish(every: 3600, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "quote.opening")
                        .resizable()
                        .frame(width: 30, height: 20)
                    
                    Spacer()
                }
                .padding()
                
                ZStack {
                    Text(quotes[currentQuoteIndex])
                        .font(.custom("SnellRoundhand", size: 50))
                        .multilineTextAlignment(.center)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1), value: animate)
                        .padding()
                }
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "quote.closing")
                        .resizable()
                        .frame(width: 30, height: 20)
                }
                .padding()
                Spacer()
                
                Text("Tap for More").padding()
                    .onTapGesture {
                        changeQuote()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer) { _ in
                withAnimation {
                    animate.toggle()
                    currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
                }
            }
            .navigationTitle("Thought of the day")
        }
    }
}

#Preview {
    QuotesPage()
}

extension QuotesPage {
    func changeQuote() {
        withAnimation {
            currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
        }
    }
}
