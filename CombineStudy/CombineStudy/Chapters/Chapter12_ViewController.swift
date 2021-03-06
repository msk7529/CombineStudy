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
    
    private lazy var thirdExBtn: commonBtn = {
        let button: commonBtn = .init(title: "thirdEx")
        button.addTarget(self, action: #selector(didTapThirdEx), for: .touchUpInside)
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
        self.view.addSubview(thirdExBtn)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondExBtn.topAnchor.constraint(equalTo: firstExBtn.topAnchor).isActive = true
        secondExBtn.leadingAnchor.constraint(equalTo: firstExBtn.trailingAnchor, constant: 30).isActive = true
        secondExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        thirdExBtn.topAnchor.constraint(equalTo: firstExBtn.topAnchor).isActive = true
        thirdExBtn.leadingAnchor.constraint(equalTo: secondExBtn.trailingAnchor, constant: 30).isActive = true
        thirdExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thirdExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter12_ViewController {
    
    private func operationQueue() {
        example(of: "OperationQueue") {
            let queue = OperationQueue()
            
            queue.publisher(for: \.operationCount)
                // operationqueue??? ??? ????????? ????????? ????????? subscription??? ????????????.
                .sink {
                    print("Outstanding operations in queue: \($0)")
                }
                .store(in: &subscriptions)
        }
    }
    
    private func KVOcompliantProperties() {
        example(of: "KVO-compliant properties") {
            class TestObject: NSObject {
                // KVO??? ???????????? ?????? NSObject??? ??????
                @objc dynamic var integerProperty: Int = 0 // ???????????? ?????? ??????????????? @objc dynamic ???????????? ?????????.
            }
            
            let obj = TestObject()
            
            obj.publisher(for: \.integerProperty, options: [])  // ???????????? ???????????? ?????????.
                // options
                // .initial: ???????????? ????????????.
                // .prior: ????????? ???????????? ???????????? ??? ?????? ?????? ????????????.
                // .old, .new: ?????? ????????? ?????? ????????????.
                .sink { print("integerProperty changes to \($0)") }
                .store(in: &subscriptions)
            
            obj.integerProperty = 100
            obj.integerProperty = 200
        }
    }
    
    private func observableObject() {
        example(of: "ObservableObject") {
            class MonitorObject: ObservableObject {
                @Published var someProperty: Bool = false
                @Published var someOtherProperty: String = ""
            }
            
            let object = MonitorObject()
            
            object
                .objectWillChange
                .sink { print("object will change") }
                // ?????? ??????????????? ????????? ??????????????? ??? ??? ??????.
                // viewModel??? ???????????? view??? ???????????? ??? ??? ????????? ???
                .store(in: &subscriptions)
            
            object.someProperty = true  // false??? ???????????? object??? ????????? ?????? ????????????.
            object.someOtherProperty = "Hello world"
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
    
    @objc private func didTapThirdEx() {
        observableObject()
    }
}
