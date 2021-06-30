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


public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
