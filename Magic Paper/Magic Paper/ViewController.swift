//
//  ViewController.swift
//  Magic Paper
//
//  Created by Prajot Awale on 09/01/25.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "New Paper Image", bundle: Bundle.main){
            
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 1
            print("Image Successfully Added")
        }
            

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let videoNode = SKVideoNode(fileNamed: "HarryPotter.mp4")
            
            videoNode.play()
            
            let videoScene = SKScene(size: CGSize(width: 480, height: 720))
            
            videoNode.position = CGPoint(x: videoScene.size.width / 2 , y: videoScene.size.height / 2)
            videoNode.yScale = -1.0
            
            videoScene.addChild(videoNode)
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = videoScene
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            
            
            node.addChildNode(planeNode)
        }
     
        return node
    }

    
}
