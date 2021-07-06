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
        // 이 코드는 publisher를 생성은 했지만, 실제 noti를 받는건 publisher가 아니라 observer임.
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
                // publisher에 sink를 호출함으로써 subscription을 생성한다.
                print("Notification received from a publisher!")
            }
            
            NotificationCenter.default.post(name: notiName, object: nil)
            
            subscription.cancel()
        }
    }
    
    private func justTest1() {
        example(of: "Just") {
            // Just: 각각의 subscriber에 대해 단 한개의 출력을 emit하고 종료되는 Publisher.
            let just: Just<String> = .init("Hello World!")
            
            // sink operator는 publisher가 emit한 모든 값들을 계속 받을 수 있다.
            // receiveValue 클로저가 먼저 호출되고, 그 다음 receiveCompletion 클로저가 호출된다.
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
            
            // received value를 객체의 KVO에 상응하는 property에 assign 한다.
            _ = publisher.assign(to: \.value, on: object)
        }
    }
    
    private func republishingWithAssign() {
        example(of: "assign(to:)") {
            class SomeObject {
                @Published var value = 0    // value에 대한 publisher를 생성하며, 일반적인 Property로도 사용할 수 있다.
            }
            
            let object: SomeObject = .init()
            
            _ = object.$value.sink { print($0) }    // 0
            
            // assign(to:) operator는 AnyCancellable을 리턴하지 않는다.
            // 이유는 오퍼레이터가 내부적으로 라이프사이클을 관리하며 @Published property가 메모리에서 해제되면 subscription을 취소시키기 때문.
            (0..<10).publisher.assign(to: &object.$value)
            
            print(object.value) // 9
            
            // assign(to:)가 assign(to:on:)에 비해 이점을 가지는 경우는, 아래와 같이 전자는 강한참조로 인한 메모리 이슈를 걱정할 필요가 없다.
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
                    // publisher에 의해 호출되며, subscriber은 최대 3개의 값을 수신할 수 있음을 지정.
                    // 이 메서드가 불린뒤 아래의 receive(_ input:) 메서드가 호출된다.
                    subscription.request(.max(3))
                }
                
                func receive(_ input: Int) -> Subscribers.Demand {
                    print("Received value", input)
                    /*return .none -> 아래의 completion이 호출되지 않는다.
                     publisher는 6개의 값을 가지고 있는데, demand를 3으로 지정했기 떄문.
                     .none은 .max(0)과 같다. */
                    return .max(1)  // 메서드가 호출될 때마다 max값을 1씩 증가시킨다.
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
        // Future: Just와는 달리 단일값을 비동기적으로 생성한 다음 완료할 수 있는 Publisher
        example(of: "Future") {
            func futureIncrement(integer: Int, afterDelay delay: TimeInterval) -> Future<Int, Never> {
                Future<Int, Never> { promise in
                    print("Original") // subscrition이 발생하기 직전에 출력되는데, 이는 Future이 생성되는 즉시 실행되기 때문. 일반적인 publihser와 달리 subscriber가 필요하지 않다.
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                        promise(.success(integer + 1))
                    }
                }
            }
            
            // var subscriptions: Set<AnyCancellable> = .init() 지역변수로 선언하면 아래의 print가 수행이 안됨.. 왜지? -> long-running 비동기 operations의 경우 subscription을 저장하지 않으면, 현재 코드 블럭이 종료되는 즉시 subscription이 취소된다고 하는데, 이 때문에 지역변수에 저장하면 안되는듯.

            let future = futureIncrement(integer: 1, afterDelay: 3)
            future.sink(receiveCompletion: { print($0) }, receiveValue: { print($0)} )
                .store(in: &subscriptions)
            future.sink(receiveCompletion: { print("Second", $0) }, receiveValue: { print("Second", $0) })
                .store(in: &subscriptions)
            // 첫번째, 두번째 subscription은 동일한 값을 받는다. Future은 promise를 다시 실행하지 않고 output을 공유하거나 replay한다. 위의 sink 호출결과는 비동기적이라 순서보장이 되지 않는다.
        }
    }
    
    private func helloPassthroughSubject() {
        // Subject: non-Combine 코드가 Combine subscriber에게 값을 보낼 수 있도록 중개자 역할을 함.
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
            
            subject.subscribe(subscriber) // subscriber을 주제(publisher)에 등록.
            
            // sink를 사용하여 또다른 구독을 생성.
            let subscription = subject.sink { completion in
                print("Received completion (sink)", completion)
            } receiveValue: { value in
                print("Received value (sink)", value)
            }
            
            subject.send("Hello")
            subject.send("World")
            
            subscription.cancel()   // 두번째 구독을 취소한다.
            
            subject.send("Still there?")    // 두번째 구독이 취소되었기때문에, sink쪽은 호출되지 않음.
            
            subject.send(completion: .failure(MyError.test)) // receive(completion:)이 호출됨
            // Publisher가 정상이든 오류든 완료이벤트를 보내면 더이상의 이벤트는 수신되지 않는다.
            subject.send(completion: .finished)     // 아무것도 출력되지 않음.
            subject.send("How about another one?")  // 아무것도 출력되지 않음.
        }
    }
    
    private func helloCurrentValueSubject() {
        var subscriptions = Set<AnyCancellable>()   // Set에 저장된 구독들은 Set가 메모리에서 해제될때, 즉, 여기선 함수가 종료될때 자동으로 취소된다.
        
        let subject = CurrentValueSubject<Int, Never>(0)
        
        subject.print()
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
        
        subject.send(1)
        subject.send(2)
        
        print(subject.value)    // passthrough subject와 달리, current value를 subject에 요청할 수 있다.
        
        subject.value = 3   // send 대신에 이런식의 할당도 가능하다.
        
        subject.print()
            .sink(receiveValue: { print("Second subscription", $0) })
            .store(in: &subscriptions)  // 새로운 구독을 생성
        
        // "receive cancel" 두 번 출력. 함수가 종료될 때 Set에 저장된 구독들이 자동으로 취소.
        // subect.send(completion: .finished) 를 사용하면 cancel 대신 finished가 출력.
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
            subject.send(6) // 구독자는 6을 받지 못함.
        }
    }
    
    private func typeErasure() {
        example(of: "Type erasure") {
            let subject = PassthroughSubject<Int, Never>()
            
            let publisher = subject.eraseToAnyPublisher()
            // Type erasure을 사용하면 publisher에 대한 세부정보를 subscribers 또는 downstream publishers에게 숨길 수 있다.
            
            publisher.sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            subject.send(0)
            
            // publisher.send(1) 오류.
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
