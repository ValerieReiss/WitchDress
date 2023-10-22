//
//  GameScene2.swift
//  TarotDay
//
//  Created by Valerie on 21.06.23.
//


import SpriteKit
import GameplayKit

// KartenScene geht auf die Tageskarte ein

class GameScene2: SKScene {
    //state 0: nix/ 1: karte gezogen/ 2: meaning revealed
    var state : Int = 0
    
    var menu = SKSpriteNode(imageNamed: "button-bottle")
    
    let backgroundImage = SKSpriteNode()
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    private var magicStick : SKEmitterNode?
    
    var labelPlay1 = SKLabelNode()
    var labelPlay2 = SKLabelNode()
    var buttonRect = SKShapeNode(rectOf: CGSize(width: 1290, height: 1600), cornerRadius: 30.0)
    
    var randomIndexCard: Int = 0
    var labelCard = SKLabelNode()
    var cardArray : [String] = ["The_Fool", "The_Magician", "The_High_Priestess", "The_Empress", "The_Emperor", "The_Hierophant", "The_Lovers", "The_Chariot", "The_Strength", "The_Hermit", "Wheel_of_Fortune", "Justice", "The_Hanged_Man", "Death", "Temperance", "The_Devil", "The_Tower", "The_Star", "The_Moon", "The_Sun", "Judgement", "The_World",
        "Ace_of_Wands", "Two_of_Wands", "Three_of_Wands", "Four_of_Wands", "Five_of_Wands", "Six_of_Wands", "Seven_of_Wands", "Eight_of_Wands", "Nine_of_Wands", "Ten_of_Wands",
        "Page_of_Wands", "Knight_of_Wands", "Queen_of_Wands", "King_of_Wands",
        "Ace_of_Pentacles", "Two_of_Pentacles", "Three_of_Pentacles", "Four_of_Pentacles", "Five_of_Pentacles", "Six_of_Pentacles", "Seven_of_Pentacles", "Eight_of_Pentacles", "Nine_of_Pentacles", "Ten_of_Pentacles",
        "Page_of_Pentacles", "Knight_of_Pentacles", "Queen_of_Pentacles", "King_of_Pentacles",
        "Ace_of_Cups", "Two_of_Cups", "Three_of_Cups", "Four_of_Cups", "Five_of_Cups", "Six_of_Cups", "Seven_of_Cups", "Eight_of_Cups", "Nine_of_Cups", "Ten_of_Cups",
        "Page_of_Cups", "Knight_of_Cups", "Queen_of_Cups", "King_of_Cups",
        "Ace_of_Swords", "Two_of_Swords", "Three_of_Swords", "Four_of_Swords", "Five_of_Swords", "Six_of_Swords", "Seven_of_Swords", "Eight_of_Swords", "Nine_of_Swords", "Ten_of_Swords",
        "Page_of_Swords", "Knight_of_Swords", "Queen_of_Swords", "King_of_Swords"
    ]
    
