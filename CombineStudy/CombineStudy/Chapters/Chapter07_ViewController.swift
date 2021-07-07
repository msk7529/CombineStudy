//
//  Chapter07_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/08.
//

import UIKit
import Combine

final class Chapter07_ViewController: UIViewController {

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
    
    private lazy var fifthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "fifthEx")
        button.addTarget(self, action: #selector(didTapFifthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var sixthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "sixthEx")
        button.addTarget(self, action: #selector(didTapSixthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var seventhExBtn: commonBtn = {
        let button: commonBtn = .init(title: "seventhEx")
        button.addTarget(self, action: #selector(didTapSeventhEx), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter07"
        
        self.initView()
    }
    
    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(secondExBtn)
        self.view.addSubview(thirdExBtn)
        self.view.addSubview(fourthExBtn)
        self.view.addSubview(fifthExBtn)
        self.view.addSubview(sixthExBtn)
        self.view.addSubview(seventhExBtn)
        
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
        
        fifthExBtn.topAnchor.constraint(equalTo: fourthExBtn.topAnchor).isActive = true
        fifthExBtn.leadingAnchor.constraint(equalTo: fourthExBtn.trailingAnchor, constant: 30).isActive = true
        fifthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fifthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sixthExBtn.topAnchor.constraint(equalTo: fourthExBtn.topAnchor).isActive = true
        sixthExBtn.leadingAnchor.constraint(equalTo: fifthExBtn.trailingAnchor, constant: 30).isActive = true
        sixthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sixthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        seventhExBtn.topAnchor.constraint(equalTo: fourthExBtn.bottomAnchor, constant: 30).isActive = true
        seventhExBtn.leadingAnchor.constraint(equalTo: fourthExBtn.leadingAnchor).isActive = true
        seventhExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        seventhExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter07_ViewController {
    
    private func min() {
        // min: publisher의 upstream 값들 중 가장 작은 값을 내보낸다. gready라 publisher가 finished 이벤트를 보낼때까지 기다렸다가 값을 내보낸다. 값들이 Comparable protocol을 준수하지 않는다면, min(by:) operator을 사용해야 한다.
        example(of: "min") {
            let publisher = [1, -50, 246, 0].publisher
            
            publisher
                .print("publisher")
                .min()
                .sink { print("Lowest value is \($0)") }
                .store(in: &subscriptions)
        }
    }
    
    private func minNonComparable() {
        example(of: "min non-Comparable") {
            let publisher = ["12345", "ab", "hello world"]
                .compactMap { $0.data(using: .utf8) }   // [Data]
                .publisher
            
            publisher
                .print("publisher")
                .min(by: { $0.count < $1.count })
                .sink { data in
                    let string = String(data: data, encoding: .utf8)!
                    print("Smallest data is \(string), \(data.count) bytes")
                }
                .store(in: &subscriptions)
        }
    }
 
    private func max() {
        // max: 최대값을 내보낸다는 차이를 제외하고 min과 동일
        example(of: "max") {
            let publisher = ["A", "F", "Z", "E"].publisher
            
            publisher
                .print("publisher")
                .max()
                .sink { print("Highest value is \($0)") }
                .store(in: &subscriptions)
        }
    }
    
    private func first() {
        // first: upstream의 값들 중 가장 첫번째를 내보내고 난 뒤 즉시 구독을 취소한다. lazy로 동작.
        example(of: "first") {
            let publisher = ["A", "B", "C"].publisher
            
            publisher
                .print("publisher")
                .first()
                .sink { print("First value is \($0)") }
                .store(in: &subscriptions)
        }
        
        example(of: "first(where:)") {
            let publisher = ["J", "O", "H", "N"].publisher
            
            publisher
                .print("publisher")
                .first(where: { "Hello World".contains($0) })
                .sink { print("First match is \($0)") }
                .store(in: &subscriptions)
        }
    }
    
    private func last() {
        // last: upstream의 값들 중 가장 마지막 값을 내보낸다. greedy로 동작.
        example(of: "last") {
            let publisher = ["A", "B", "C"].publisher
            
            publisher
                .print("publisher")
                .last()
                .sink { print("Last value is \($0)") }
                .store(in: &subscriptions)
        }
    }
    
    private func outputAt() {
        // output(at:): upstream에서 지정된 인덱스에서 내보내진 값을 내보낸다.
        example(of: "output(at:)") {
            let publisher = ["A", "B", "C"].publisher
            
            publisher
                .print("publisher")
                .output(at: 1)
                .sink(receiveValue: { print("Value at index 1 is \($0)") })
                .store(in: &subscriptions)
        }
    }
    
    private func outputIn() {
        // output(in:): upstream에서 지정된 인덱스 범위에 포함된 값들만 개별적으로 내보낸다.
        example(of: "output(in:)") {
            let publisher = ["A", "B", "C", "D", "E"].publisher
            
            publisher
                .output(in: 1...3)
                .sink(receiveCompletion: { print($0) }, receiveValue: { print("Value in range: \($0)") })
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter07_ViewController {
    
    @objc private func didTapFirstEx() {
        min()
    }
    
    @objc private func didTapSecondEx() {
        minNonComparable()
    }
    
    @objc private func didTapThirdEx() {
        max()
    }
    
    @objc private func didTapFourthEx() {
        first()
    }
    
    @objc private func didTapFifthEx() {
        last()
    }
    
    @objc private func didTapSixthEx() {
        outputAt()
    }
    
    @objc private func didTapSeventhEx() {
        outputIn()
    }
}

