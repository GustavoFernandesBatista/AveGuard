
import SwiftUI
import CoreML
import Vision

class ImageClassifier: ObservableObject {
    @Published var topResultIdentifier: String?
    @Published var topResultConfidence: Float?
    private var modelHandler: ModelHandler
    
    init(modelHandler: ModelHandler) {
        self.modelHandler = modelHandler
    }
    
    // MARK: Intent(s)
    func detect(image: UIImage) {
        guard let model = modelHandler.model, let ciImage = CIImage(image: image) else { return }
        let requestHandler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        let request = VNCoreMLRequest(model: try! VNCoreMLModel(for: model)) { request, error in
            if let results = request.results as? [VNClassificationObservation], let topResult = results.first {
                    self.topResultIdentifier = topResult.identifier
                    self.topResultConfidence = topResult.confidence
              
            }
        }
        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing classification: \(error.localizedDescription)")
        }
    }
}

