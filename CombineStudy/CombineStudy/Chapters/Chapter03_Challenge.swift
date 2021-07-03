//
//  Chapter03_Challenge.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/04.
//

import Foundation

final class Chapter03_Challenge {
    
    class func convert(phoneNumber: String) -> Int? {
        if let number = Int(phoneNumber), number < 10 {
            return number
        }
        
        let keyMap: [String: Int] = [
            "abc": 2, "def": 3, "ghi": 4,
            "jkl": 5, "mno": 6, "pqrs": 7,
            "tuv": 8, "wxyz": 9
        ]
        
        let converted = keyMap
            .filter { $0.key.contains(phoneNumber.lowercased()) }
            .map { $0.value }
            .first
        
        return converted
    }
    
    class func format(digits: [Int]) -> String {
        var phone: String = digits.map { String($0) }.joined()
        
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: 3))
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: 7))
        
        return phone
    }
    
    class func dial(phoneNumber: String) -> String {
        let contacts: [String: String] = [
            "603-555-1234": "Florent",
            "408-555-4321": "Marin",
            "217-555-1212": "Scott",
            "212-555-3434": "Shai"
        ]
        
        guard let contact = contacts[phoneNumber] else {
            return "Contact not found for \(phoneNumber)"
        }
        
        return "Dialing \(contact) (\(phoneNumber))..."
    }
}
