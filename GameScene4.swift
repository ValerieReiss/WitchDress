//
//  GameScene4.swift
//  TarotDay
//
//  Created by Valerie on 26.06.23.
//

import SpriteKit
import GameplayKit

// Drehrad geht auf irgendwas keine ahnung

class GameScene4: SKScene {
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    
    var state : Int = 0
    var player = SKSpriteNode(imageNamed: "circle-wicca")
    
    var labelPlay = SKLabelNode()
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 1290, height: 1600), cornerRadius: 30.0)
    
    private var magicStick : SKEmitterNode?
    
    var touchLocation = CGPoint()
    var startTouch = CGPoint()
    var endTouch = CGPoint()

    var startingAngle:CGFloat?
    var startingTime:TimeInterval?
    
    var labelWicca = SKLabelNode()
    
    var randomIndex: Int = 0
    var wiccaChosen = SKSpriteNode(imageNamed: "wicca-sign")
    var wiccaArray : [String] = ["wicca-crossroads", "wicca-eye", "wicca-flight", "wicca-harvest", "wicca-man", "wicca-moon", "wicca-rings", "wicca-romance", "wicca-scythe", "wicca-star", "wicca-sun", "wicca-waves", "wicca-woman"]
    var wiccaTitle : [String] = ["Crossroads Rune", "The Eye Rune", "Flight Rune", "Harvest Rune", "Man Rune", "The Moon Rune", "The Rings Rune", "Romance Rune", "The Scythe Rune", "The Star Rune", "The Sun Rune", "Waves Rune", "Woman Rune"]
    
    var labelMeaning1 = SKLabelNode()
    var labelMeaning2 = SKLabelNode()
    var labelMeaning3 = SKLabelNode()
    
    var meaning1Array : [String] = [
        "Use this symbol in magic if you are going through",
        "The eye is a very magical symbol, use this symbol",
        "This witches rune symbol represents higher",
        "This symbol should be used for prosperity and",
        "Use this symbol in magic workings that deals with",
        "This symbol represents the feminine and magic. Use",
        "Use this symbol for binding, if you wish to attarct",
        "This Rune is to attract romance or a new love to",
        "This symbol is used to break curses or bad luck.",
        "this is the wishing Rune. If there is something you",
        "This symbol represents growth and happiness, strengh",
        "This Rune symbol is used for purity, use this for",
        "Use this symbol in your magical working to represent"]
    
    var meaning2Array : [String] = [
        "a big change or if you wish to bring change to your life,",
        "for psychic workings, or in spells to find out the truth or ",
        "knowledge, if you wish to learn something new or want to start",
        "abundance. Use it in magical workings dealing with money,",
        "men or masculinity, use it to draw on strenght or the ",
        "this symbol on any magical workings to enhance the power,",
        "new love or if you are in a relationship, this will strengthen",
        "you, use this symbol is sex magic or fertility, also used",
        "If you fee you have, curse or hex over you use this symbol",
        "desire, use this symbol to atract it to you, meditate on",
        "and the masculine, use this for invoking Sun Gods and",
        "forgiveness or to wash away bad or negative feelings.",
        "woman, or the feminine, or to call upon the Goddesses."]
    
    var meaning3Array : [String] = [
        "or if you have a decision to make.",
        "to find out if someone is being dishonest, also use for protection.",
        "a new business or success at a new job then use this symbol to attract it.",
        "or bringing something good into your life.",
        "power of the Gods.",
        "use it to invoke Moon Godesses and on Esbats.",
        "the bond, in business use this symbol to strengien a contract.",
        "to heal broken hearts and relationships.",
        "to break it. It can also be used for breaking a bond in a relationship.",
        "this symbol to bring luck and fortune to you",
        "Goddesses. Use this symbol for protection and happiness, or on Sabbats",
        " This is a strong symbol for healing, addiction or depression.",
        " "]
    
    override func didMove(to view: SKView) {
        
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        let backgroundImage = SKSpriteNode(imageNamed: "bg-wicca")
        backgroundImage.anchorPoint = CGPointMake(0.5, 0.5)
        backgroundImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundImage.zPosition = -2
        backgroundImage.isUserInteractionEnabled = false
        addChild(backgroundImage)
        
        labelPlay.fontSize = 100
        labelPlay.zPosition = 2
        labelPlay.color = .yellow
        labelPlay.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 600)
        labelPlay.text = "Make your Ritual"
        addChild(labelPlay)
        
        buttonRect.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 200)
        buttonRect.strokeColor = .init(white: 1.0, alpha: 0.3)
        buttonRect.fillColor = .init(white: 1.0, alpha: 0.1)
        buttonRect.name = "buttonRect"
        buttonRect.zPosition = 20
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

        spawnPlayer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
                    startTouch = touch.location(in:self)
                }
            guard var touch = touches.first else {return}
            touch = (touches.first as UITouch?)!
            let location = touch.location(in: self)
            let node = atPoint(location)
            
            if node.name == "player" {
                let dx = location.x - node.position.x
                let dy = location.y - node.position.y
                // Store angle and current time
                startingAngle = atan2(dy, dx)
                startingTime = touch.timestamp
                node.physicsBody?.angularVelocity = 0
            }
            
            if node.name == "buttonRect" {
                if state == 0 {
                    state = 1
                    print (" es wird gedreht")
                    
                    let drehrechts = SKAction.rotate(byAngle: -446, duration: 2.0)
                    let werdkleiner = SKAction.scale(to: 0.0, duration: 2.0)
                    let fadeOut = SKAction.fadeOut(withDuration: 2.0)
                    let seq = SKAction.sequence([drehrechts, fadeOut])
                    player.run(SKAction.repeat(seq, count: 1))
                    player.run(werdkleiner)
                    
                    
                    randomIndex = Int(arc4random_uniform(13))
                    let fadeIn = SKAction.fadeIn(withDuration: 3.0)
                    wiccaChosen.texture = SKTexture(imageNamed: wiccaArray[randomIndex])
                    print("karte: \(randomIndex)")
                    addChild(wiccaChosen)
                    wiccaChosen.name = "cardChosen"
                    wiccaChosen.zPosition = 3
                    wiccaChosen.alpha = 0.0
                    wiccaChosen.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 450)
                    wiccaChosen.setScale(6.0)
                    wiccaChosen.run(fadeIn)
                    
                    labelWicca.fontSize = 100
                    labelWicca.color = .white
                    labelWicca.zPosition = 10
                    labelWicca.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                    addChild(labelWicca)
                    labelWicca.text = "\(wiccaTitle[randomIndex])"
                    
                    labelMeaning1.fontSize = 55
                    labelMeaning1.color = .white
                    labelMeaning1.zPosition = 10
                    labelMeaning1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
                    addChild(labelMeaning1)
                    labelMeaning1.text = "\(meaning1Array[randomIndex])"
                    
                    labelMeaning2.fontSize = 55
                    labelMeaning2.color = .white
                    labelMeaning2.zPosition = 10
                    labelMeaning2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 300)
                    addChild(labelMeaning2)
                    labelMeaning2.text = "\(meaning2Array[randomIndex])"
                    
                    labelMeaning3.fontSize = 55
                    labelMeaning3.color = .white
                    labelMeaning3.zPosition = 10
                    labelMeaning3.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 400)
                    addChild(labelMeaning3)
                    labelMeaning3.text = "\(meaning3Array[randomIndex])"
                    
                    let fadeOut2 = SKAction.fadeOut(withDuration: 0.5)
                    buttonRect.run(fadeOut2)
                    labelPlay.run(fadeOut2)
                }
                else if state == 1 {
                    print("fertisch")
                    return
                }
            }
        
            if node.name == "Menu" {
                self.view?.presentScene(Menu(size: self.size),
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
            let node = atPoint(location)
            if node.name == "player" {
                let dx = location.x - node.position.x
                let dy = location.y - node.position.y
                
                let angle = atan2(dy, dx)
                // Calculate angular velocity; handle wrap at pi/-pi
                var deltaAngle = angle - startingAngle!
                if abs(deltaAngle) > CGFloat.pi {
                    if (deltaAngle > 0) {
                        deltaAngle = deltaAngle - CGFloat.pi * 2
                    }
                    else {
                        deltaAngle = deltaAngle + CGFloat.pi * 2
                    }
                }
                let dt = CGFloat(touch.timestamp - startingTime!)
                let velocity = deltaAngle / dt
                
                node.physicsBody?.angularVelocity = velocity
                
                startingAngle = angle
                startingTime = touch.timestamp
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
               for touch in touches {
                   endTouch = touch.location(in: self)
               }
           }
 
    override func update(_ currentTime: TimeInterval) {
    }
    
    
    
    
    func spawnPlayer(){
        
        player.zPosition = 3
        player.size = CGSize(width: frame.width, height: frame.width)
        player.name = "player"
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = true
           // Change this property as needed (increase it to slow faster)
        player.physicsBody!.angularDamping = 4
        player.physicsBody?.pinned = true
        player.position = CGPointMake(self.frame.midX, self.frame.midY + 200)
        self.addChild(player)
    }
    
    func run(_ fileName: String){
               run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
           
       }
}
