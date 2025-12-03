import Algorithms
import Foundation

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [String] {
    data.split(separator: ",").map {
      String($0)
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int64 {
    // Calculate the sum of the first set of input data
    var answer: Int64 = 0
    for entity in entities {
      let numbers = entity.split(separator: "-").map {
        String($0)
      }
      
      let first: [Character] = Array(numbers[0])
      let second: [Character] = Array(numbers[1])
      
      let firstNumber = Int(String(first))!
      let secondNumber = Int(String(second))!
      
      for len in first.count...second.count {
        if len % 2 != 0 { continue }
        
        let halfLen = len / 2
        
        let mn = Int(pow(10.0, Double(halfLen - 1)))
        let mx = Int(pow(10.0, Double(halfLen))) - 1
        
        for halfNumber in mn...mx {
            let s = String(halfNumber) + String(halfNumber)
            let number = Int(s)!
            
            if number < firstNumber { continue }
            if number > secondNumber { break }
            
          answer += Int64(number)
        }
      }
    }
    
    return answer
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int64 {
    var answer: Int64 = 0
    var set: Set<Int> = []
    for entity in entities {
      let numbers = entity.split(separator: "-").map {
        String($0)
      }
      
      let first: [Character] = Array(numbers[0])
      let second: [Character] = Array(numbers[1])
      
      let firstNumber = Int(String(first))!
      let secondNumber = Int(String(second))!
      
      for len in first.count...second.count {
        if len < 2 { continue }
        for k in 2...len {
          if len % k != 0 { continue }
          
          let partLen = len / k
          
          let mn = Int(pow(10.0, Double(partLen - 1)))
          let mx = Int(pow(10.0, Double(partLen))) - 1
          
          for partNumber in mn...mx {
            let s = String(repeating: String(partNumber), count: k)
            let number = Int(s)!
              
            if number < firstNumber { continue }
            if number > secondNumber { break }
            
            if !set.contains(number) {
              answer += Int64(number)
              set.insert(number)
            }
          }
        }
      }
    }
    
    return answer
  }
}
