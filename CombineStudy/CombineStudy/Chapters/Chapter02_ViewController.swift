//
//  Chapter02_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/01.
//

import UIKit
import Combine

final class Chapter02_ViewController: UIViewController {

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
    
    private lazy var challengeBtn: commonBtn = {
        let button: commonBtn = .init(title: "challenge")
        button.addTarget(self, action: #selector(didTapChallenge), for: .touchUpInside)
        return button
    }()
    
    private let notiName: Notification.Name = .init("MyNotification")
    private var subscriptions: Set<AnyCancellable> = .init()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter02"
        
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
        
        challengeBtn.topAnchor.constraint(equalTo: eleventhExBtn.topAnchor).isActive = true
        challengeBtn.leadingAnchor.constraint(equalTo: eleventhExBtn.trailingAnchor, constant: 30).isActive = true
        challengeBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        challengeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter02_ViewController {
    
    private func helloPublisher() {
        // ??? ????????? publisher??? ????????? ?????????, ?????? noti??? ????????? publisher??? ????????? observer???.
        example(of: "Publisher") {
            let publisher: NotificationCenter.Publisher = .init(center: NotificationCenter.default, name: notiName, object: nil)
            let observer: NSObjectProtocol = NotificationCenter.default.addObserver(forName: notiName, object: nil, queue: nil) { notification in
                print("Notification received!")
            }
            
            NotificationCenter.default.post(name: notiName, object: nil)
            
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    private func helloSubscriber() {
        example(of: "Subscriber") {
            let publisher: NotificationCenter.Publisher = .init(center: NotificationCenter.default, name: notiName, object: nil)
            let subscription: AnyCancellable = publisher.sink { _ in
                // publisher??? sink??? ?????????????????? subscription??? ????????????.
                print("Notification received from a publisher!")
            }
            
            NotificationCenter.default.post(name: notiName, object: nil)
            
            subscription.cancel()
        }
    }
    
    private func justTest1() {
        example(of: "Just") {
            // Just: ????????? subscriber??? ?????? ??? ????????? ????????? emit?????? ???????????? Publisher.
            let just: Just<String> = .init("Hello World!")
            
            // sink operator??? publisher??? emit??? ?????? ????????? ?????? ?????? ??? ??????.
            // receiveValue ???????????? ?????? ????????????, ??? ?????? receiveCompletion ???????????? ????????????.
            _ = just.sink(receiveCompletion: { failure in
                print("Received completion", failure)
            }, receiveValue: {
                print("Received value", $0)
            })
        }
    }
    
    private func subscribingWithAssign() {
        example(of: "assign(to:on:)") {
            class SomeObject {
                var value: String = "" {
                    didSet {
                        print(value)
                    }
                }
            }
            
            let object: SomeObject = .init()
            let publisher: Publishers.Sequence<[String], Never> = ["Hello", "world!"].publisher
            
            // received value??? ????????? KVO??? ???????????? property??? assign ??????.
            _ = publisher.assign(to: \.value, on: object)
        }
    }
    
    private func republishingWithAssign() {
        example(of: "assign(to:)") {
            class SomeObject {
                @Published var value = 0    // value??? ?????? publisher??? ????????????, ???????????? Property?????? ????????? ??? ??????.
            }
            
            let object: SomeObject = .init()
            
            _ = object.$value.sink { print($0) }    // 0
            
            // assign(to:) operator??? AnyCancellable??? ???????????? ?????????.
            // ????????? ?????????????????? ??????????????? ????????????????????? ???????????? @Published property??? ??????????????? ???????????? subscription??? ??????????????? ??????.
            (0..<10).publisher.assign(to: &object.$value)
            
            print(object.value) // 9
            
            // assign(to:)??? assign(to:on:)??? ?????? ????????? ????????? ?????????, ????????? ?????? ????????? ??????????????? ?????? ????????? ????????? ????????? ????????? ??????.
            class MyObject {
                @Published var word: String = ""
                var subscriptions: Set<AnyCancellable> = .init()
                
                init() {
                    ["A", "B", "C"].publisher
                        .assign(to: \.word, on: self)
                        .store(in: &subscriptions)
                }
            }
            
        }
    }
    
    private func customSubscriber() {
        example(of: "Custom Subscriber") {
            let publisher = (1...6).publisher
            
            final class IntSubscriber: Subscriber {

                typealias Input = Int
                typealias Failure = Never
                
                func receive(subscription: Subscription) {
                    // publisher??? ?????? ????????????, subscriber??? ?????? 3?????? ?????? ????????? ??? ????????? ??????.
                    // ??? ???????????? ????????? ????????? receive(_ input:) ???????????? ????????????.
                    subscription.request(.max(3))
                }
                
                func receive(_ input: Int) -> Subscribers.Demand {
                    print("Received value", input)
                    /*return .none -> ????????? completion??? ???????????? ?????????.
                     publisher??? 6?????? ?????? ????????? ?????????, demand??? 3?????? ???????????? ??????.
                     .none??? .max(0)??? ??????. */
                    return .max(1)  // ???????????? ????????? ????????? max?????? 1??? ???????????????.
                }
                
                func receive(completion: Subscribers.Completion<Never>) {
                    print("Received completion", completion)
                }
            }
            
            let subscriber: IntSubscriber = .init()
            
            publisher.subscribe(subscriber)
        }
    }
    
    private func helloFuture() {
        // Future: Just?????? ?????? ???????????? ?????????????????? ????????? ?????? ????????? ??? ?????? Publisher
        example(of: "Future") {
            func futureIncrement(integer: Int, afterDelay delay: TimeInterval) -> Future<Int, Never> {
                Future<Int, Never> { promise in
                    print("Original") // subscrition??? ???????????? ????????? ???????????????, ?????? Future??? ???????????? ?????? ???????????? ??????. ???????????? publihser??? ?????? subscriber??? ???????????? ??????.
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                        promise(.success(integer + 1))
                    }
                }
            }
            
            // var subscriptions: Set<AnyCancellable> = .init() ??????????????? ???????????? ????????? print??? ????????? ??????.. ??????? -> long-running ????????? operations??? ?????? subscription??? ???????????? ?????????, ?????? ?????? ????????? ???????????? ?????? subscription??? ??????????????? ?????????, ??? ????????? ??????????????? ???????????? ????????????.

            let future = futureIncrement(integer: 1, afterDelay: 3)
            future.sink(receiveCompletion: { print($0) }, receiveValue: { print($0)} )
                .store(in: &subscriptions)
            future.sink(receiveCompletion: { print("Second", $0) }, receiveValue: { print("Second", $0) })
                .store(in: &subscriptions)
            // ?????????, ????????? subscription??? ????????? ?????? ?????????. Future??? promise??? ?????? ???????????? ?????? output??? ??????????????? replay??????. ?????? sink ??????????????? ?????????????????? ??????????????? ?????? ?????????.
        }
    }
    
    private func helloPassthroughSubject() {
        // Subject: non-Combine ????????? Combine subscriber?????? ?????? ?????? ??? ????????? ????????? ????????? ???.
        example(of: "PassthroughSubject") {
            enum MyError: Error {
                case test
            }
            
            final class StringSubscriber: Subscriber {
                typealias Input = String
                typealias Failure = MyError
                
                func receive(subscription: Subscription) {
                    subscription.request(.max(2))
                }
                
                func receive(_ input: String) -> Subscribers.Demand {
                    print("Received value", input)
                    return input == "World" ? .max(1) : .none
                }
                
                func receive(completion: Subscribers.Completion<MyError>) {
                    print("Received completion", completion)
                }
            }
            
            let subscriber = StringSubscriber()
            let subject = PassthroughSubject<String, MyError>()
            
            subject.subscribe(subscriber) // subscriber??? ??????(publisher)??? ??????.
            
            // sink??? ???????????? ????????? ????????? ??????.
            let subscription = subject.sink { completion in
                print("Received completion (sink)", completion)
            } receiveValue: { value in
                print("Received value (sink)", value)
            }
            
            subject.send("Hello")
            subject.send("World")
            
            subscription.cancel()   // ????????? ????????? ????????????.
            
            subject.send("Still there?")    // ????????? ????????? ????????????????????????, sink?????? ???????????? ??????.
            
            subject.send(completion: .failure(MyError.test)) // receive(completion:)??? ?????????
            // Publisher??? ???????????? ????????? ?????????????????? ????????? ???????????? ???????????? ???????????? ?????????.
            subject.send(completion: .finished)     // ???????????? ???????????? ??????.
            subject.send("How about another one?")  // ???????????? ???????????? ??????.
        }
    }
    
    private func helloCurrentValueSubject() {
        var subscriptions = Set<AnyCancellable>()   // Set??? ????????? ???????????? Set??? ??????????????? ????????????, ???, ????????? ????????? ???????????? ???????????? ????????????.
        
        let subject: CurrentValueSubject<Int, Never> = .init(0)
        
        subject
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
        
        subject.send(1)
        subject.send(2)
        
        print(subject.value)    // passthrough subject??? ??????, current value??? subject??? ????????? ??? ??????.
        
        subject.value = 3   // send ????????? ???????????? ????????? ????????????.
        
        subject.print()
            .sink(receiveValue: { print("Second subscription", $0) })
            .store(in: &subscriptions)  // ????????? ????????? ??????
        
        // "receive cancel" ??? ??? ??????. ????????? ????????? ??? Set??? ????????? ???????????? ???????????? ??????.
        // subect.send(completion: .finished) ??? ???????????? cancel ?????? finished??? ??????.
    }
    
    private func dynamicallyAdjustingDemand() {
        example(of: "Dynamically adjusting Demand") {
            final class IntSubscriber: Subscriber {
                typealias Input = Int
                typealias Failure = Never
                
                func receive(subscription: Subscription) {
                    subscription.request(.max(2))
                }
                
                func receive(_ input: Int) -> Subscribers.Demand {
                    print("Received value", input)
                    
                    switch input {
                    case 1:
                        return .max(2)
                    case 3:
                        return .max(1)
                    default:
                        return .none
                    }
                }
                
                func receive(completion: Subscribers.Completion<Never>) {
                    print("Received completion", completion)
                }
            }
            
            let subscriber = IntSubscriber()
            
            let subject = PassthroughSubject<Int, Never>()
            
            subject.subscribe(subscriber)
            
            subject.send(1)
            subject.send(2)
            subject.send(3)
            subject.send(4)
            subject.send(5)
            subject.send(6) // ???????????? 6??? ?????? ??????.
        }
    }
    
    private func typeErasure() {
        example(of: "Type erasure") {
            let subject = PassthroughSubject<Int, Never>()
            
            let publisher = subject.eraseToAnyPublisher()
            // Type erasure??? ???????????? publisher??? ?????? ??????????????? subscribers ?????? downstream publishers?????? ?????? ??? ??????.
            
            publisher.sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            subject.send(0)
            
            // publisher.send(1) ??????.
        }
    }
    
    private func challenge() {
        example(of: "Create a Blackjack card dealer") {
            let dealtHand = PassthroughSubject<Hand, HandError>()
            
            func deal(_ cardCount: UInt) {
                var deck: [Card] = cards
                var cardsRemaining: Int = 52
                var hand: [Card] = []
                
                for _ in 0 ..< cardCount {
                    let randomIndex: Int = .random(in: 0 ..< cardsRemaining)
                    hand.append(deck[randomIndex])
                    deck.remove(at: randomIndex)
                    cardsRemaining -= 1
                }
                
                // Add code to update dealtHand here
                if hand.points > 21 {
                    dealtHand.send(completion: .failure(.busted))
                } else {
                    dealtHand.send(hand)
                }
            }
            
            // Add subscription to dealtHand here
            dealtHand.sink(receiveCompletion: {
                if case let .failure(error) = $0 {
                    print(error)
                }
            }, receiveValue: { hand in
                print("\(hand.cardString) for \(hand.points), points")
            }).store(in: &subscriptions)
            
            deal(3)
        }
    }
}

// - MARK: Button Actions
extension Chapter02_ViewController {
    @objc private func didTapFirstEx() {
        helloPublisher()
    }
    
    @objc private func didTapSecondEx() {
        helloSubscriber()
    }
    
    @objc private func didTapThirdEx() {
        justTest1()
    }
    
    @objc private func didTapFourthEx() {
        subscribingWithAssign()
    }
    
    @objc private func didTapFifthEx() {
        republishingWithAssign()
    }
    
    @objc private func didTapSixthEx() {
        customSubscriber()
    }
    
    @objc private func didTapSeventhEx() {
        helloFuture()
    }
    
    @objc private func didTapEighthEx() {
        helloPassthroughSubject()
    }
    
    @objc private func didTapNinethEx() {
        helloCurrentValueSubject()
    }
    
    @objc private func didTapTenthEx() {
        dynamicallyAdjustingDemand()
    }
    
    @objc private func didTapEleventhEx() {
        typeErasure()
    }
    
    @objc private func didTapChallenge() {
        challenge()
    }
}
