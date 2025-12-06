import Algorithms
import Foundation

struct Day05: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var blocks: [Substring] {
      data.split(separator: "\n\n", omittingEmptySubsequences: false)
  }

  var rangeLines: [Substring] {
      blocks[0].split(separator: "\n")
  }

  var idLines: [Substring] {
      blocks[1].split(separator: "\n")
  }

  var ranges: [(Int, Int)] {
      rangeLines.map {
          let parts = $0.split(separator: "-")
          return (Int(parts[0])!, Int(parts[1])!)
      }
  }

  var ids: [Int] {
      idLines.map { Int($0)! }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {

    let sorted = ranges.sorted { $0.0 < $1.0 }
    var merged: [(Int, Int)] = [sorted[0]]

    for range in sorted.dropFirst() {
        let (start, end) = range
        let lastIndex = merged.count - 1
        let (mStart, mEnd) = merged[lastIndex]

        if start <= mEnd {
            merged[lastIndex] = (mStart, max(mEnd, end))
        } else {
            merged.append(range)
        }
    }
    
    var answer = 0
    
    for id in ids {
      answer += isFresh(id, in: merged) ? 1 : 0
    }
    
    return answer
  }
  
  private func isFresh(_ id: Int, in intervals: [(Int, Int)]) -> Bool {
    var low = 0
    var high = intervals.count - 1

    while low <= high {
        let mid = (low + high) / 2
        let (l, r) = intervals[mid]

        if id < l {
            high = mid - 1
        } else if id > r {
            low = mid + 1
        } else {
            return true
        }
    }

    return false
}

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {

    let sorted = ranges.sorted { $0.0 < $1.0 }
    var merged: [(Int, Int)] = [sorted[0]]

    for range in sorted.dropFirst() {
        let (start, end) = range
        let lastIndex = merged.count - 1
        let (mStart, mEnd) = merged[lastIndex]

        if start <= mEnd {
            merged[lastIndex] = (mStart, max(mEnd, end))
        } else {
            merged.append(range)
        }
    }
    
    return merged.reduce(0) { acc, r in
        acc + (r.1 - r.0 + 1)
    }
  }
}
