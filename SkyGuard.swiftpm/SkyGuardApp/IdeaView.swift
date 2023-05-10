
import SwiftUI

struct IdeaView: View {
    @State private var opacity: Double = 0
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1), Color(red: 0.7, green: 0.7, blue: 0.7)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("ideaImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 180)
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                        .shadow(radius: 5)
                        .frame(maxWidth: 800, maxHeight: 200)
                        .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                        .overlay(
                            Text("That Grazi and his friends' story got me thinking about an idea that could help animals endangered of extinction every day. So, I went straight to putting my idea into Xcode.")
                            
                                .font(.custom("Alegreya", fixedSize: 35))
                                .foregroundColor(Color(UIColor.gray))
                                .multilineTextAlignment(.center)
                                .padding()
                        )
                        .opacity(opacity) 
                        .onAppear { 
                            withAnimation(.easeIn(duration: 1)) {
                                opacity = 1
                            }
                        }

                    NavigationLink(destination: CreateView()){
                        Text("Next")
                            .font(.custom("Alegreya", fixedSize: 30))
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.top, 50)
                    }
                        Spacer()
                    
                }
                .padding()
                
                
            }
        .navigationViewStyle(.stack)
        
    }
}
