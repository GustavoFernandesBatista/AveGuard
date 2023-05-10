
import SwiftUI

struct FearView: View {
    @State private var opacity: Double = 0
    
    var body: some View {
            ZStack {
                Image("fireTree")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                   
                        Text("The Fear")
                        .font(.custom("Helvetica", fixedSize: 55))
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                        
                
                   
                        Rectangle()
                            .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                            .shadow(radius: 5)
                            .frame(maxWidth: 800, maxHeight: 400)
                            .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                            .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                            .overlay(
                                Text("When Grazi realized that his species was in danger, he decided to take action. He began flying from one forest to another, calling his friends to join him. Together, they formed a large group, which increased their chances of survival. They also learned to adapt to new environments and feed on other sources of food.")
                                
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
                    NavigationLink(destination: ComingBackView()){
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

