//
//  Chapter12_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/12.
//

import UIKit
import Combine

final class Chapter12_ViewController: UIViewController {

    private lazy var firstExBtn: commonBtn = {
        let button: commonBtn = .init(title: "firstEx")
        button.addTarget(self, action: #selector(didTapFirstEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondExBtn: commonBtn = {
        let button: commonBtn = .init(title: "secondEx")
        button.addTarget(self, action: #selector(didTapSecondEx), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter12"
        
        self.initView()
    }

    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(secondExBtn)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondExBtn.topAnchor.constraint(equalTo: firstExBtn.topAnchor).isActive = true
        secondExBtn.leadingAnchor.constraint(equalTo: firstExBtn.trailingAnchor, constant: 30).isActive = true
        secondExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter12_ViewController {
    
    private func operationQueue() {
        example(of: "OperationQueue") {
            let queue = OperationQueue()
            
            queue.publisher(for: \.operationCount)
                // operationqueue에 새 작업이 추가될 때마다 subscription이 생성된다.
                .sink {
                    print("Outstanding operations in queue: \($0)")
                }
                .store(in: &subscriptions)
        }
    }
    
    private func KVOcompliantProperties() {
        example(of: "KVO-compliant properties") {
            class TestObject: NSObject {
                // KVO를 사용하기 위해 NSObject를 상속
                @objc dynamic var integerProperty: Int = 0 // 관찰하고 싶은 프로퍼티에 @objc dynamic 키워드를 붙인다.
            }
            
            let obj = TestObject()
            
            obj.publisher(for: \.integerProperty, options: [])  // 초기값은 내보내지 않는다.
                // options
                // .initial: 초기값을 내보낸다.
                // .prior: 변경이 발생하면 이전값과 새 값을 모두 내보낸다.
                // .old, .new: 그냥 새로운 값을 내보낸다.
                .sink { print("integerProperty changes to \($0)") }
                .store(in: &subscriptions)
            
            obj.integerProperty = 100
            obj.integerProperty = 200
        }
    }
}

// - MARK: Button Actions
extension Chapter12_ViewController {
    
    @objc private func didTapFirstEx() {
        operationQueue()
    }
    
    @objc private func didTapSecondEx() {
        KVOcompliantProperties()
    }
}
