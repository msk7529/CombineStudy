//
//  Chapter04_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/04.
//

import UIKit
import Combine

final class Chapter04_ViewController: UIViewController {

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
    
    private lazy var fourthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "fourthEx")
        button.addTarget(self, action: #selector(didTapFourthEx), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter04"
        
        self.initView()
    }
    
    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(secondExBtn)
        self.view.addSubview(thirdExBtn)
        self.view.addSubview(fourthExBtn)
        
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
        
        fourthExBtn.topAnchor.constraint(equalTo: firstExBtn.bottomAnchor, constant: 30).isActive = true
        fourthExBtn.leadingAnchor.constraint(equalTo: firstExBtn.leadingAnchor).isActive = true
        fourthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fourthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter04_ViewController {
    
    private func filter() {
        example(of: "filter") {
            let numbers = (1...10).publisher
            
            numbers
                .filter { $0.isMultiple(of: 3) }
                .sink { num in
                    print("\(num) is a multiple of 3!")
                }
                .store(in: &subscriptions)
        }
    }
    
    private func removeDuplicates() {
        // removeDuplicates: Equtable 프로토콜을 준수하는 모든 값에 대해 자동으로 동작
        example(of: "removeDuplicates") {
            let words = "hey hey there! want to listen to mister mister ?"
                .components(separatedBy: " ")
                .publisher
            
            words.removeDuplicates()
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func compactMap() {
        let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher
        
        strings
            .compactMap { Float($0) }
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
    }
    
    private func ignoreOutput() {
        // ignoreOutput: subscriber에게 완료이벤트만 전달한다.
        example(of: "ignoreOutput") {
            let numbers = (1...10000).publisher
            
            numbers
                .ignoreOutput()
                .sink(receiveCompletion: { print("Completed with: \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter04_ViewController {
    
    @objc private func didTapFirstEx() {
        filter()
    }
    
    @objc private func didTapSecondEx() {
        removeDuplicates()
    }
    
    @objc private func didTapThirdEx() {
        compactMap()
    }
    
    @objc private func didTapFourthEx() {
        ignoreOutput()
    }
}

