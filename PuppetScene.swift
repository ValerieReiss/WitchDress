//
//  PuppetScene.swift
//  TarotDay
//
//  Created by Valerie on 05.07.23.
//


import SpriteKit
import GameplayKit


// WürfelScene Wicca

class PuppetScene: SKScene {
    var state : Int = 0
    
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    var cat = SKSpriteNode(imageNamed: "cat-sleep")
    var candles = SKSpriteNode(imageNamed: "candles-0")
    
    let backgroundImage = SKSpriteNode(imageNamed: "bg-moons.jpg")
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    private var magicStick : SKEmitterNode?
    
    let buttonHead = SKShapeNode(rect: CGRect(x: -1000, y: +1250, width: 2000, height: 900))
    let buttonCloth = SKShapeNode(rect: CGRect(x: -1000, y: +300, width: 2000, height: 900))
    let buttonShoe = SKShapeNode(rect: CGRect(x: -1000, y: -650, width: 2000, height: 900))
    var puppet = SKSpriteNode(imageNamed: "puppet")
    
    var head = SKSpriteNode()
    var cloth = SKSpriteNode()
    var shoe = SKSpriteNode()
    
    var labelTitle = SKLabelNode()
    var labelPlay = SKLabelNode()
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 1290, height: 2000), cornerRadius: 30.0)
    
    var headIndex: Int = 0
    var clothIndex: Int = 0
    var shoeIndex: Int = 0
    var headArray : [String] = ["head1", "head2", "head3"]
    var clothArray : [String] = ["cloth1","cloth2", "cloth3", "cloth4"]
    var shoeArray : [String] = ["shoe1", "shoe2", "shoe3"]

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
        
        puppet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        puppet.setScale(1)
        puppet.zPosition = 1
        puppet.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        addChild(puppet)
      
        buttonHead.name = "buttonHead"
        self.addChild(buttonHead)
        buttonHead.position = CGPoint(x: self.frame.midX , y: self.frame.midY)
        buttonHead.setScale(0.5)
        buttonHead.fillColor = .init(white: 1.0, alpha: 0.0)
        buttonHead.zPosition = 10
        let actionHead = SKAction.setTexture(SKTexture(imageNamed: headArray[playerHead]), resize: true)
        self.head.run(actionHead)
        
        buttonCloth.name = "buttonCloth"
        self.addChild(buttonCloth)
        buttonCloth.position = CGPoint(x: self.frame.midX , y: self.frame.midY)
        buttonCloth.setScale(0.5)
        buttonCloth.fillColor = .init(white: 1.0, alpha: 0.0)
        buttonCloth.zPosition = 10
        let actionCloth = SKAction.setTexture(SKTexture(imageNamed: clothArray[playerCloth]), resize: true)
        self.cloth.run(actionCloth)
        
        buttonShoe.name = "buttonShoe"
        self.addChild(buttonShoe)
        buttonShoe.position = CGPoint(x: self.frame.midX , y: self.frame.midY)
        buttonShoe.setScale(0.5)
        buttonShoe.fillColor = .init(white: 1.0, alpha: 0.0)
        buttonShoe.zPosition = 10
        let actionShoe = SKAction.setTexture(SKTexture(imageNamed: shoeArray[playerShoe]), resize: true)
        self.shoe.run(actionShoe)
        
        headIndex = Int.random(in: 0..<3)
        head.zPosition = 5
        head.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        head.setScale(1)
        addChild(head)
        head.texture = SKTexture(imageNamed: headArray[headIndex])
        head.physicsBody = SKPhysicsBody(texture: head.texture!, size: head.texture!.size())
        head.physicsBody?.isDynamic = false
                
        clothIndex = Int.random(in: 0..<4)
        cloth.zPosition = 4
        cloth.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        cloth.setScale(1)
        addChild(cloth)
        cloth.texture = SKTexture(imageNamed: clothArray[clothIndex])
        cloth.physicsBody = SKPhysicsBody(texture: cloth.texture!, size: cloth.texture!.size())
        cloth.physicsBody?.isDynamic = false
        
        shoeIndex = Int.random(in: 0..<3)
        shoe.zPosition = 3
        shoe.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        shoe.setScale(1)
        addChild(shoe)
        shoe.texture = SKTexture(imageNamed: shoeArray[shoeIndex])
        shoe.physicsBody = SKPhysicsBody(texture: shoe.texture!, size: shoe.texture!.size())
        shoe.physicsBody?.isDynamic = false
        
        if let bubbles = SKEmitterNode(fileNamed: "Bubbles"){
            bubbles.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
            bubbles.advanceSimulationTime(10)
            bubbles.zPosition = 1
            addChild(bubbles)
        }
        
        labelPlay.fontSize = 120
        labelPlay.zPosition = 2
        labelPlay.color = .white
        labelPlay.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 500)
        labelPlay.text = "witch my clothes"
        addChild(labelPlay)
        
        buttonRect.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 200)
        buttonRect.strokeColor = .init(white: 0.0, alpha: 1.0)
        buttonRect.name = "buttonRect"
        buttonRect.zPosition = 2
        addChild(buttonRect)
        
        menu.name = "Menu"
        menu.zPosition = 10
        menu.physicsBody = SKPhysicsBody(texture: menu.texture!, size: menu.texture!.size())
        menu.texture = SKTexture(imageNamed: "button-bottle")
        menu.physicsBody?.affectedByGravity = false
        menu.physicsBody?.isDynamic = false
        menu.physicsBody?.allowsRotation = true
        menu.position = CGPoint(x: self.frame.minX + 650, y: self.frame.minY + 450)
        menu.setScale(1)
        self.addChild(menu)
        let mi = SKAction.rotate(byAngle: -0.2, duration: 0.1)
        let ma = SKAction.rotate(byAngle: 0.2, duration: 0.1)
        let mu = SKAction.wait(forDuration: 7.0)
        let sequ = SKAction.sequence([ma, mi, ma, mi, mu])
        menu.run(SKAction.repeatForever(sequ))
        
        cat.name = "cat"
        cat.zPosition = 5
        cat.physicsBody = SKPhysicsBody(texture: cat.texture!, size: cat.texture!.size())
        cat.texture = SKTexture(imageNamed: "cat-sleep")
        let textureCat1 = SKTexture(imageNamed: "cat-sleep")
        let textureCat2 = SKTexture(imageNamed: "cat-awake")
        cat.physicsBody?.affectedByGravity = false
        cat.physicsBody?.isDynamic = false
        cat.physicsBody?.allowsRotation = true
        cat.position = CGPoint(x: self.frame.minX + 900, y: self.frame.minY + 450)
        cat.setScale(1)
        self.addChild(cat)
        let tex = SKAction.animate(with: [textureCat2, textureCat1], timePerFrame: 1.0)
        let wait = SKAction.wait(forDuration: 4.0)
        let seq = SKAction.sequence([tex, wait])
        cat.run(SKAction.repeatForever(seq))
        
        candles.name = "candles"
        candles.zPosition = 5
        candles.physicsBody = SKPhysicsBody(texture: candles.texture!, size: candles.texture!.size())
        candles.texture = SKTexture(imageNamed: "candles-0")
        let texture1 = SKTexture(imageNamed: "candles-1")
        let texture2 = SKTexture(imageNamed: "candles-2")
        let texture3 = SKTexture(imageNamed: "candles-3")
        let texture4 = SKTexture(imageNamed: "candles-4")
        candles.physicsBody?.affectedByGravity = false
        candles.physicsBody?.isDynamic = false
        candles.physicsBody?.allowsRotation = true
        candles.position = CGPoint(x: self.frame.minX + 350, y: self.frame.minY + 450)
        candles.setScale(1)
        self.addChild(candles)
        let animate = SKAction.animate(with: [texture1, texture2, texture3, texture4, texture1], timePerFrame: 0.3)
        let wait1 = SKAction.wait(forDuration: 4.0)
        let gogirls = SKAction.sequence([wait1, animate])
        candles.run(SKAction.repeatForever(gogirls))
        
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
                    if headIndex == 3{headIndex = 0}
                    playerHead = headIndex
                    let action = SKAction.setTexture(SKTexture(imageNamed: headArray[headIndex]), resize: true)
                    self.head.run(action)
            }
            if node.name == "buttonCloth" {
                print("cloth")
                    run("sound-button")
                    cloth.run(fadeout)
                    cloth.run(fadein)
                    self.clothIndex += 1
                    if clothIndex == 4{clothIndex = 0}
                    playerCloth = clothIndex
                    let action = SKAction.setTexture(SKTexture(imageNamed: clothArray[clothIndex]), resize: true)
                    self.cloth.run(action)
            }
            if node.name == "buttonShoe" {
                print("shoe")
                    run("sound-button")
                    shoe.run(fadeout)
                    shoe.run(fadein)
                    self.shoeIndex += 1
                    if shoeIndex == 3{shoeIndex = 0}
                    playerShoe = shoeIndex
                    let action = SKAction.setTexture(SKTexture(imageNamed: shoeArray[shoeIndex]), resize: true)
                    self.shoe.run(action)
            }
            if node.name == "Menu" {
                self.view?.presentScene(GameScene(size: self.size),
                                transition: .crossFade(withDuration: 3))
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
    }
    
   
    func run(_ fileName: String){
            run(SKAction.repeat((SKAction.playSoundFileNamed(fileName, waitForCompletion: true)), count: 1))
        }
    
}
