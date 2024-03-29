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
    
    private lazy var fifthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "fifthEx")
        button.addTarget(self, action: #selector(didTapFifthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var sixthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "sixthEx")
        button.addTarget(self, action: #selector(didTapsixthEx), for: .touchUpInside)
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
    
    private lazy var tweleveExBtn: commonBtn = {
        let button: commonBtn = .init(title: "tweleveEx")
        button.addTarget(self, action: #selector(didTapTwelveEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var challengeBtn: commonBtn = {
        let button: commonBtn = .init(title: "challenge")
        button.addTarget(self, action: #selector(didTapChallenge), for: .touchUpInside)
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
        self.view.addSubview(fifthExBtn)
        self.view.addSubview(sixthExBtn)
        self.view.addSubview(seventhExBtn)
        self.view.addSubview(eighthExBtn)
        self.view.addSubview(ninethExBtn)
        self.view.addSubview(tenthExBtn)
        self.view.addSubview(eleventhExBtn)
        self.view.addSubview(tweleveExBtn)
        self.view.addSubview(challengeBtn)
        
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
        
        tweleveExBtn.topAnchor.constraint(equalTo: eleventhExBtn.topAnchor).isActive = true
        tweleveExBtn.leadingAnchor.constraint(equalTo: eleventhExBtn.trailingAnchor, constant: 30).isActive = true
        tweleveExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tweleveExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        challengeBtn.topAnchor.constraint(equalTo: tenthExBtn.bottomAnchor, constant: 30).isActive = true
        challengeBtn.leadingAnchor.constraint(equalTo: tenthExBtn.leadingAnchor).isActive = true
        challengeBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        challengeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    private func first() {
        example(of: "first(where:)") {
            // first(where:): publisher가 내보낸 출력중 where에 만족하는 첫번째를 찾으면 subscription을 통해 cancel을 전송하여 업스트림이 값을 내보내는 것을 중지시킨다.
            let numbers = (1...9).publisher
            
            numbers
                .print("number")
                .first(where: { $0 % 2 == 0 })
                .sink(receiveCompletion: { print("Completed with: \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func last() {
        // last(where:): first와는 달리 pubisher가 내보내는 모든 값들을 기다려야 한다. 이런 이유때문에, upstream publisher은 어느시점에서 완료되는 publiser 이어야 한다.
        example(of: "last(where:)") {
            let numbers = (1...9).publisher
            
            numbers
                .last(where: { $0 % 2 == 0 })
                .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
        
        example(of: "last(where:)") {
            let numbers = PassthroughSubject<Int, Never>()
            
            numbers
                .last(where: { $0 % 2 == 0 })
                .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            numbers.send(1)
            numbers.send(2)
            numbers.send(3)
            numbers.send(4)
            numbers.send(5)
            
            numbers.send(completion: .finished) // 이걸 수행하지 않으면 아무것도 출력되지 않는다.
        }
    }
    
    private func dropFirst() {
        example(of: "dropFirst") {
            // dropFirst: 처음 n개의 출력값을 무시한다.
            let numbers = (1...10).publisher
            
            numbers
                .dropFirst(8)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func dropWhile() {
        example(of: "drop(while:)") {
            // drop(while:): while 조건이 처음 false인 때부터 출력값이 stream을 통해 흐르기 시작한다.
            // 출력값이 stream을 통해 흐르기 시작하면, 다시는 drop 클로저가 실행되지 않는다.
            let numbers = (1...10).publisher
            
            numbers
                .drop(while: {
                    print("x")
                    return $0 % 5 != 0
                })
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func dropUntilOutputFrom() {
        // drop(untilOutputFrom:): 특정 publisher가 값을 내보내기 전까지는 upstream의 값들을 무시한다.
        example(of: "drop(untilOutputFrom") {
            let isReady = PassthroughSubject<Void, Never>()
            let taps = PassthroughSubject<Int, Never>()
            
            taps
                .drop(untilOutputFrom: isReady)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            (1...5).forEach {
                taps.send($0)
                
                if $0 == 3 {
                    isReady.send()
                }
            }
        }
    }
    
    private func prefix() {
        // prefix: upstream 에서 처음 n개의 값만 출력하고 publisher는 완료된다. dropFirst와 반대 개념
        example(of: "prefix") {
            let numbers = (1...10).publisher
            
            numbers
                .prefix(2)
                .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prefixWhile() {
        // prefix(while:): where 조건이 처음 false가 되면 더이상의 값을 내보내지 않고 완료된다. dropWhile과 반대 개념.
        example(of: "prefix(while:)") {
            let numbers = (1...10).publisher
            
            numbers
                .prefix(while: { $0 < 3 })
                .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prefixUntilOutputFrom() {
        // prefix(untilOutputFrom:): 특정 publisher가 값을 내보내면 더이상의 upstream 값들을 내보내지 않고 완료한다.
        example(of: "prefix(untilOutputFrom:)") {
            let isReady = PassthroughSubject<Void, Never>()
            let taps = PassthroughSubject<Int, Never>()
            
            taps
                .prefix(untilOutputFrom: isReady)
                .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            (1...5).forEach {
                taps.send($0)
                
                if $0 == 2 {
                    isReady.send()
                }
            }
        }
    }
    
    private func challenge() {
        example(of: "Challenge: Filter all the things") {
            let numbers = (1...100).publisher
            
            numbers
                .dropFirst(50)
                .prefix(20)
                .filter { $0.isMultiple(of: 2) }
                .collect()
                .sink(receiveValue: { print($0) })
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
    
    @objc private func didTapFifthEx() {
        first()
    }
    
    @objc private func didTapsixthEx() {
        last()
    }
    
    @objc private func didTapSeventhEx() {
        dropFirst()
    }
    
    @objc private func didTapEighthEx() {
        dropWhile()
    }
    
    @objc private func didTapNinethEx() {
        dropUntilOutputFrom()
    }
    
    @objc private func didTapTenthEx() {
        prefix()
    }
    
    @objc private func didTapEleventhEx() {
        prefixWhile()
    }
    
    @objc private func didTapTwelveEx() {
        prefixUntilOutputFrom()
    }
    
    @objc private func didTapChallenge() {
        challenge()
    }
}

