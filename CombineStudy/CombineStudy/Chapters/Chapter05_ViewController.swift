//
//  Chapter05_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/05.
//

import UIKit
import Combine

final class Chapter05_ViewController: UIViewController {

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
        self.navigationItem.title = "Chapter05"
        
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
extension Chapter05_ViewController {
    
    private func prependOutput() {
        // prepend: upstream??? ??? ?????? ?????? ????????????.
        example(of: "prepend(Output...)") {
            let publisher = [3, 4].publisher
            
            publisher
                .prepend(1, 2)  // ??? ?????? 1,2 ?????? -> 1,2,3,4
                .prepend(-1, 0) // ??? ?????? -1, 0 ?????? -> -1, 0, 1, 2, 3, 4
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prependSequence() {
        example(of: "prepend(Sequence)") {
            let publisher = [5, 6, 7].publisher
            
            publisher
                .prepend([3, 4])
                .prepend(Set(1...2))    // Set?????? ????????? ??????????????? ?????? ?????????.
                .prepend(stride(from: 6, to: 11, by: 2))
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prependPublisher() {
        // ????????? publisher??? ?????? ?????? publisher??? ?????? ?????? ?????????.
        example(of: "prepend(Publisher)") {
            let publisher1 = [3, 4].publisher
            let publihser2 = [1, 2].publisher
            
            publisher1
                .prepend(publihser2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
        
        example(of: "prepend(Publisher) #2") {
            let publisher1 = [3, 4].publisher
            let publisher2 = PassthroughSubject<Int, Never>()
            
            publisher1
                .prepend(publisher2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publisher2.send(1)
            publisher2.send(2)
            
            publisher2.send(completion: .finished)  // ?????? ???????????? publisher1??? ????????? ????????????.
            // prepending??? ?????????????????? ??????, ?????? publisher??? ?????? ????????? ??? ????????? ???????????? ??????.
        }
    }
    
    private func appendOutput() {
        // append: upstream??? ??? ?????? ?????? ????????????.
        example(of: "append(Output...)") {
            let publisher = [1].publisher
            
            publisher
                .append(2, 3)
                .append(4)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
        
        example(of: "append(Output...) #2") {
            let publiser = PassthroughSubject<Int, Never>()
            
            publiser
                .append(3, 4)
                .append(5)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publiser.send(1)
            publiser.send(2)
            
            publiser.send(completion: .finished)    // ?????? ???????????? append??? ????????? ????????????.
            // ???, publisher??? ?????? ???????????? ????????? ????????? append??? ???????????? ?????????.
        }
    }
    
    private func appendSequence() {
        example(of: "append(Sequence)") {
            let publisher = [1, 2, 3].publisher
            
            publisher
                .append([4, 5])
                .append(Set([6, 7]))    // ?????? ?????? ?????? ??????.
                .append(stride(from: 8, to: 11, by: 2))
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func appendPublisher() {
        example(of: "append(Publisher)") {
            let publisher1 = [1, 2].publisher
            let publisher2 = [3, 4].publisher
            
            publisher1
                .append(publisher2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func switchToLatest() {
        // switchToLatest: entire publisher??? ?????? ????????? publihser??? ??????.
        example(of: "switchToLatest") {
            let publisher1 = PassthroughSubject<Int, Never>()
            let publisher2 = PassthroughSubject<Int, Never>()
            let publisher3 = PassthroughSubject<Int, Never>()
            
            let publihser = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()
            
            publihser
                .switchToLatest()   // ?????? publihser??? send??? ????????? ?????? publisher??? ???????????? ?????? ????????? ????????????.
                .sink(receiveCompletion: { _ in print("Completed!") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publihser.send(publisher1)
            publisher1.send(1)
            publisher1.send(2)
            
            publihser.send(publisher2)
            publisher1.send(3)  // ?????????
            publisher2.send(4)
            publisher2.send(5)
            
            publihser.send(publisher3)
            publisher2.send(6)  // ?????????
            publisher3.send(7)
            publisher3.send(8)
            publisher3.send(9)

            publisher3.send(completion: .finished)
            publihser.send(completion: .finished)
        }
    }
    
    private func switchToLatestNetworkRequest() {
        let url = URL(string: "https://source.unsplash.com/random")!
        
        func getImage() -> AnyPublisher<UIImage?, Never> {
            URLSession.shared
                .dataTaskPublisher(for: url)
                .map { data, _ in UIImage(data: data) }
                .print("image")
                .replaceError(with: nil)
                .eraseToAnyPublisher()
        }
        
        let taps = PassthroughSubject<Void, Never>()
        
        taps
            .map { _ in getImage() }
            .switchToLatest()
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
        
        taps.send()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            taps.send() // ??? ????????? ?????? ????????? ????????? ?????? ????????????.
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            taps.send()
        }
    }
    
    private func mergeWith() {
        // merge(with:): ????????? ????????? publisher??? ????????? interleave ??????. ?????? 8????????? ????????????.
        example(of: "merge(with:)") {
            let publisher1 = PassthroughSubject<Int, Never>()
            let publisher2 = PassthroughSubject<Int, Never>()
            
            publisher1
                .merge(with: publisher2)
                .sink(receiveCompletion: { _ in print("Completed") }, receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publisher1.send(1)
            publisher1.send(2)
            
            publisher2.send(3)
            
            publisher1.send(4)
            
            publisher2.send(5)
            
            publisher1.send(completion: .finished)
            publisher2.send(completion: .finished)
        }
    }
    
    private func combineLatest() {
        // combineLatest: ?????? publisher(????????? ????????? ????????????)??? ????????? ?????? ??? ?????? ??????????????? ?????? tuple????????? ????????????.
        // ?????? Publihser?????? ????????? ????????? ?????? ???????????? combineLatest??? ????????? ??? ??????.
        // ???????????? ??? ???????????? ??? ???.
        example(of: "combineLatest") {
            let publisher1 = PassthroughSubject<Int, Never>()
            let publisher2 = PassthroughSubject<String, Never>()
            
            publisher1
                .combineLatest(publisher2)
                .sink(receiveCompletion: { _ in print("Completed") }, receiveValue: {
                    print("P1: \($0), P2: \($1)")
                })
                .store(in: &subscriptions)
            
            publisher1.send(1)
            publisher1.send(2)
            
            publisher2.send("a")
            publisher2.send("b")
            
            publisher1.send(3)
            
            publisher2.send("c")
            
            publisher1.send(completion: .finished)
            publisher2.send(completion: .finished)
        }
    }
    
    private func zip() {
        // zip: ?????? Publisher?????? ????????? ????????? ???????????? ?????? ???????????? tuple????????? ????????????.
        example(of: "zip") {
            let publisher1 = PassthroughSubject<Int, Never>()
            let publisher2 = PassthroughSubject<String, Never>()
            
            publisher1
                .zip(publisher2)
                .sink(receiveCompletion: { _ in print("Completed") }, receiveValue: {
                    print("P1: \($0), P2: \($1)")
                })
                .store(in: &subscriptions)
            
            publisher1.send(1)
            publisher1.send(2)
            
            publisher2.send("a")
            publisher2.send("b")
            
            publisher1.send(3)
            
            publisher2.send("c")
            publisher2.send("d")    // ??? ?????? ?????? ????????? ????????? ???????????? ??????.
            
            publisher1.send(completion: .finished)
            publisher2.send(completion: .finished)
        }
    }
}

// - MARK: Button Actions
extension Chapter05_ViewController {

    @objc private func didTapFirstEx() {
        prependOutput()
    }
    
    @objc private func didTapSecondEx() {
        prependSequence()
    }
    
    @objc private func didTapThirdEx() {
        prependPublisher()
    }
    
    @objc private func didTapFourthEx() {
        appendOutput()
    }
    
    @objc private func didTapFifthEx() {
        appendSequence()
    }
    
    @objc private func didTapSixthEx() {
        appendPublisher()
    }
    
    @objc private func didTapSeventhEx() {
        switchToLatest()
    }
    
    @objc private func didTapEighthEx() {
        switchToLatestNetworkRequest()
    }
    
    @objc private func didTapNinethEx() {
        mergeWith()
    }
    
    @objc private func didTapTenthEx() {
        combineLatest()
    }
    
    @objc private func didTapEleventhEx() {
        zip()
    }
}
