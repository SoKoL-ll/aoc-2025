import Algorithms
import Foundation

struct Day06: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  var lines: [Substring] {
    data.split(separator: "\n", omittingEmptySubsequences: false)
  }
  
  var grid: [[Character]] {
    lines.dropLast().map { Array($0) }
  }

  var opLine: [Character] {
      lines.last!
          .filter { $0 != " " }
  }

  var numberLines: [[Int]] {
      lines
          .dropLast()
          .map { line in
              line
                  .split(whereSeparator: { $0 == " " })
                  .compactMap { Int($0) }
          }
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    var answer = 0
    let wight = numberLines[0].count
    
    for j in 0..<wight {
      var now = 0
      var isSum = true
      if opLine[j] == "+" {
        isSum = true
      } else {
        isSum = false
      }
      for i in 0..<numberLines.count {
        if isSum {
          now += numberLines[i][j]
        } else {
          if now == 0 {
            now = 1
          }
          now *= numberLines[i][j]
        }
      }
      
      answer += now
    }
    
    return answer
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    var answer = 0
    let wight = grid[0].count
    var signNumber = 0
    
    var numbers: [Int] = []
    for j in 0..<wight {
      var haveNumber = false
      var number: String = ""
      for i in 0..<grid.count {
        if grid[i][j] != " " {
          haveNumber = true
          number += String(grid[i][j])
        }
      }
      
      if !number.isEmpty {
        numbers.append(Int(number)!)
        number = ""
      }
      
      if !haveNumber || j == wight - 1 {
        if !numbers.isEmpty {
          answer += opLine[signNumber] == "+" ? numbers.reduce(0, +) : numbers.reduce(1, *)
          numbers.removeAll()
          signNumber += 1
        }
      }
    }
    
    return answer
  }
}
