import SwiftUI
import CoreML
import Combine

class ModelHandler: ObservableObject {
    @Published var model: MLModel?
    
    init() {
        loadModel()
    }
    
    func loadModel() {
        if let resPath = Bundle.main.url(forResource: "BirdExtinction", withExtension: "mlmodel") {
            do {
                let compiledModelURL = try MLModel.compileModel(at: resPath)
                let compiledModel = try MLModel(contentsOf: compiledModelURL)
                self.model = compiledModel
            } catch {
                print("Error compiling/loading the model: \(error.localizedDescription)")
            }
        } else {
            print("Error finding the model file.")
        }
    }

}
