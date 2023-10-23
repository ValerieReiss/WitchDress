//
//  GameScene1.swift
//  TarotDay
//
//  Created by Valerie on 21.06.23.
//

import SpriteKit
import GameplayKit

// Yes or No Fragen!!!

class GameScene1: SKScene {
    var played : Int = 0
    
    var bird = SKSpriteNode(imageNamed: "bird-left")
    var medicine = SKSpriteNode(imageNamed: "medicine")
    
    let backgroundImage = SKSpriteNode(imageNamed: "bg-moons")
    let coinYesNo = SKSpriteNode(imageNamed: "coin-yesno")
    var labelPlay = SKLabelNode()
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 650, height: 250), cornerRadius: 30.0)
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    private var magicStick : SKEmitterNode?
    
    var coin = SKSpriteNode(imageNamed: "coinArray[Int]")
    var coinChosen = SKSpriteNode(imageNamed: "coinArray[Int]")
    
    var randomIndexCoin: Int = 0
    var labelCoin = SKLabelNode()
    var coinArray : [String] = []
    
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    
    override func didMove(to view: SKView) {
    
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        backgroundImage.anchorPoint = CGPointMake(0.5, 0.5)
        backgroundImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundImage.zPosition = -2
        addChild(backgroundImage)
        
        coinYesNo.anchorPoint = CGPointMake(0.5, 0.5)
        coinYesNo.size = CGSize(width: 1000, height: 250 )
        coinYesNo.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 700)
        coinYesNo.zPosition = 1
        addChild(coinYesNo)
        
        if randomIndexCoin == 0
                {
                    coinArray = ["coin-yes", "coin-no"]
                }
        let texture1 = SKTexture(imageNamed: coinArray[0])
        let texture2 = SKTexture(imageNamed: coinArray[1])
        let animation = SKAction.animate(with: [texture1, texture2], timePerFrame: 0.2)
        let makeCoinAnimation = SKAction.repeatForever(animation)
        coin = SKSpriteNode(texture: texture1)
        coin.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        coin.physicsBody = SKPhysicsBody(texture: coin.texture!, size: coin.texture!.size())
        coin.texture = SKTexture(imageNamed: "\(coinArray[randomIndexCoin])")
        coin.physicsBody?.affectedByGravity = false
        coin.physicsBody?.isDynamic = false
        coin.physicsBody?.allowsRotation = true
        coin.run(makeCoinAnimation)
        coin.setScale(1.05)
        coin.zPosition = 5
        
        coinChosen = SKSpriteNode(imageNamed: coinArray[randomIndexCoin])
        coinChosen.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        coinChosen.setScale(1)
        coinChosen.zPosition = 3
        coinChosen.alpha = 0.0
        
        labelPlay = SKLabelNode(fontNamed: "Bradley Hand")
        labelPlay.fontSize = 120
        labelPlay.zPosition = 2
        labelPlay.color = .yellow
        labelPlay.position = CGPoint(x: self.frame.midX, y: self.frame.midY )
        labelPlay.text = " PLAY "
        addChild(labelPlay)
        
        buttonRect.position = CGPoint(x: self.frame.midX , y: self.frame.midY )
        buttonRect.strokeColor = .init(white: 1.0, alpha: 1.0)
        buttonRect.fillColor = .init(white: 1.0, alpha: 0.2)
        buttonRect.name = "buttonRect"
        buttonRect.zPosition = 20
        addChild(buttonRect)
        
        menu.name = "Menu"
        menu.zPosition = 10
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
        
        bird.name = "bird"
        bird.zPosition = 5
        bird.physicsBody = SKPhysicsBody(texture: bird.texture!, size: bird.texture!.size())
        bird.texture = SKTexture(imageNamed: "bird-left")
        let textureCat1 = SKTexture(imageNamed: "bird-left")
        let textureCat2 = SKTexture(imageNamed: "bird-right")
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = false
        bird.physicsBody?.allowsRotation = true
        bird.position = CGPoint(x: self.frame.minX + 900, y: self.frame.minY + 400)
        bird.setScale(1)
        self.addChild(bird)
        let tex = SKAction.animate(with: [textureCat2, textureCat1], timePerFrame: 1.0)
        let wait = SKAction.wait(forDuration: 4.0)
        let seq = SKAction.sequence([tex, wait])
        bird.run(SKAction.repeatForever(seq))
        
        medicine.name = "medicine"
        medicine.zPosition = 5
        medicine.physicsBody = SKPhysicsBody(texture: medicine.texture!, size: medicine.texture!.size())
        medicine.texture = SKTexture(imageNamed: "medicine")
        medicine.physicsBody?.affectedByGravity = false
        medicine.physicsBody?.isDynamic = false
        medicine.physicsBody?.allowsRotation = true
        medicine.position = CGPoint(x: self.frame.minX + 350, y: self.frame.minY + 400)
        medicine.setScale(1)
        self.addChild(medicine)
        let animate = SKAction.rotate(byAngle: -0.4, duration: 0.1)
        let animate1 = SKAction.rotate(byAngle: 0.4, duration: 0.1)
        let wait1 = SKAction.wait(forDuration: 8.0)
        let gogirls = SKAction.sequence([wait1, animate, animate1, animate, animate1])
        medicine.run(SKAction.repeatForever(gogirls))
        
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
                if played == 0 {
                    played = 1
                    let fadeOut = SKAction.fadeOut(withDuration: 2.0)
                    buttonRect.run(fadeOut)
                    labelPlay.run(fadeOut)
                    //make decision
                    randomIndexCoin = Int(arc4random_uniform(2))
                    
                    //coin animation
                    addChild(coin)
                    let drehlinks = SKAction.rotate(byAngle: -0.1, duration: 0.2)
                    let drehrechts = SKAction.rotate(byAngle: 0.1, duration: 0.2)
                    let over = SKAction.removeFromParent()
                    
                    let seq = SKAction.sequence([drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, drehrechts, drehlinks, over])
                    coin.run(SKAction.repeat(seq, count: 1))
                    
                    let fadeIn = SKAction.fadeIn(withDuration: 8.0)
                    coinChosen.texture = SKTexture(imageNamed: coinArray[randomIndexCoin])
                    print("karte: \(randomIndexCoin)")
                    addChild(coinChosen)
                    coinChosen.run(fadeIn)
                    run("sound-button")
                } else { return }
            }
            if node.name == "coinChosen" {
                //reveal meaning
                print("reveal meaning")
            }
            if node.name == "Menu" {
               
                let links = SKAction.rotate(byAngle: 5.5, duration: 0.1)
                let rechts = SKAction.rotate(byAngle: -5.5, duration: 0.1)
                let wackel = SKAction.sequence([links, rechts, links, rechts, links, rechts, links, rechts, ])
                menu.run(wackel)
                run("sound-button")
                self.view?.presentScene(Menu(size: self.size),
                                    transition: .crossFade(withDuration: 5))
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
