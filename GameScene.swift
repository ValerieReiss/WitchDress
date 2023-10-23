//
//  GameScene.swift
//  TarotDay
//
//  Created by Valerie on 21.06.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let backgroundImage = SKSpriteNode(imageNamed: "bgLoader.png")
    private var magicStick : SKEmitterNode?
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    override func didMove(to view: SKView) {
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        backgroundImage.anchorPoint = CGPointMake(0.5, 0.5)
        backgroundImage.name = "Game"
        backgroundImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundImage.zPosition = 10
        backgroundImage.isUserInteractionEnabled = false
        addChild(backgroundImage)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
                    startTouch = touch.location(in:self)
                }
            guard var touch = touches.first else {return}
            touch = (touches.first as UITouch?)!
            let location = touch.location(in: self)
            let node = atPoint(location)
            
        if node.name == "Game" {
            self.view?.presentScene(Menu(size: self.size),
                                    transition: .crossFade(withDuration: 2))
            run("sound-button")
        }
    
        if let n = self.magicStick?.copy() as! SKEmitterNode? {
            n.position = location
            self.addChild(n)
        }
    }
    
    func run(_ fileName: String){
            run(SKAction.repeat((SKAction.playSoundFileNamed(fileName, waitForCompletion: true)), count: 1))
        }
}
