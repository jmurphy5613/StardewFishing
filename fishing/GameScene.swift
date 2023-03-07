//
//  GameScene.swift
//  fishing
//
//  Created by John Murphy on 3/6/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var fish = SKSpriteNode()
    private var bar = SKSpriteNode()
    
    private var lastChange = 0.0
    
    var isTouching = false
    
    override func didMove(to view: SKView) {
        
        fish = childNode(withName: "fish") as! SKSpriteNode
        let fishTexture = SKTexture(imageNamed: "fishTexture")
        fish.texture = fishTexture
        
        bar = childNode(withName: "bar") as! SKSpriteNode
        bar.size = CGSize(width: fish.frame.width, height: fish.frame.height*2)
        bar.color = .green
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bar.physicsBody?.velocity.dy = 100
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        bar.physicsBody?.velocity.dy = -100
    }
    
    override func update(_ currentTime: TimeInterval) {
        if abs(lastChange - currentTime) >= 3 {
            fish.physicsBody?.velocity.dy = CGFloat(Int.random(in: -100..<100))
            lastChange = currentTime
        }
    }

}
