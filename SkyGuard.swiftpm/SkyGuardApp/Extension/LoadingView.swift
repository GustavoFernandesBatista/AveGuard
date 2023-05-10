import SwiftUI

struct LoadingView: View {
    let isLoading: Bool
    let text: String
    
    var body: some View {
        ZStack {
            if isLoading {
                  Color.clear
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    
                    Text(text)
                        .font(.headline)
                }
                .padding(16)
                .background(Color.gray)
                .cornerRadius(16)
                .shadow(radius: 8)
            }
        }
    }
}
