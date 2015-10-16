//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
  var location: GridLocation
  var explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
      
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 4, y: 6), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 1, y: 1), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 3, y: 3), isVertical: false)
        let extraLargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 7), isVertical: false)
      
      let mine1 = Mine(location: GridLocation(x: 0, y: 0), explosionText: "boom")
      let mine2 = Mine(location: GridLocation(x: 4, y: 1), explosionText: "boom")
      
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(extraLargeShip1)

    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
      
      var finalScore: Int
      finalScore = 0
      
      let sinkBonus =
        (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
      let shipBonus =
        (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
      let guessPenalty =
        (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
      finalScore = sinkBonus + shipBonus - guessPenalty

      return finalScore
    }
}