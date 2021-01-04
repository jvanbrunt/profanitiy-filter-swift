import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Profanity_FilterTests.allTests),
    ]
}
#endif
