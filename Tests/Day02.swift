import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day02Tests {
  // Smoke test data provided in the challenge question
  let testData = "2200670-2267527,265-409,38866-50720,7697424-7724736,33303664-33374980,687053-834889,953123-983345,3691832-3890175,26544-37124,7219840722-7219900143,7575626241-7575840141,1-18,1995-2479,101904-163230,97916763-98009247,52011-79060,31-49,4578-6831,3310890-3365637,414256-608125,552-1005,16995-24728,6985-10895,878311-912296,59-93,9978301-10012088,17302200-17437063,1786628373-1786840083,6955834840-6955903320,983351-1034902,842824238-842861540,14027173-14217812"

  @Test func testPart1() async throws {
    let challenge = Day02(data: testData)
    #expect(challenge.part1() == 1227775554)
  }

  @Test func testPart2() async throws {
    let challenge = Day02(data: testData)
    #expect(challenge.part2() == 4174379265)
  }
}
