//
//  GameScene3.swift
//  TarotDay
//
//  Created by Valerie on 23.06.23.
//

import SpriteKit
import GameplayKit


// WürfelScene Wicca

class GameScene3: SKScene {
    var state : Int = 0
    
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    var cat = SKSpriteNode(imageNamed: "cat-sleep")
    var candles = SKSpriteNode(imageNamed: "candles-0")
    
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
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 1290, height: 1600), cornerRadius: 30.0)
    
    var randomIndex: Int = 0
    var wiccaChosen = SKSpriteNode(imageNamed: "astro-aquarius")
    var wiccaArray : [String] = ["astro-aquarius","astro-aries","astro-balance", "astro-cancer", "astro-capricorn", "astro-gemini", "astro-leo", "astro-pisces", "astro-sagittarius", "astro-scorpio", "astro-taurus", "astro-virgo"]
    var titleArray : [String] = ["Aquarius","Aries","Libra", "Cancer", "Capricorn", "Gemini", "Leo", "Pisces", "Sagittarius", "Scorpio", "Taurus", "Virgo"]
    var meaningArray1 : [String] = [
        "progressive, innovative, future-oriented",
        "brave, fearless, leadership",
        "charming, peaceful, diplomatic",
        "loyalty, sensitive, emotions, healing",
        "strategic, authoritative, ambitious",
        "adaptability, intelligence, agility",
        "playful, brave, protective",
        "dreamy, fantasies, intuitive, spiritual",
        "adventure, open-minded, energetic",
        "passionate, intense, driven, secretive",
        "stability, trustworthiness, patience",
        "rationality, logical, perfectionistic",
    ]
    var meaningArray2 : [String] = [
        "intelligent, friendly,  ambitious",
        "authoritative, active",
        "harmonious, artistic, intelligent, friendly",
        "compassion, comfort",
        "disciplined, persistent,  stability",
        "communication, curiosity",
        "charismatic, popularity, royalty",
        "compassionate, creativity, romantic",
        "truth-seeking, ambitious, moral",
        "wise, determined, powerful",
        "tenacity, materiality",
        "responsible, organized",
    ]
    
    override func didMove(to view: SKView) {
    
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        let backgroundImage = SKSpriteNode(imageNamed: "bg-moons.jpg")
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
        bubble1.setScale(0.85)
        bubble1.zPosition = 2
        bubble1.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        addChild(bubble1)
        bubble2 = SKSpriteNode(imageNamed: bubbleArray[1])
        bubble2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble2.setScale(0.85)
        bubble2.zPosition = 2
        bubble2.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
        addChild(bubble2)
        bubble3 = SKSpriteNode(imageNamed: bubbleArray[2])
        bubble3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble3.setScale(0.85)
        bubble3.zPosition = 2
        bubble3.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 300)
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
            bubbles.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
            bubbles.advanceSimulationTime(10)
            bubbles.zPosition = 5
            addChild(bubbles)
        }
        
        labelPlay.fontSize = 120
        labelPlay.zPosition = 2
        labelPlay.color = .white
        labelPlay.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 500)
        labelPlay.text = "emotions fortune teller"
        addChild(labelPlay)
        
        buttonRect.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 200)
        buttonRect.strokeColor = .init(white: 1.0, alpha: 0.3)
        buttonRect.fillColor = .init(white: 1.0, alpha: 0.1)
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
            
            if node.name == "buttonRect" {
                print (" es wird gewürfelt")
                if state == 0 {
                    state = 1
                    
                    //animation Gas im Glaskugel
                    
                    randomIndex = Int(arc4random_uniform(12))
                    
                    let fadeIn = SKAction.fadeIn(withDuration: 3.5)
                    wiccaChosen.texture = SKTexture(imageNamed: wiccaArray[randomIndex])
                    print("karte: \(randomIndex)")
                    addChild(wiccaChosen)
                    wiccaChosen.name = "wiccaChosen"
                    wiccaChosen.zPosition = 3
                    wiccaChosen.alpha = 0.0
                    wiccaChosen.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 330)
                    wiccaChosen.setScale(1.0)
                    wiccaChosen.run(fadeIn)
                    
                   // buttonRect.alpha = 0.0
                    let fadeOut = SKAction.fadeOut(withDuration: 0.5)
                    buttonRect.run(fadeOut)
                    labelPlay.run(fadeOut)
                    
                    labelTitle.fontSize = 120
                    labelTitle.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 950)
                    labelTitle.text = "\(titleArray[randomIndex])"
                    labelTitle.alpha = 0.0
                    labelMeaning1.fontSize = 75
                    labelMeaning1.text = "\(meaningArray1[randomIndex])"
                    labelMeaning1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 400)
                    labelMeaning1.alpha = 0.0
                    labelMeaning2.fontSize = 75
                    labelMeaning2.text = "\(meaningArray2[randomIndex])"
                    labelMeaning2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 500)
                    labelMeaning2.alpha = 0.0
                    addChild(labelMeaning1)
                    addChild(labelMeaning2)
                    addChild(labelTitle)
                    labelMeaning1.run(fadeIn)
                    labelMeaning2.run(fadeIn)
                    labelTitle.run(fadeIn)
                    run("sound-button")
                    
                }
                
            }
            if node.name == "Menu" {
                self.view?.presentScene(Menu(size: self.size),
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
