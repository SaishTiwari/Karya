import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    @State var size: CGFloat = 1.0
    @State var color: Color = .blue
    
    var body: some View {
        VStack(spacing: -10) {
            Spacer()
            
            
            Text("No Tasks Yet!")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
            
            
            
            Text("""
            Tap the add button in the top right corner and get inspired:
                •    Explore a new hobby
                •    Dive into a good book
                •    Reconnect with someone special
                •    Get moving with a fun workout
                •    Plan an exciting outing
            """)
            .padding()
            .multilineTextAlignment(.leading)
            
            NavigationLink(destination: AddNew(), label: {
                Text("Add Something ✍️")
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(color)
                    .cornerRadius(10)
                    .padding()
                    .padding(.vertical,15)
                    .foregroundColor(.white)
                    .scaleEffect(size)
                    .onAppear(perform: addAnimation)
            })
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
       
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}

extension NoItemsView {
    func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                animate.toggle()
                size = animate ? 1.11 : 1.0
                color = animate ? .red : .blue
            }
        }
    }
}
