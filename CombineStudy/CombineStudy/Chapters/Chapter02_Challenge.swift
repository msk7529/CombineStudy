//
//  Chapter02_Challenge.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/04.
//

import Foundation

public let cards: [Card] = [
    ("🂡", 11), ("🂢", 2), ("🂣", 3), ("🂤", 4), ("🂥", 5), ("🂦", 6), ("🂧", 7), ("🂨", 8), ("🂩", 9), ("🂪", 10), ("🂫", 10), ("🂭", 10), ("🂮", 10),
    ("🂱", 11), ("🂲", 2), ("🂳", 3), ("🂴", 4), ("🂵", 5), ("🂶", 6), ("🂷", 7), ("🂸", 8), ("🂹", 9), ("🂺", 10), ("🂻", 10), ("🂽", 10), ("🂾", 10),
    ("🃁", 11), ("🃂", 2), ("🃃", 3), ("🃄", 4), ("🃅", 5), ("🃆", 6), ("🃇", 7), ("🃈", 8), ("🃉", 9), ("🃊", 10), ("🃋", 10), ("🃍", 10), ("🃎", 10),
    ("🃑", 11), ("🃒", 2), ("🃓", 3), ("🃔", 4), ("🃕", 5), ("🃖", 6), ("🃗", 7), ("🃘", 8), ("🃙", 9), ("🃚", 10), ("🃛", 10), ("🃝", 10), ("🃞", 10)
]

public typealias Card = (String, Int)
public typealias Hand = [Card]

public extension Hand {
    var cardString: String {
        map { $0.0 }.joined()
    }
    
    var points: Int {
        map { $0.1 }.reduce(0, +)
    }
}

public enum HandError: Error, CustomStringConvertible {
    case busted
    
    public var description: String {
        switch self {
        case .busted:
            return "Busted!"
        }
    }
}
