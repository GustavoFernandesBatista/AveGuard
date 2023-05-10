
import SwiftUI

struct CreateView: View {
    @State private var opacity: Double = 0
    
    var body: some View {

            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1), Color(red: 0.7, green: 0.7, blue: 0.7)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("createImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 180)
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color(hue: 0.0, saturation: 0.05, brightness: 0.9, opacity: 1.0))
                        .shadow(radius: 5)
                        .frame(maxWidth: 800, maxHeight: 250)
                        .mask (RoundedRectangle (cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity (0.2), radius: 20, x: 0, y: 40)
                        .overlay(
                            Text("And with that, I created SkyGuard so that you can take a photo or upload a picture of the bird you find and discover if it is endangered or not. If it is, we will provide you with a step-by-step guide to help this animal.")
                            
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
                    NavigationLink(destination:  CameraView(classifier: ImageClassifier(modelHandler: ModelHandler()))) {
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
