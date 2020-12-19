//
//  ViewController.swift
//  ARDicee
//
//  Created by Nico Cobelo on 19/12/2020.
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
        
        //Create a box with dimensions
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        //Create a material that is color red
//        let material = SCNMaterial()
//
//        material.diffuse.contents = UIColor.red
//
//        //Assign material to the cube
//        cube.materials = [material]
//
//        //Create a point in 3d space
//        let node = SCNNode()
//         //Gave the node a position
//        node.position = SCNVector3(0, 0.1, -0.5)
//
//        //Assign node an object to display (cube)
//        node.geometry = cube
//
//        //Put the node in the sceneview
//        sceneView.scene.rootNode.addChildNode(node)
        
        //Give lighting to the box
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