    var tarotArray1 : [String] =
    ["Carelessness, naivety and carefree love of ",
    "Transform! This card can mean dreams come",
    "Mysticism, spirituality and intuition.",
    "Sensuality and self-confidence: the ruler has",
    "Dominance, power and security. In which areas ",
    "Extremely good cards for love! It symbolizes a ",
    "Exuberant love! Also describes bonds in general.",
    "Progress and change: Drive and development!",
    "Everyone gets what they deserve! This announces",
    "Retreat! You need time to figure out. ",
    "A circle closes and brings past and future",
    "You realize that you have more to offer. ",
    "See the situation from a different angle,",
    "Something ends forever, something new begins. ",
    "The strenght is to be found in serenity!",
    "Unhealthy dependencies and seductions.",
    "Danger! ",
    "Pure inspiration! There are positive ",
    "Secrets! The moon represents something hidden",
    "Jackpot! Pure joie de vivre, confidence",
    "Consider! Take stock. Be more objective to see ",
    "What belongs together comes together. The end of ",
     
    //WANDS - Each Wand card belongs to the element of fire, which stands for zest for action, passion and dominance.
     "Success! You prevail.",
     "You need perseverance now. Take a more ",
     "The base stands. Time to move on to new goals! ",
     "Is there a party planned soon? There is definitely something ",
     "It could crack now! Heat Discussions or arguments ",
     "Congratulations - the victory is yours! You gain",
     "Hold on tight! It's getting stormy. Competition ",
     "The tide is turning. And in your favor! ",
     "Why so concerned? You have big doubts. Now is the time",
     "Something is weighing heavily on you. ",
     "Boisterous, adventurous and high-spirited.",
     "On to the fight! Courage and determination. ",
     "Passion, self-confidence and feminine warmth ",
     "It's all about dominance, assertiveness and respect",
      
     //Coins - The coin cards belong to the element earth, which represents down-to-earthness, loyalty and (financial) security.
      "Nobody can take your success away from you.",
     "You experience ups and downs, pros and cons.",
     "Be proud of yourself! ",
     "Trust is good, control is better. The desire for",
     "Do you currently feel alone or left behind? ",
     "Helpfulness and kindness. Be careful,",
     "Perseverance. Decide wisely and work your tough ",
     "They are currently under construction and show a",
     "Winning the lottery in the tarot: ",
     "You have everything! Financial security and ",
     "Eagerness and ambition. In money matters, ",
     "A persistent person who plans ahead and is ",
     "Rational, clever, reliable, but also good-natured:",
     "The King of Coins describes a solid and successful",
     
    //CUPS - A card in the Chalices series is associated with the element of water. This is about feelings, intuition and instinct.
     "Deep connection, happiness and love..",
     "One of the most auspicious love cards in the tarot!",
     "Rejoice! You have every reason to be.",
     "Don't get too attached to the here and now",
     "A loss hurts you. After this melancholic phase",
     "Cheerful and carefree like when I was a child.",
     "There are many possibilities but also many ",
     "Into the unknown! Something in your",
     "Satisfaction! At times, however, that contentment",
     "One of the luckiest cards in the tarot.",
     "Dreamy and uncertain. Someone doesn't",
     "Your motto could be to fight for what you love, now!",
     "A powerful person appears gently, but not always in control",
     "Feelings are more important than money or power. You are",

    // SWORDS - All sword cards are associated with the element of air. This symbolizes knowledge, intellect and reason.,
     "You have absolute clarity about what you need",
     "Should I or should not I? You are in a",
     "The classic lovesick card. A great heartache",
     "Now nothing works anymore. Use the standstill",
     "Treason and or ambush. Someone",
     "You are suddenly put in front of an",
     "Someone is sabotaging you or you are",
     "Get out of the golden cage! You feel safe but",
     "Something is giving you sleepless nights. They see the",
     "The end has come. The typical break up card! But a",
     "Inexperienced but provocative: he loves a challenge.",
     "An unperturbed look ahead!",
     "It's all about reason, justice and analysis.",
     "Always has good arguments ready and knows exactly"
     ]

    var tarotArray2 : [String] =
    ["life. It symbolizes youthful curiosity!",
    "true and you will get what you desire.",
    "Listen to your inner voice.",
    "her life under control. Trust yourself more.",
    "would you like to take the lead?",
    "higher connection. Tradition, learning and trust.",
    "Often appears when we have to make a heart decision.",
    "Something suddenly starts rolling.",
    "a karmic destiny or you receive justice.",
    "Stay alone for a while to find yourself again.",
    "into harmony. Happy coincidences are in the offing.",
    "It's all about mental strength!",
    "change your perspective!",
    "It heralds a very auspicious new beginning!",
    "Be patient and harmony awaits you.",
    "Jealousy or possessive behavior.",
    "Be prepared for a sudden dramatic change!",
    "opportunities. Hope and enlightenment.",
    "or suppressed. Not everything is as it seems.",
    "and happiness. Nothing can go wrong now.",
    "what is really good. A decision must be made.",
    "a phase of life. The beginning of an new cycle.",

    //WANDS - Each Wand card belongs to the element of fire, which stands for zest for action, passion and dominance.
     "Your passion and creativity pays off.",
     "relaxed view of things and act less grimly.",
     "You have the necessary positivity to tackle new things.",
     "to celebrate. A peaceful time to enjoy.",
     "are in the air. Hold on, this phase will pass.",
     "fame and prestige and have overcome all obstacles.",
     "could make life difficult for them now. Do not give up!",
     "Hold on, good changes are coming.",
     "to stay brave and not lose yourself in your own worries.",
     "Is the fight worth it?",
     "Lots of energy, but how to use it?",
     "Sometimes a little hotheaded.",
     "are united.",
     " ",
      
     //Coins - The coin cards belong to the element earth, which represents down-to-earthness, loyalty and (financial) security.
     "Financial security and material well-being.",
     "You have two options and are reluctant to give up either.",
     "Your achievement is finally being recognized.",
     "security is extremely strong. You can't let go!",
     "Look ahead, even a sad phase will pass.",
     "don't let yourself be taken advantage of!",
     "way up slowly and steadily to reach your goal.",
     "lot of ambition and diligence. You are on the right track.",
     "the nine of coins symbolizes sudden lucky turns.",
     "a steady true love. What more do you want?",
     "someone sometimes tends to set wrong priorities.",
     "willing to give everything for one's own goal.",
     "Someone always acts sensibly and reticent.",
     "person who is good with money and keeps promises.",
     
    //CUPS - A card in the Chalices series is associated with the element of water. This is about feelings, intuition and instinct.
     " ",
     "An intimate love or great friendship.",
     "You get good news.",
     "or you'll miss out on promising opportunities!",
     "better times are coming!",
     "Nostalgia. The return of a former lover is imminent.",
     "opportunities for self-deception. Beware of illusions.",
     "life is changing fundamentally.",
     "can spill over into pride or complacency.",
     "Everything fits! everything is right!",
     "necessarily dare to stand by his feelings.",
     "or declaration of love may be waiting for you.",
     "of his/her emotions. Don't let it be taken advantage of!",
     "dealing with a very emotional person who is sometimes a bit sensitive.",

    // SWORDS - All sword cards are associated with the element of air. This symbolizes knowledge, intellect and reason.
     "right now and you respond with astuteness and wisdom.",
     "decision-making situation and feel paralyzed. Wait!",
     "plagues you (still). Be good to yourself.",
     "for yourself to recognize what you really want.",
     "has disappointed or disappoints you.",
     "uncertain future, involuntarily. Believe in yourself!",
     "sabotaging someone - maybe even your own happiness?",
     "are inhibited. Sometimes it pays to take a risk.",
     "end coming and feel helpless. Don't let your worries take over.",
     "flourishing new beginning is waiting after a painful demolition.",
     "But can he survive?",
     " ",
     " ",
     "how to assert oneself. He thinks astutely and logically."
     ]
    
