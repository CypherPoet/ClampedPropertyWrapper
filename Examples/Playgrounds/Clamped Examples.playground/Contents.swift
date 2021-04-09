import Foundation
import ClampedPropertyWrapper


struct Player {
    @Clamped(within: 0.0...Double.infinity)
    var xp: Double = 0.0
    
    @Clamped(within: 1...100)
    var level: Int = 1
    
    @Clamped(within: "A"..."Z")
    var firstInitial: Character = "A"
}


var player1 = Player()


player1.xp
player1.level
player1.firstInitial

player1.xp = -9
player1.level = 20000
player1.firstInitial = "🧬"

player1.xp
player1.level
player1.firstInitial


player1.xp = 3333
player1.level = 21
player1.firstInitial = "Z"


player1.xp
player1.level
player1.firstInitial
