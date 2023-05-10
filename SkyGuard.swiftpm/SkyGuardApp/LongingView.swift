import SwiftUI

struct LongingView: View {
    @State private var opacity: Double = 0
    
    var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.1), Color(red: 1.0, green: 0.5, blue: 0.0), Color(red: 0.0, green: 0.8, blue: 0.4)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("The Longing")
                        .font(.custom("Helvetica", fixedSize: 55))
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                            .shadow(radius: 5)
                            .frame(maxWidth: 800, maxHeight: 400)
                            .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                            .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                            .overlay(
                                Text("One day, Grazi noticed that his bird friends were no longer around. He began to miss their beautiful songs and their swooping flights. Realizing that something was wrong, Grazi decided to fly in search of his friends. He flew over the entire forest and found only a few of his kind, all in different and distant areas.")
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
                            .padding()
                        VStack{
                            Image("flyingImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .padding(.leading, 105)
                            Image("flyingImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .padding(.leading, 15)
                        }
                        
                        
                     
                    }
                    NavigationLink(destination: FearView()) {
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

