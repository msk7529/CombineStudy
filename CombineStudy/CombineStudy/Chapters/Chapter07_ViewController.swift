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
    
    private lazy var eighthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "eighthEx")
        button.addTarget(self, action: #selector(didTapEighthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var ninethExBtn: commonBtn = {
        let button: commonBtn = .init(title: "ninethEx")
        button.addTarget(self, action: #selector(didTapNinethEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var tenthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "tenthEx")
        button.addTarget(self, action: #selector(didTapTenthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var eleventhExBtn: commonBtn = {
        let button: commonBtn = .init(title: "eleventhEx")
        button.addTarget(self, action: #selector(didTapEleventhEx), for: .touchUpInside)
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
        self.view.addSubview(eighthExBtn)
        self.view.addSubview(ninethExBtn)
        self.view.addSubview(tenthExBtn)
        self.view.addSubview(eleventhExBtn)
        
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
        
        eighthExBtn.topAnchor.constraint(equalTo: seventhExBtn.topAnchor).isActive = true
        eighthExBtn.leadingAnchor.constraint(equalTo: seventhExBtn.trailingAnchor, constant: 30).isActive = true
        eighthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eighthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ninethExBtn.topAnchor.constraint(equalTo: eighthExBtn.topAnchor).isActive = true
        ninethExBtn.leadingAnchor.constraint(equalTo: eighthExBtn.trailingAnchor, constant: 30).isActive = true
        ninethExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ninethExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tenthExBtn.topAnchor.constraint(equalTo: seventhExBtn.bottomAnchor, constant: 30).isActive = true
        tenthExBtn.leadingAnchor.constraint(equalTo: seventhExBtn.leadingAnchor).isActive = true
        tenthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tenthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        eleventhExBtn.topAnchor.constraint(equalTo: tenthExBtn.topAnchor).isActive = true
        eleventhExBtn.leadingAnchor.constraint(equalTo: tenthExBtn.trailingAnchor, constant: 30).isActive = true
        eleventhExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eleventhExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    private func count() {
        // count: upstream에서 내보내진 값들의 개수를 내보낸다.
        example(of: "count") {
            let publisher = ["A", "B", "C"].publisher
            
            publisher
                .print("publisher")
                .count()
                .sink { print("I have \($0) items") }
                .store(in: &subscriptions)
        }
    }
    
    private func contains() {
        // contains: upstream에서 내보낸 값들중 특정값이 존재하면 true 리턴 후 구독 취소, 아니면 false리턴
        example(of: "contains") {
            let publisher = ["A", "B", "C", "D", "E"].publisher
            let letter = "C"
            
            publisher
                .print("publisher")
                .contains(letter)
                .sink(receiveValue: { contains in
                    print(contains ? "Publisher emitted \(letter)!"
                            : "Publisher never emitted \(letter)!")
                })
                .store(in: &subscriptions)
        }
        
        example(of: "contains(where:)") {
            struct Person {
                let id: Int
                let name: String
            }
            
            let people = [
                (456, "Scott Gardner"),
                (123, "Shai Mishali"),
                (777, "Marin Todorov"),
                (214, "Florent Pillet")
            ]
            .map(Person.init)
            .publisher
            
            people
                .contains(where: { $0.id == 800 })
                .sink(receiveValue: { contains in
                    // 4
                    print(contains ? "Criteria matches!"
                            : "Couldn't find a match for the criteria")
                })
                .store(in: &subscriptions)
        }
    }
    
    private func allSatisfy() {
        // allSatisfy: upstream의 값들이 조건과 모두 일치하는지 여부를 bool값으로 내보낸다. greedy로 동작하며 upstream publisher가 finish 이벤트를 내보낼때까지 기다린다. 하나의 값이라도 조건을 통과하지 못하면 false를 내보내고 그 즉시 구독을 취소한다.
        example(of: "allSatisfy") {
            let publisher = stride(from: 0, to: 5, by: 2).publisher
            
            publisher
                .print("publisher")
                .allSatisfy { $0 % 2 == 0 }
                .sink { allEven in
                    print(allEven ? "All numbers are even" : "Something is odd...")
                }
                .store(in: &subscriptions)
        }
    }
    
    private func reduce() {
        // 3챕터의 scan과 비슷하다. 하지만 scan은 축적된 값을 매번 내보내는 반면, reduce는 upstream publisher가 finished 이벤트를 받았을 때 딱 한번 축적된 값을 내보낸다.
        example(of: "reduce") {
            let publisher = ["Hel", "lo", " ", "Wor", "ld", "!"].publisher
            
            publisher
                .print("publisher")
                .reduce("") { accumulator, value in
                    accumulator + value
                }
                // .reduce("", +) 위와 동일.
                .sink(receiveValue: { print("Reduced into: \($0)") })
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
    
    @objc private func didTapEighthEx() {
        count()
    }
    
    @objc private func didTapNinethEx() {
        contains()
    }
    
    @objc private func didTapTenthEx() {
        allSatisfy()
    }
    
    @objc private func didTapEleventhEx() {
        reduce()
    }
}

