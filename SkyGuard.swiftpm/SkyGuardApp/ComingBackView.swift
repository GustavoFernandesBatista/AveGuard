
import SwiftUI

struct ComingBackView: View {
    @State private var opacity: Double = 0
    
    var body: some View {

            ZStack {
                Image("sunBirds")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Coming Back.")
                        .font(.custom("Helvetica", fixedSize: 55))
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                        .padding(.bottom, 100)
                    Rectangle()
                        .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                        .shadow(radius: 5)
                        .frame(maxWidth: 800, maxHeight: 400)
                        .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                        .overlay(
                            Text("Over time, Grazi and his friends were able to increase their population. They also became a symbol of the importance of preserving nature and the need to protect endangered species. People began to pay more attention to the destruction of the environment and to work together to protect it.")
                            
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
                    NavigationLink(destination: IdeaView()) {
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
