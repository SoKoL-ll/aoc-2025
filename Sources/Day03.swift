import Algorithms
import Foundation

struct Day03: AdventDay {
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
    var answer = 0
    for entity in entities {
      let digits = entity.map { $0.wholeNumberValue! }
      var number = -1
      var firstDigit = -1
      
      for i in 0..<digits.count - 1 {
        if digits[i] > firstDigit {
          firstDigit = digits[i]
        } else if 10 * firstDigit + digits[i] > number {
          number = 10 * firstDigit + digits[i]
        }
      }
      
      if 10 * firstDigit + digits.last! > number {
        number = 10 * firstDigit + digits.last!
      }
      
      answer += number
    }
    
    return answer
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    var answer = 0
    
    for entity in entities {
      var stack: [Character] = []
      for (i, char) in entity.enumerated() {
        while !stack.isEmpty &&
                char.wholeNumberValue! > stack.last!.wholeNumberValue! &&
                (stack.count - 1 + (entity.count - i)) >= 12 {
          stack.removeLast()
        }
        
        stack.append(char)
        if stack.count > 12 {
          stack.removeLast()
        }
      }
      
      answer += Int(String(stack.prefix(12)))!
    }
    
    return answer
  }
}
