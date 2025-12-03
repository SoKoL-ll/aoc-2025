import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Character]] {
    data.split(separator: "\n").map {
      Array($0)
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    // Calculate the sum of the first set of input data
    var now = 50
    var count = 0
    
    for turn in entities {
      if now < 0 {
        now = 100 - (abs(now) % 100)
      }
      
      now %= 100
      
      if now == 0 {
        count += 1
      }
      let side = turn[0]
      
      switch side {
      case "R":
        now += Int(String(turn).dropFirst())!
      case "L":
        now -= Int(String(turn).dropFirst())!
      default:
        return 0
      }
    }
    
    
    if now < 0 {
      now = 100 + now
    }
    
    now %= 100
    
    if now == 0 {
      count += 1
    }
    
    return count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    var now = 50
    var prev = 0
    var count = 0
    
    for turn in entities {
      if now < 0 {
        if prev > 0 {
          count += 1
        }
        if now < 100 {
          count += abs(now) / 100
          if now % 100 == 0 {
            count -= 1
          }
        }
        
        now = 100 - (abs(now) % 100)
      }
      
      if now > 100 {
        count += now / 100
        if now % 100 == 0 {
          count -= 1
        }
      }
      
      now %= 100
      
      if now == 0 {
        count += 1
      }
      
      let side = turn[0]
      
      prev = now
      switch side {
      case "R":
        now += Int(String(turn).dropFirst())!
      case "L":
        now -= Int(String(turn).dropFirst())!
      default:
        return 0
      }
    }
    
    
    if now < 0 {
      if prev > 0 {
        count += 1
      }
      if now < 100 {
        count += abs(now) / 100
        if now % 100 == 0 {
          count -= 1
        }
      }
      
      now = 100 - (abs(now) % 100)
    }
    
    if now > 100 {
      count += now / 100
      if now % 100 == 0 {
        count -= 1
      }
    }
    
    now %= 100
    
    if now == 0 {
      count += 1
    }
    
    return count
  }
}
