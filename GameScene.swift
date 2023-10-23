//
//  GameScene.swift
//  TarotDay
//
//  Created by Valerie on 21.06.23.
//

import SpriteKit
import GameplayKit

// Menue Scene

class GameScene: SKScene {
    let coin = SKSpriteNode(imageNamed: "coin-star")
    let bottle = SKSpriteNode(imageNamed: "button-bottle")
    let triangle = SKSpriteNode(imageNamed: "triangle")
    let cup = SKSpriteNode(imageNamed: "cup-star")
    
    let buttonHead = SKShapeNode(rect: CGRect(x: -250, y: 0, width: 500, height: 350), cornerRadius: 30.0)
    let buttonCloth = SKShapeNode(rect: CGRect(x: -250, y: -350, width: 500, height: 350), cornerRadius: 30.0)
    let buttonShoe = SKShapeNode(rect: CGRect(x: -250, y: -700, width: 500, height: 350), cornerRadius: 30.0)
    
    let backgroundImage = SKSpriteNode(imageNamed: "bgGameScene.png")
    let button1 = SKSpriteNode(imageNamed: "coin-yes")
    let button2 = SKSpriteNode(imageNamed: "card-backside")
    let button3 = SKSpriteNode(imageNamed: "bubble-lilac")
    let button4 = SKSpriteNode(imageNamed: "circle-wicca")
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    private var magicStick : SKEmitterNode?
    let konfetti = SKEmitterNode(fileNamed: "Konfetti")
    
    var puppet = SKSpriteNode(imageNamed: "puppet")
    var head = SKSpriteNode()
    var cloth = SKSpriteNode()
    var shoe = SKSpriteNode()
    
    var headIndex: Int = 0
    var clothIndex: Int = 0
    var shoeIndex: Int = 0
    var headArray : [String] = ["head0","head1", "head2", "head3", "head4"]
    var clothArray : [String] = ["cloth0","cloth1","cloth2", "cloth3", "cloth4", "cloth5"]
    var shoeArray : [String] = ["shoe0","shoe1", "shoe2", "shoe3", "shoe4", "shoe5"]
    
    let scoreHead = "scoreHead"
    let scoreCloth = "scoreCloth"
    let scoreShoe = "scoreShoe"
    var playerHead = Int()
    var playerCloth = Int()
    var playerShoe = Int()
    
