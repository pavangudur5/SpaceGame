//
//  GameScene.swift
//  SpaceGame
//
//  Created by Pavan Gudur on 5/14/18.
//  Copyright © 2018 Pavan Kumar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    
    var scoreLabel : SKLabelNode!
    var score:Int = 0 {
        didSet {
            scoreLabel.text = "Score \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
       
        starfield = SKEmitterNode(fileNamed: "Starfield.sks");
        starfield.position = CGPoint(x: 0, y: 1472)
        starfield.advanceSimulationTime(10)
        self.addChild(starfield)

        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "shuttle")
        
        player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2 + 20)
        
        self.addChild(player)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
        
        scoreLabel = SKLabelNode(text: "Score: 0")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
