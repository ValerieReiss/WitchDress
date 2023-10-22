//
//  TarotBedeutung.swift
//  TarotDay
//
//  Created by Valerie on 21.06.23.
//

import Foundation

//HAUPTDECK

let tarotArray : [String] =

["0: The fool - Carelessness, naivety and carefree love of life: That's what the fool stands for. It symbolizes youthful curiosity and carefreeness - sometimes also rashness.",
"I: The Magician - Transform! This card can mean dreams come true and you will get what you desire.",
"II: The High Priestess - The High Priestess symbolizes mysticism, spirituality and intuition. There may be important information that is still hidden. Listen to your inner voice.",
 "III: The Empress - Girl Power! Sensuality and self-confidence: the ruler has her life under control. The card encourages you to trust yourself more in order to be able to surpass yourself.",
"IV: The Ruler - The ruler combines dominance, power and security. In which areas would you like to take the lead?",
"V: The Hierophant - Pull this card in love tarot, you have extremely good cards! The hierophant symbolizes a higher connection and is a harbinger of marriage. In general, he raises the themes of tradition, learning and trust.",
"VI: The Lovers - The lovers can stand for exuberant love, but it also describes bonds in general and often appears when we have to make a heart decision.",
"VII: The Wagon - Now it's going round! Progress and change: the car announces drive and further development. Something suddenly starts rolling.",
"VIII: The Justice - Karma takes care of that! Everyone gets what they deserve - and if they haven't already, Justice announces a karmic destiny. This card can also represent that you receive justice.",
"IX: The Hermit - Retreat! You need time to yourself. Listen to your gut feeling and stay alone for a while to find yourself again.",
"X: The Wheel of Destiny - A circle closes. The Wheel of Destiny brings past and future into harmony. Happy coincidences are in the offing.",
"XI: The Force - The name of the card says it all: you realize that you have more to offer. It's all about mental strength.",
"XII: The Hanged Man - Don't worry, this card doesn't bode ill. The Hanged Man encourages you to see the situation from a different angle. Not much has changed from the outside - but if you change your perspective, you will see unimagined possible solutions.",
"XIII: Death - Something ends forever, something new begins. Death is not necessarily a negative card as it heralds a very auspicious new beginning.",
"XIV: Temperance - The strenght is to be found in serenity! Slow down and let life take you. Temperance is one of the positive cards that promise harmony - if you can be patient.",
"XV: The Devil - This card appears frequently in the Love Tarot. It symbolizes unhealthy dependencies and seductions. You don't feel completely free. The devil can also represent intense jealousy or possessive behavior.",
"XVI: The Tower - Danger! Be prepared for a sudden dramatic change. Because this is exactly what Der Turm announces.",
"XVII: The Star - Pure inspiration! Which wish would you like to fulfil? All of a sudden there are positive opportunities. The star spreads hope and can bring you some enlightenment.",
"XVIII: The Moon - Oh oh secrets! The moon represents something hidden or suppressed. Not everything is as it seems.",
"XIX: The Sun - This card is the jackpot in tarot. The sun promises pure joie de vivre, confidence and happiness. Nothing can go wrong now.",
"XX: The Judgment - Time to consider! The court asks you to take stock. Try to be more objective about something. Now the accounts are settled and you can see who or what is really good for you. The court is reminding you of a decision that you shouldn't put off any longer.",
"XXI: The World - Something fits and we finally recognize larger connections. What belongs together comes together. A positive card that seals the end of a phase of life and heralds the beginning of an important new cycle.",

//WANDS - Each Wand card belongs to the element of fire, which stands for zest for action, passion and dominance.
"Ace of Wands - Success! You prevail. Your passion and creativity pays off.",
 "Two of the Wands - You need perseverance now. Take a more relaxed view of things and act less grimly.",
 "Three of Wands - The base stands. Time to move on to new goals! You have the necessary positivity to tackle new things.",
 "Four of Wands - Is there a party planned soon? There is definitely something to celebrate. The Four of Wands heralds a peaceful time to enjoy.",
 "Five of Wands - It could crack now! Heat Discussions or arguments are in the air. Hold on, this phase will pass.",
 "Six of Wands - Congratulations - the victory is yours! You gain fame and prestige and have overcome all obstacles.",
 "Seven of Wands - Hold on tight! It's getting stormy. Competition could make life difficult for them now. Do not give up!",
 "Eight of Wands - The tide is turning. And in your favor! Hold on, good changes are coming.",
 "Nine of Wands - Why so concerned? You have big doubts. Now is the time to stay brave and not lose yourself in your own worries.",
 "Ten of Wands - Something is weighing heavily on you. Is the fight worth it? This is the question to ask yourself as you draw the Ten of Wands.",
 "Knave of Wands - Boisterous, adventurous and high-spirited - the Knave of Wands has a lot of energy, but doesn't really know how to use it yet.",
 "Knight of Wands - On to the fight! The Knight of Wands symbolizes courage and determination and can sometimes act a little hotheaded.",
 "The Queen of Wands - Passion, self-confidence and feminine warmth - that's what the Queen of Wands unites.",
 "The King of Wands - Draw the king of wands, it's all about dominance, assertiveness and respect",
  
 //Coins - The coin cards belong to the element earth, which represents down-to-earthness, loyalty and (financial) security.
  "Ace of Coins - Nobody can take your success away from you. The ace of coins can also represent financial security and material well-being.",
 "Two of the Coins - You experience ups and downs, pros and cons. When it comes to questions of love, this card often means that you have two options and are reluctant to give up either.",
 "Three of the Coins - Be proud of yourself! Your achievement is finally being recognized.",
 "Four of the Coins - Trust is good, control is better. The desire for security is extremely strong. You can't let go!",
 "Five of the Coins - Do you currently feel alone or left behind? This mood reflects the five of coins. Look ahead, even a sad phase will pass.",
 "Six of the Coins - They want to give. This card is about helpfulness and kindness. Be careful, don't let yourself be taken advantage of!",
 "Seven of the Coins - Yes, the phase is tough. But the effort is worth it! The seven of coins reminds you of your perseverance. Decide wisely and work your way up slowly and steadily to reach your goal.",
 "Eight of the Coins - They are currently under construction and show a lot of ambition and diligence. You are on the right track.",
 "Nine of Coins - Winning the lottery in the tarot: the nine of coins symbolizes sudden lucky turns.",
 "Ten of the Coins - You have everything! Financial security and a (steady) true love. What more do you want?",
 "Knave of Coins - The Knave of Coins is eager and ambitious. In money matters, he sometimes tends to set wrong priorities. This card can mean you or someone else.",
 "Knight of Coins - A persistent person who plans ahead and is willing to give everything for one's own goal.",
 "Queen of Coins - Rational, clever, reliable, but also good-natured: the queen of coins always acts sensibly and keeps her emotions to herself.",
 "King of Coins - The King of Coins describes a solid and successful person who is good with money and keeps promises.",
 
//CUPS - A card in the Chalices series is associated with the element of water. This is about feelings, intuition and instinct.
"Ace of Cups - Deep connection, happiness and love - that's what the ace of cups stands for.",
 "Two of the Cups - One of the most auspicious love cards in the tarot! The Two of Cups stands for an intimate love or great friendship.",
 "Three of Cups - Rejoice! With the Three of Cups you have every reason to be. You get good news.",
 "Four of Cups - Don't let an opportunity pass you by. Don't get too attached to the here and now—or you'll miss out on promising opportunities!",
 "Five of Cups - A loss hurts you. After this melancholic phase better times are coming!",
 "Six of Cups - Cheerful and carefree like when I was a child - that is the energy of the Six of Cups. Attention: In the love tarot this card also stands for nostalgia. The return of a former lover is imminent.",
 "Seven of Cups - You have options. And dreams. There are many possibilities – but also many opportunities for self-deception. Beware of illusions.",
 "Eight of Cups - Into the unknown! Something in your life is changing fundamentally.",
 "Nine of Cups - I'm happy the way it is now! This motto represents the Nine of Cups. At times, however, that contentment can spill over into pride or complacency.",
 "Ten of Chalices - One of the luckiest cards in the tarot. Everything fits, everything is right, everything fits.",
 "Jack of Cups - Dreamy and uncertain - this is the Knave of Cups. He doesn't necessarily dare to stand by his feelings. The card also symbolizes relationship inexperience or ties that are just beginning.",
 "Knight of Cups - If you don't fight for love, then what?! That could be the motto of the Knight of Chalices. If you draw this card, a declaration of love may be waiting for you. Or you choose to fight for what you love.",
 "Queen of Cups - The Queen of Cups appears gently, lovingly and emotionally. A powerful woman, but not always in control of her emotions. Don't let it be taken advantage of!",
 "King of Cups - Feelings are more important than money or power: this is what the King of Cups embodies. If you draw this card in the Love Tarot, you are dealing with a very emotional person who is sometimes a bit sensitive.",

// SWORDS - All sword cards are associated with the element of air. This symbolizes knowledge, intellect and reason.
"Ace of Swords - You know what you want! You have absolute clarity about what you need right now and you respond with astuteness and wisdom.",
 "The Two of Swords - Should I or should not I? You are in a decision-making situation and feel paralyzed. Wait!",
 "The Three of Swords - The classic lovesick card. A great heartache plagues you (still). Be good to yourself.",
 "The Four of Swords - Now nothing works anymore - and that's a good thing! You should use the standstill for yourself to recognize what you really want.",
 "The Five of Swords - Treason! They spot an ambush. Someone has disappointed or disappointed her.",
 "Six of Swords - ...and suddenly everything was different! The Six of Swords puts you in front of an uncertain future - and involuntarily. Believe in yourself!",
 "Seven of Swords - Someone is sabotaging you or you are sabotaging someone - maybe even your own happiness?",
 "Eight of Swords - Get out of the golden cage! You feel safe but are inhibited. Don't get stuck. Sometimes it pays to take a risk.",
 "Nine of Swords - Something is giving you sleepless nights. They see the end coming and feel helpless. Don't let your worries take over.",
 "Ten of Swords - The end has come. The typical break up card in the tarot. But: A flourishing new beginning is waiting for them after they had to experience a painful demolition.",
 "Knave of Swords - Inexperienced but provocative: the Knave of Swords loves a challenge. But can he survive?",
 "Knight of Swords - An unperturbed look ahead - that's what the dogged Knight of Swords is all about.",
 "Queen of Swords - Draw the Queen of Swords, it's all about reason, justice and analysis.",
 "King of Swords - The King of Swords always has good arguments ready and knows exactly how to assert oneself. He thinks astutely and logically."
 ]
