import UIKit
import ClampedPropertyWrapper


struct Player {

    @Clamped(
        above: 0.0.nextDown,
        andBelow: .infinity
    )
    var xp: Double = 0.0


    @Clamped(to: 1..<100)
    var level: Int = 1


    @Clamped(above: 0.0, andBelow: Double.infinity)
    var number: Double = 1.0


    @Clamped(to: "A"..."Z")
    var firstInitial: Character = "A"

    
    @Clamped(to: 0.0...)
    var ammo: Double = 0.1


    @Clamped(to: ...100.0)
    var reputation: Double = .zero

    
    @Clamped(to: ..<20)
    var weeklyLeaderboardRankChange: Int = .zero
}


func printPlayer() {
    player.xp
    player.level
    player.firstInitial
    player.ammo
    player.reputation
    player.weeklyLeaderboardRankChange
}


var player = Player()

printPlayer()

player.xp = -9
player.level = 20000
player.firstInitial = "🧬"
player.ammo = -9
player.reputation = 200
player.weeklyLeaderboardRankChange = 20


printPlayer()
