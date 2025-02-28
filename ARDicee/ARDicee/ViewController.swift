//  ViewController.swift
//  ARDicee
//
//  Created by Prajot Awale on 11/11/24.

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var diceArray = [SCNNode]()

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        // Set the view's delegate
        sceneView.delegate = self
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIColor.red
        
        cube.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(0, 0.1, -0.5)
        
        node.geometry = cube
        
        sceneView.scene.rootNode.addChildNode(node)
        
          sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true){
            diceNode.position = SCNVector3(0, 0, -0.1)
           sceneView.scene.rootNode.addChildNode(diceNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        configuration.planeDetection = .horizontal
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//                let touchLocation = touch.location(in: sceneView)
//                
//                // Create a raycast query
//                if let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneGeometry, alignment: .horizontal) {
//                    // Perform the raycast
//                    let results = sceneView.session.raycast(query)
//                    
//                    if let result = results.first {
//                        let position = SCNVector3(
//                            result.worldTransform.columns.3.x,
//                            result.worldTransform.columns.3.y,
//                            result.worldTransform.columns.3.z
//                        )
//                        print("Touched a plane at position: \(position)")
//                        // Handle interaction here (e.g., place a 3D object at the position)
//                    } else {
//                        print("Touched somewhere else (no plane detected)")
//                    }
//                } else {
//                    print("Raycast query could not be created")
//                }
//            }
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            
            let result = sceneView.hitTest(touchLocation, with: .existingPlaneUsingExtent)
            
            if let hitResult = result.first {
                
                let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                
                if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    
                diceNode.position = SCNVector3(
                        x:hitResult.worldTransform.columns.3.x,
                        y:hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                        z:hitResult.worldTransform.columns.3.z
                        )
                    
                diceArray.append(diceNode)
                    
                sceneView.scene.rootNode.addChildNode(diceNode)
                    
                    roll(dice: diceNode)
                    
                    
                    
                }
                
            }
        }
    }
    
    func rollAll() {
        if !diceArray.isEmpty {
            for dice in diceArray{
                roll(dice: dice)
            }
            
        }
    }
    
    func roll(dice: SCNNode) {
        let randomX = Float( arc4random_uniform(4) + 1) * (Float.pi/2)
        
        let randomZ = Float( arc4random_uniform(4) + 1) * (Float.pi/2)
        
        dice.runAction(
            
            SCNAction.rotateBy(x: CGFloat(randomX * 5),
                               y: 0,
                               z: CGFloat(randomZ * 5),
                               duration: 0.5)
        )
    }
    
    
    
    @IBAction func rollAgain(_ sender: UIBarButtonItem) {
        
        rollAll()
        
    }
    
    
    @IBAction func removeAllDicee(_ sender: UIBarButtonItem) {
        
        if diceArray.isEmpty {
            for dice in diceArray {
                dice.removeFromParentNode()
            }
        }
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        rollAll()
        
    }
    func renderer(_ renderer: any SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let planeNode = SCNNode()
            
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
            
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            
            let gridMaterial = SCNMaterial()
            
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/Grid.png")
            
            plane.materials = [gridMaterial]
            
            planeNode.geometry = plane
            
            node.addChildNode(planeNode)
            
        }else{
            return
        }
    }


}
