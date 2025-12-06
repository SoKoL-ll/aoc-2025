import Algorithms
import Foundation

struct Day04: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entryEntities: [[Character]] {
    data.split(separator: "\n").map {
      Array($0)
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    var answer = 0
    let entities = entryEntities
    
    let directions = [(-1, -1), (-1, 0), (-1, 1), ( 0, -1), ( 0, 1), ( 1, -1), ( 1, 0), ( 1, 1)]

    for i in 0..<entities.count {
        for j in 0..<entities[i].count {
          if entities[i][j] != "@" {
            continue
          }
            var count = 0

            for (di, dj) in directions {
                let ni = i + di
                let nj = j + dj

                if ni >= 0,
                   nj >= 0,
                   ni < entities.count,
                   nj < entities[ni].count,
                   entities[ni][nj] == "@"
                {
                    count += 1
                }
            }
          
          if count < 4 {
            answer += 1
          }
        }
    }
    
    return answer
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    var answer = 0
    var flag = true
    let directions = [(-1, -1), (-1, 0), (-1, 1), ( 0, -1), ( 0, 1), ( 1, -1), ( 1, 0), ( 1, 1)]
    var entities = entryEntities

    while flag {
      flag = false
      
      var toRemove: [(Int, Int)] = []
      
      for i in 0..<entities.count {
        for j in 0..<entities[i].count {
          if entities[i][j] != "@" {
            continue
          }
          var count = 0
          
          for (di, dj) in directions {
            let ni = i + di
            let nj = j + dj
            
            if ni >= 0,
               nj >= 0,
               ni < entities.count,
               nj < entities[ni].count,
               entities[ni][nj] == "@"
            {
              count += 1
            }
          }
          
          if count < 4 {
            toRemove.append((i, j))
            answer += 1
          }
        }
      }
      
      if !toRemove.isEmpty {
        for (i, j) in toRemove {
          entities[i][j] = "."
        }
        
        flag = true
      }
    }
    
    return answer
  }
}
