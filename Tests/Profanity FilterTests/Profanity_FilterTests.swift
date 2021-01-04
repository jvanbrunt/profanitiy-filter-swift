import XCTest
@testable import Profanity_Filter

final class ProfanityFilterTests: XCTestCase {
    
    func testFindingSingleWord()  {
        let result = ProfanityFilter(blackList: BlackList.defaultList).containsProfanity(text: "shit")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("shit"))
    }
    
    func testFindingSingleWordUppercased() {
        let result = ProfanityFilter(blackList: BlackList.defaultList).containsProfanity(text: "SHIT")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("SHIT"))
    }
    
    func testFindMultiWord() {
        let result = ProfanityFilter(blackList: BlackList.defaultList).containsProfanity(text: "shithappenspoop")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("poop"))
        XCTAssertTrue(result.profanities.contains("shit"))
    }
    
    func testNoProfanity() {
        let result = ProfanityFilter(blackList: BlackList.defaultList).containsProfanity(text: "Nothing happens")
        XCTAssertFalse(result.containsProfanity)
        XCTAssertTrue(result.profanities.count == 0)
    }
    
    func testl33tSpeakCharacters() {
        let result = ProfanityFilter(blackList: BlackList.defaultList).containsProfanity(text: "shi+")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("shi+"))
    }

    static var allTests = [
        ("testExample", testFindingSingleWord),
    ]
}
