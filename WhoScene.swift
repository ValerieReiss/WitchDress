//
//  WhoScene.swift
//  TarotDay
//
//  Created by Valerie on 03.07.23.
//

import SpriteKit
import GameplayKit


// WürfelScene Wicca

class WhoScene: SKScene {
    var state : Int = 0
    
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    
    let backgroundImage = SKSpriteNode()
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    private var magicStick : SKEmitterNode?
    
    var bubble1 = SKSpriteNode()
    var bubble2 = SKSpriteNode()
    var bubble3 = SKSpriteNode()
    var bubbleArray : [String] = []
    
    var labelTitle = SKLabelNode()
    var labelMeaning1 = SKLabelNode()
    var labelMeaning2 = SKLabelNode()
    var labelPlay = SKLabelNode()
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 1290, height: 2000), cornerRadius: 30.0)
    
    var randomIndex: Int = 0
    
    override func didMove(to view: SKView) {
    
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        let backgroundImage = SKSpriteNode(imageNamed: "bg-whois")
        backgroundImage.name = "Drehrad"
        backgroundImage.anchorPoint = CGPointMake(0.5, 0.5)
        backgroundImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundImage.zPosition = -2
        backgroundImage.isUserInteractionEnabled = false
        addChild(backgroundImage)
        
        bubbleArray = ["bubble-blue", "bubble-pink", "bubble-lilac"]
        bubble1 = SKSpriteNode(imageNamed: bubbleArray[0])
        bubble1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble1.setScale(0.35)
        bubble1.zPosition = 2
        bubble1.position = CGPoint(x: self.frame.midX - 280, y: self.frame.midY + 100)
        addChild(bubble1)
        bubble2 = SKSpriteNode(imageNamed: bubbleArray[1])
        bubble2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble2.setScale(0.35)
        bubble2.zPosition = 2
        bubble2.position = CGPoint(x: self.frame.midX - 280, y: self.frame.midY + 100)
        addChild(bubble2)
        bubble3 = SKSpriteNode(imageNamed: bubbleArray[2])
        bubble3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble3.setScale(0.35)
        bubble3.zPosition = 2
        bubble3.position = CGPoint(x: self.frame.midX - 280, y: self.frame.midY + 100)
        addChild(bubble3)
        
        let fadeIn = SKAction.fadeIn(withDuration: 3.0)
        let fadeOut = SKAction.fadeOut(withDuration: 3.0)
        let sequence = SKAction.sequence([fadeIn, fadeOut])
        let redo = SKAction.repeatForever(sequence)
        bubble1.run(redo)
                
        let fadeIn2 = SKAction.fadeIn(withDuration: 4.0)
        let fadeOut2 = SKAction.fadeOut(withDuration: 4.0)
        let sequence2 = SKAction.sequence([fadeIn2, fadeOut2])
        let redo2 = SKAction.repeatForever(sequence2)
        bubble2.run(redo2)
                
        let fadeIn3 = SKAction.fadeIn(withDuration: 5.0)
        let fadeOut3 = SKAction.fadeOut(withDuration: 5.0)
        let sequence3 = SKAction.sequence([fadeIn3, fadeOut3])
        let redo3 = SKAction.repeatForever(sequence3)
        bubble3.run(redo3)
                
        if let bubbles = SKEmitterNode(fileNamed: "Bubbles"){
            bubbles.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
            bubbles.advanceSimulationTime(10)
            bubbles.zPosition = 5
            addChild(bubbles)
        }
        
        labelPlay.fontSize = 100
        labelPlay.zPosition = 2
        labelPlay.color = .white
        labelPlay.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 700)
        labelPlay.text = "made by Valerie"
        addChild(labelPlay)
        
        buttonRect.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 200)
        buttonRect.strokeColor = .init(white: 0.0, alpha: 1.0)
        buttonRect.name = "buttonRect"
        buttonRect.zPosition = 2
        addChild(buttonRect)
        
        menu.name = "Menu"
        menu.zPosition = 5
        menu.physicsBody = SKPhysicsBody(texture: menu.texture!, size: menu.texture!.size())
        menu.texture = SKTexture(imageNamed: "button-bottle")
        menu.physicsBody?.affectedByGravity = false
        menu.physicsBody?.isDynamic = false
        menu.physicsBody?.allowsRotation = true
        menu.position = CGPoint(x: self.frame.minX + 650, y: self.frame.minY + 400)
        menu.setScale(1)
        self.addChild(menu)
        let mi = SKAction.rotate(byAngle: -0.2, duration: 0.1)
        let ma = SKAction.rotate(byAngle: 0.2, duration: 0.1)
        let mu = SKAction.wait(forDuration: 7.0)
        let sequ = SKAction.sequence([ma, mi, ma, mi, mu])
        menu.run(SKAction.repeatForever(sequ))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
                    startTouch = touch.location(in:self)
                }
            guard var touch = touches.first else {return}
            touch = (touches.first as UITouch?)!
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if node.name == "buttonRect" {
               
                
                
            }
            if node.name == "Menu" {
                self.view?.presentScene(GameScene(size: self.size),
                                transition: .crossFade(withDuration: 3))
                run("sound-button")
            } else if node.name != "Menu" {
                print ("fail")
            }
        
            if let n = self.magicStick?.copy() as! SKEmitterNode? {
                n.position = location
                self.addChild(n)
            }
    }
   
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            endTouch = touch.location(in:self)
        }
        guard var touch = touches.first else {return}
        touch = (touches.first as UITouch?)!
        let location = touch.location(in:self)
        if let n = self.magicStick?.copy() as! SKEmitterNode? {
            n.position = location
            self.addChild(n)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
   
    func run(_ fileName: String){
            run(SKAction.repeat((SKAction.playSoundFileNamed(fileName, waitForCompletion: true)), count: 1))
        }
    
}
