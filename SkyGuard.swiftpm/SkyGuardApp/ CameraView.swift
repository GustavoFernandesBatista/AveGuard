
import SwiftUI


struct CameraView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingAlert = false
    @State var named: String?
    
    @ObservedObject var classifier: ImageClassifier
    
    
    var body: some View {
         
        ZStack{
           LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1), Color(red: 0.7, green: 0.7, blue: 0.7)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            NavigationLink(destination: ScaryView(), isActive: Binding<Bool>(
                get: {$classifier.topResultConfidence.wrappedValue ?? 0 > 0.30 },
                set: { _ in })
            ) {
                EmptyView()
            }
            NavigationLink(destination: SafeView(), isActive: Binding<Bool>(
                get: {$classifier.topResultConfidence.wrappedValue ?? 0 < 0.30 },
                set: { _ in })
            ) {
                EmptyView()
            }
            .hidden()
            VStack{
                Rectangle()
                    .overlay(
                        Group {
                            if uiImage != nil {
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .scaledToFit()
                               

                            }
                        }
                    )
//                VStack{
//                    Button(action: {
//                        if uiImage != nil {
//                        
//                            print($classifier.topResultConfidence.wrappedValue!)
//                            print("\($classifier.topResultIdentifier.wrappedValue ?? "")")
//                            
//                        }
//                    }) {
//                        Text($classifier.topResultIdentifier.wrappedValue ?? "")
//                            .foregroundColor(.black)
//                            .font(.title)
//                    }
//                    
//                }
                HStack{
                    ZStack{
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 75, height: 75)
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 65, height: 65)
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                        .onAppear{
                            self.showingAlert = true
                            uiImage = nil
                        }
                }.padding()
            }
   }
            
            .sheet(isPresented: $isPresenting){
                ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                    .onDisappear{
                        if uiImage != nil {
                            classifier.detect(image: uiImage!)
                            print("passou aqui 1 ")
                            print($classifier.topResultConfidence.wrappedValue!)
                           print("\($classifier.topResultIdentifier.wrappedValue ?? "")")
                        }
                    }
            }
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Welcome!"), message: Text("take a picture of the bird and find out if it is in danger of extinction or not."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

