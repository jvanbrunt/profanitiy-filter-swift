import XCTest
@testable import Profanity_Filter

final class ProfanityFilterTests: XCTestCase {
    
    func testFindingSingleWord()  {
        let result = ProfanityFilter().containsProfanity(text: "shit")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("shit"))
    }
    
    func testFindingSingleWordUppercased() {
        let result = ProfanityFilter().containsProfanity(text: "SHIT")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("SHIT"))
    }
    
    func testFindMultipleProfanities() {
        let result = ProfanityFilter().containsProfanity(text: "SHIT FUCK")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("SHIT"))
        XCTAssertTrue(result.profanities.contains("FUCK"))
    }
    
    func testFindMultiWord() {
        let result = ProfanityFilter().containsProfanity(text: "shithappenspoop")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("poop"))
        XCTAssertTrue(result.profanities.contains("shit"))
    }
    
    func testNoProfanity() {
        let result = ProfanityFilter().containsProfanity(text: "Nothing happens")
        XCTAssertFalse(result.containsProfanity)
        XCTAssertTrue(result.profanities.count == 0)
    }
    
    func testl33tSpeakCharacters() {
        let result = ProfanityFilter().containsProfanity(text: "shi+")
        XCTAssertTrue(result.containsProfanity)
        XCTAssertTrue(result.profanities.contains("shi+"))
    }
    
    func testMaskingSingleWord() {
        let result = ProfanityFilter().maskProfanity(text: "shit")
        XCTAssertTrue(result == "****")
    }
    
    func testMaskingMultiWord() {
        let result = ProfanityFilter().maskProfanity(text: "shit happens")
        XCTAssertTrue(result == "**** happens")
    }

    static var allTests = [
        ("testExample", testFindingSingleWord),
    ]
}
