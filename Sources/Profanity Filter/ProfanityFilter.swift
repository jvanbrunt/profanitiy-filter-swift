
import Foundation

public class ProfanityFilter {
    
    private let blackList: [String]
    
    private let whiteList: [String]?
    
    public init(blackList: [String], whiteList: [String]? = nil) {
        self.blackList = blackList
        self.whiteList = whiteList
    }
    
    public func containsProfanity(text: String) -> ProfanityResult {
        do {
            let regex = try NSRegularExpression(pattern: "[^!@#$%^&*]*\(getProfanityList().map { "(\(NSRegularExpression.escapedPattern(for: $0)))" } .joined(separator: "|"))[^!@#$%^&*]*", options: [.caseInsensitive])
            let matches = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return ProfanityResult(profanities: matches.map {
                String(text[Range($0.range, in: text)!])
            })
        } catch _ {
            return ProfanityResult(profanities: [])
        }
    }
    
    private func getProfanityList() -> [String] {
        if let whiteList = self.whiteList {
            var blackList = Array(self.blackList)
            blackList.removeAll { whiteList.contains($0) }
            return blackList
        }
        
        return self.blackList
    }
}

public struct ProfanityResult {
    
    public var containsProfanity: Bool {
        return profanities.count > 0
    }
    
    public let profanities: [String]
}
