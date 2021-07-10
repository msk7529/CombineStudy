//
//  Utils.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/01.
//

import Foundation
import UIKit

public class commonBtn: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(title: String, frame: CGRect = .zero) {
        self.init(frame: frame)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemRed
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class TimeLogger: TextOutputStream {
    private var previous: Date = .init()
    private let formatter = NumberFormatter()
    
    init() {
        formatter.maximumFractionDigits = 5
        formatter.minimumFractionDigits = 5
    }
    
    public func write(_ string: String) {
        let trimmed: String = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmed.isEmpty else { return }
        
        let now: Date = .init()
        print("+\(formatter.string(for: now.timeIntervalSince(previous))!)s: \(string)")
        
        previous = now
    }
}


public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