    override func didMove(to view: SKView) {
        
        let userDefaults = UserDefaults.standard
        playerHead = userDefaults.integer(forKey: scoreHead)
        playerCloth = userDefaults.integer(forKey: scoreCloth)
        playerShoe = userDefaults.integer(forKey: scoreShoe)
        userDefaults.synchronize()
        
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
        backgroundImage.isUserInteractionEnabled = false
        addChild(backgroundImage)
      
        if let bubbles = SKEmitterNode(fileNamed: "Starfield"){
            //bubbles.particleAlpha = 0.1
            bubbles.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 430)
            bubbles.advanceSimulationTime(10)
            bubbles.zPosition = 0
            addChild(bubbles)
        }
        
        
        buttonHead.name = "buttonHead"
        self.addChild(buttonHead)
        buttonHead.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 250)
        buttonHead.strokeColor = .init(white: 1.0, alpha: 0.3)
        buttonHead.fillColor = .init(white: 1.0, alpha: 0.1)
        buttonHead.zPosition = 10
        let actionHead = SKAction.setTexture(SKTexture(imageNamed: headArray[playerHead]), resize: true)
        self.head.run(actionHead)
        
        buttonCloth.name = "buttonCloth"
        self.addChild(buttonCloth)
        buttonCloth.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 250)
        buttonCloth.strokeColor = .init(white: 1.0, alpha: 0.3)
        buttonCloth.fillColor = .init(white: 1.0, alpha: 0.1)
        buttonCloth.zPosition = 10
        let actionCloth = SKAction.setTexture(SKTexture(imageNamed: clothArray[playerCloth]), resize: true)
        self.cloth.run(actionCloth)
        
        buttonShoe.name = "buttonShoe"
        self.addChild(buttonShoe)
        buttonShoe.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 250)
        buttonShoe.strokeColor = .init(white: 1.0, alpha: 0.3)
        buttonShoe.fillColor = .init(white: 1.0, alpha: 0.1)
        buttonShoe.zPosition = 10
        let actionShoe = SKAction.setTexture(SKTexture(imageNamed: shoeArray[playerShoe]), resize: true)
        self.shoe.run(actionShoe)
        
        puppet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puppet.setScale(0.8)
        puppet.zPosition = 1
        puppet.position = CGPoint(x: self.frame.midX, y: self.frame.midY )
        addChild(puppet)
        
        headIndex = Int.random(in: 0..<5)
        head.setScale(0.8)
        head.zPosition = 4
        head.position = CGPoint(x: self.frame.midX, y: self.frame.midY )
        addChild(head)
        //let actionHead = SKAction.setTexture(SKTexture(imageNamed: headArray[playerHead]), resize: true)
        self.head.run(actionHead)
        clothIndex = Int.random(in: 0..<6)
        cloth.setScale(0.8)
        cloth.zPosition = 3
        cloth.position = CGPoint(x: self.frame.midX, y: self.frame.midY )
        addChild(cloth)
       // let actionCloth = SKAction.setTexture(SKTexture(imageNamed: clothArray[playerCloth]), resize: true)
        self.cloth.run(actionCloth)
        shoeIndex = Int.random(in: 0..<5)
        shoe.setScale(0.8)
        shoe.zPosition = 2
        shoe.position = CGPoint(x: self.frame.midX, y: self.frame.midY )
        addChild(shoe)
       // let actionShoe = SKAction.setTexture(SKTexture(imageNamed: shoeArray[playerShoe]), resize: true)
        self.shoe.run(actionShoe)
        
        button1.name = "button1"
        button1.physicsBody = SKPhysicsBody(texture: button1.texture!, size: button1.texture!.size())
        button1.texture = SKTexture(imageNamed: "coin-yes")
        button1.physicsBody?.affectedByGravity = false
        button1.physicsBody?.isDynamic = false
        button1.physicsBody?.allowsRotation = true
        self.addChild(button1)
        let li = SKAction.rotate(byAngle: -0.4, duration: 0.05)
        let re = SKAction.rotate(byAngle: 0.4, duration: 0.05)
        let wait = SKAction.wait(forDuration: 10.0)
        let seq = SKAction.sequence([ li, re, li, re, wait])
        button1.run(SKAction.repeatForever(seq))
        button1.position = CGPoint(x: self.frame.minX + 400 , y: self.frame.maxY - 300)
        button1.setScale(0.4)
        button1.zPosition = 1
        button1.alpha = 1
              
        button2.name = "button2"
        button2.physicsBody = SKPhysicsBody(texture: button2.texture!, size: button2.texture!.size())
        button2.texture = SKTexture(imageNamed: "card-backside")
        button2.physicsBody?.affectedByGravity = false
        button2.physicsBody?.isDynamic = false
        button2.physicsBody?.allowsRotation = true
        addChild(button2)
        let rotateleft = SKAction.rotate(byAngle: -3.14666, duration: 0.1)
        //let re = SKAction.rotate(byAngle: 0.4, duration: 0.05)
        let wait0 = SKAction.wait(forDuration: 10.0)
        let sequ0 = SKAction.sequence([ rotateleft, wait0])
        button2.run(SKAction.repeatForever(sequ0))
        button2.position = CGPoint(x: self.frame.maxX - 400, y: self.frame.maxY - 300)
        button2.setScale(0.4)
        button2.zPosition = 1
        button2.alpha = 1
        
        button3.name = "button3"
        button3.position = CGPoint(x: self.frame.maxX - 400 , y: self.frame.minY + 300)
        button3.setScale(0.3)
        button3.zPosition = 1
        addChild(button3)
        button3.alpha = 1
        
        button4.name = "button4"
        button4.physicsBody = SKPhysicsBody(texture: button4.texture!, size: button4.texture!.size())
        button4.texture = SKTexture(imageNamed: "circle-wicca")
        button4.physicsBody?.affectedByGravity = false
        button4.physicsBody?.isDynamic = false
        button4.physicsBody?.allowsRotation = true
        addChild(button4)
        let rotatele = SKAction.rotate(byAngle: -3.14666, duration: 0.1)
        //let re = SKAction.rotate(byAngle: 0.4, duration: 0.05)
        let wait6 = SKAction.wait(forDuration: 10.0)
        let sequ6 = SKAction.sequence([ rotatele, wait6])
        button4.run(SKAction.repeatForever(sequ6))
        button4.position = CGPoint(x: self.frame.minX + 400 , y: self.frame.minY + 300)
        button4.setScale(1.0)
        button4.zPosition = 1
        button4.alpha = 1
        
        coin.name = "coin"
        coin.zPosition = 5
        coin.physicsBody = SKPhysicsBody(texture: coin.texture!, size: coin.texture!.size())
        coin.texture = SKTexture(imageNamed: "coin-star")
        coin.physicsBody?.affectedByGravity = false
        coin.physicsBody?.isDynamic = false
        coin.physicsBody?.allowsRotation = true
        coin.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY - 600)
        coin.setScale(0.6)
        self.addChild(coin)
        let dreh = SKAction.rotate(byAngle: -0.6, duration: 0.1)
        let dreh1 = SKAction.rotate(byAngle: 0.6, duration: 0.1)
        let wait1 = SKAction.wait(forDuration: 20.0)
        let sequence = SKAction.sequence([ dreh, dreh1, dreh, dreh1, wait1])
        coin.run(SKAction.repeatForever(sequence))
        
        bottle.name = "bottle"
        bottle.zPosition = 5
        bottle.physicsBody = SKPhysicsBody(texture: bottle.texture!, size: bottle.texture!.size())
        bottle.texture = SKTexture(imageNamed: "button-bottle")
        bottle.physicsBody?.affectedByGravity = false
        bottle.physicsBody?.isDynamic = false
        bottle.physicsBody?.allowsRotation = true
        bottle.position = CGPoint(x: self.frame.midX - 70, y: self.frame.midY - 600)
        bottle.setScale(0.6)
        self.addChild(bottle)
        let dreh3 = SKAction.rotate(byAngle: -0.6, duration: 0.1)
        let dreh4 = SKAction.rotate(byAngle: 0.6, duration: 0.1)
        let wait3 = SKAction.wait(forDuration: 5.0)
        let sequence1 = SKAction.sequence([ dreh3, dreh4, dreh3, dreh4, wait3])
        bottle.run(SKAction.repeatForever(sequence1))
        
        triangle.name = "triangle"
        triangle.zPosition = 5
        triangle.physicsBody = SKPhysicsBody(texture: triangle.texture!, size: triangle.texture!.size())
        triangle.texture = SKTexture(imageNamed: "triangle")
        triangle.physicsBody?.affectedByGravity = false
        triangle.physicsBody?.isDynamic = false
        triangle.physicsBody?.allowsRotation = true
        triangle.position = CGPoint(x: self.frame.midX + 70, y: self.frame.midY - 570)
        triangle.setScale(0.6)
        self.addChild(triangle)
        let mi = SKAction.rotate(byAngle: -3.6, duration: 1.0)
        let mu = SKAction.wait(forDuration: 15.0)
        let sequ = SKAction.sequence([ mi, mu])
        triangle.run(SKAction.repeatForever(sequ))
        
        cup.name = "cup"
        cup.zPosition = 5
        cup.physicsBody = SKPhysicsBody(texture: cup.texture!, size: cup.texture!.size())
        cup.texture = SKTexture(imageNamed: "cup-star")
        cup.physicsBody?.affectedByGravity = false
        cup.physicsBody?.isDynamic = false
        cup.physicsBody?.allowsRotation = true
        cup.position = CGPoint(x: self.frame.midX + 200, y: self.frame.midY - 600)
        cup.setScale(0.7)
        self.addChild(cup)
        let dreh5 = SKAction.rotate(byAngle: -0.6, duration: 0.1)
        let dreh6 = SKAction.rotate(byAngle: 0.6, duration: 0.1)
        let wait7 = SKAction.wait(forDuration: 8.0)
        let sequence4 = SKAction.sequence([ dreh5, dreh6, dreh5, dreh6, wait7])
        cup.run(SKAction.repeatForever(sequence4))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
                    startTouch = touch.location(in:self)
                }
            guard var touch = touches.first else {return}
            touch = (touches.first as UITouch?)!
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            let fadein = SKAction.fadeIn(withDuration: 0.2)
            let fadeout = SKAction.fadeOut(withDuration: 0.2)

            if node.name == "buttonHead" {
                print("head")
                run("sound-button")
                head.run(fadeout)
                head.run(fadein)
                self.headIndex += 1
                if headIndex == 5{headIndex = 0}
                playerHead = headIndex
                let action = SKAction.setTexture(SKTexture(imageNamed: headArray[headIndex]), resize: true)
                self.head.run(action)
                welchesSpiel()
            }
            if node.name == "buttonCloth" {
                print("cloth")
                run("sound-button")
                cloth.run(fadeout)
                cloth.run(fadein)
                self.clothIndex += 1
                if clothIndex == 6{clothIndex = 0}
                playerCloth = clothIndex
                let action = SKAction.setTexture(SKTexture(imageNamed: clothArray[clothIndex]), resize: true)
                self.cloth.run(action)
                welchesSpiel()
            }
            if node.name == "buttonShoe" {
            print("shoe")
                run("sound-button")
                shoe.run(fadeout)
                shoe.run(fadein)
                self.shoeIndex += 1
                if shoeIndex == 6{shoeIndex = 0}
                playerShoe = shoeIndex
                let action = SKAction.setTexture(SKTexture(imageNamed: shoeArray[shoeIndex]), resize: true)
                self.shoe.run(action)
                welchesSpiel()
            }
        
        
            if node.name == "button1" {
                                self.view?.presentScene(GameScene1(size: self.size),
                               transition: .crossFade(withDuration: 2))
                                run("sound-button")
            } else if node.name == "button2" {
                                self.view?.presentScene(GameScene2(size: self.size),
                               transition: .crossFade(withDuration: 2))
                                run("sound-button")
            } else if node.name == "button3" {
                                self.view?.presentScene(GameScene3(size: self.size),
                               transition: .crossFade(withDuration: 2))
                                run("sound-button")
            } else if node.name == "button4" {
                self.view?.presentScene(GameScene4(size: self.size),
               transition: .crossFade(withDuration: 2))
                run("sound-button")
            }
            
            if node.name == "triangle" {
                self.view?.presentScene(WhoScene(size: self.size),
               transition: .crossFade(withDuration: 2))
                run("sound-button")
            } else if node.name == "coin" {
                self.view?.presentScene(WhoScene(size: self.size),
               transition: .crossFade(withDuration: 2))
                run("sound-button")
            } else if node.name == "cup" {
                self.view?.presentScene(WhoScene(size: self.size),
               transition: .crossFade(withDuration: 2))
                run("sound-button")
            } else if node.name == "bottle" {
                self.view?.presentScene(WhoScene(size: self.size),
               transition: .crossFade(withDuration: 2))
                run("sound-button")
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
        let defaults = UserDefaults.standard
        defaults.set(playerHead, forKey: scoreHead)
        defaults.set(playerCloth, forKey: scoreCloth)
        defaults.set(playerShoe, forKey: scoreShoe)

        welchesSpiel()
    }
    
    
    func welchesSpiel() {
        
        let fadein = SKAction.fadeIn(withDuration: 0.2)
        let fadeout = SKAction.fadeOut(withDuration: 0.2)
        
        if headIndex == 0 && clothIndex == 0 && shoeIndex == 0 {
            button1.run(fadein)
            if let konfetti = SKEmitterNode(fileNamed: "KonfettiStopped"){
                konfetti.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 800)
                konfetti.advanceSimulationTime(10)
                konfetti.zPosition = 10
                addChild(konfetti)
            }
            
        }
       /* else {button1.run(fadeout)
            konfetti?.run(fadeout)}*/

        if headIndex == 4 && clothIndex == 5 && shoeIndex == 5 {
            button2.run(fadein)
            if let konfetti = SKEmitterNode(fileNamed: "KonfettiStopped"){
                konfetti.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 800)
                konfetti.advanceSimulationTime(10)
                konfetti.zPosition = 10
                addChild(konfetti)
            }
        }
        /*else {button2.run(fadeout)
            konfetti?.run(fadeout)
        }*/
        
        if headIndex == 3 && clothIndex == 4 && shoeIndex == 3 {
            button3.run(fadein)
            if let konfetti = SKEmitterNode(fileNamed: "KonfettiStopped"){
                konfetti.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 800)
                konfetti.advanceSimulationTime(10)
                konfetti.zPosition = 10
                addChild(konfetti)
            }
        }
        /*else {button3.run(fadeout)
            konfetti?.run(fadeout)
        }*/
        
        if headIndex == 1 && clothIndex == 2 && shoeIndex == 4 {
            button4.run(fadein)
            if let konfetti = SKEmitterNode(fileNamed: "KonfettiStopped"){
                konfetti.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 800)
                konfetti.advanceSimulationTime(10)
                konfetti.zPosition = 10
                addChild(konfetti)
            }
        }
        /*else {button4.run(fadeout)
            konfetti?.run(fadeout)
        }*/
    }

    func run(_ fileName: String){
            run(SKAction.repeat((SKAction.playSoundFileNamed(fileName, waitForCompletion: true)), count: 1))
        }
}
