import SwiftUI


struct HomeView: View {
    @State private var opacity: Double = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.85, green: 0.85, blue: 0.85), Color(red: 0.30, green: 0.47, blue: 1.00), Color(red: 0.00, green: 0.50, blue: 0.25)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 100) {
                Image("logoImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 150)
                    .padding(.top , 100)
                HStack{
                    
                    Rectangle()
                        .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                        .shadow(radius: 5)
                        .frame(maxWidth: 900, maxHeight: 300)
                        .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                        .padding()
                        .overlay(
                            Text("Once upon a time, there was a very special little bird named Grazi. He was one of the last of his species, and their population had decreased drastically over the years. Grazi lived in a dense forest, but deforestation and pollution had made his habitat smaller and more degraded.")
                                .font(.custom("Alegreya", fixedSize: 30))
                                .foregroundColor(Color(UIColor.gray))
                                .multilineTextAlignment(.center)
                                .padding()
                        )
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                opacity = 1
                            }
                        }
                    
                    Image("birdImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 240, height: 410)
                        .padding()
                }
                NavigationLink(destination: LongingView()) {
                    Text("Meet Grazi")
                        .font(.custom("Alegreya", fixedSize: 30))
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                Spacer()
            }
            .padding()
            
        }
        .navigationViewStyle(.stack)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