    var card = SKSpriteNode(imageNamed: "card-backside")
    var cardChosen = SKSpriteNode(imageNamed: "card-backside")
    
    override func didMove(to view: SKView) {
    
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick-violett")
            magicStick.particleZPosition = 10
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        let backgroundImage = SKSpriteNode(imageNamed: "bg-cardarea")
        backgroundImage.anchorPoint = CGPointMake(0.5, 0.5)
        backgroundImage.size = CGSize(width: self.frame.width, height: self.frame.height)
        backgroundImage.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundImage.zPosition = -2
        addChild(backgroundImage)
        
        card.name = "card"
        card.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 450)
        card.setScale(1.4)
        card.zPosition = 5
        addChild(card)
        
        card.physicsBody = SKPhysicsBody(texture: card.texture!, size: card.texture!.size())
        card.texture = SKTexture(imageNamed: "card-backside")
        card.physicsBody = SKPhysicsBody(texture: card.texture!, size: card.texture!.size())
        card.physicsBody?.affectedByGravity = false
        card.physicsBody?.isDynamic = false
        card.physicsBody?.allowsRotation = true
        
        labelCard.fontSize = 100
        labelCard.color = .white
        labelCard.zPosition = 10
        labelCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 250)
        addChild(labelCard)
        labelCard.text = "Ask your Question"
        
        labelPlay1.fontSize = 55
        labelPlay1.zPosition = 2
        labelPlay1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 400)
        labelPlay1.alpha = 0.0
        addChild(labelPlay1)
        labelPlay2.fontSize = 55
        labelPlay2.zPosition = 2
        labelPlay2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 530)
        labelPlay2.alpha = 0.0
        addChild(labelPlay2)
        
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
                if state == 0 {
                    state = 1
                    //choose card randomly
                    let drehschnell = SKAction.rotate(byAngle: -46, duration: 2.0)
                    let werdkleiner = SKAction.scale(to: 0.0, duration: 2.0)
                    let fadeOut = SKAction.fadeOut(withDuration: 2.0)
                    let seq = SKAction.sequence([drehschnell, fadeOut])
                    card.run(SKAction.repeat(seq, count: 1))
                    card.run(werdkleiner)
                    randomIndexCard = Int(arc4random_uniform(78))
                    
                    let fadeIn = SKAction.fadeIn(withDuration: 3.0)
                    cardChosen.texture = SKTexture(imageNamed: cardArray[randomIndexCard])
                    print("karte: \(randomIndexCard)")
                    addChild(cardChosen)
                    cardChosen.name = "cardChosen"
                    cardChosen.zPosition = 3
                    cardChosen.alpha = 0.0
                    cardChosen.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 450)
                    cardChosen.setScale(1.4)
                    cardChosen.run(fadeIn)
                    labelCard.text = "\(cardArray[randomIndexCard])"
                    labelPlay1.text = "\(tarotArray1[randomIndexCard])"
                    labelPlay2.text = "\(tarotArray2[randomIndexCard])"
                    labelPlay1.run(fadeIn)
                    labelPlay2.run(fadeIn)
                    run("sound-button")
                    
                }
                else if state == 1{
                    return
                }
                else {return}
            }
                
        
            if node.name == "card" {
            }
            if node.name == "cardChosen" {
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
        cardChosen = SKSpriteNode(imageNamed: "\(cardArray[randomIndexCard])")
        
    }
   
    func run(_ fileName: String){
            run(SKAction.repeat((SKAction.playSoundFileNamed(fileName, waitForCompletion: true)), count: 1))
        }
    
}
