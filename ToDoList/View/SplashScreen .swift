import SwiftUI

struct SplashScreen: View {
    @State private var text = ""
    let fullText = "KARYA"
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Animated Text
            Text(text)
                .font(.system(size: 75))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
                .multilineTextAlignment(.center)
                .lineLimit(0)
                .shadow(color: .black.opacity(0.9), radius: 10, x: 5, y: 5)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).delay(2)) {
                        typeWriter()
                    }
                }
        }
    }
    
    func typeWriter() {
        var index = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if index < fullText.count {
                let endIndex = fullText.index(fullText.startIndex, offsetBy: index + 1)
                text = String(fullText[..<endIndex])
                index += 1
            } else {
                timer.invalidate()
            }
        }
        RunLoop.current.add(timer, forMode: .common)
    }
}

#Preview {
    SplashScreen()
}
