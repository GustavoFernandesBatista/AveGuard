
import SwiftUI

struct SafeView: View {
    @State private var opacity: Double = 0
    @State private var backgroundColor = Color.white
    
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
     
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("safeImage")
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
                            Text("It seems that this little bird is not in danger of extinction, but how about we let it go free? Birds were made to fly.")
                            
                                .font(.custom("Alegreya", fixedSize: 35))
                                .foregroundColor(Color(UIColor.black))
                                .multilineTextAlignment(.center)    
                                .padding()
                        )
                        .opacity(opacity) 
                        .onAppear { 
                            withAnimation(.easeIn(duration: 1)) {
                                opacity = 1
                            }
                        }
                    NavigationLink(destination: CameraView(classifier: ImageClassifier(modelHandler: ModelHandler()))){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Back")
                                .font(.custom("Alegreya", fixedSize: 30))
                                .foregroundColor(.white)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 20)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(.top, 50)
                        }     
                        
                    }
                    Spacer()
                }
                
                .padding()
                
                
            }

        .navigationViewStyle(.stack)
        
    }
}
