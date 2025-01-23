import CreateML
import CreateMLComponents
import SwiftUI


// Specify the location of the images, where each folder represents a category
let trainingData = MLImageClassifier.DataSource.labeledDirectories(at: URL(fileURLWithPath: "'/Users/prajotawale/Desktop/Training Data'"))

// Train the model
let imageClassifier = try MLImageClassifier(trainingData: trainingData)





