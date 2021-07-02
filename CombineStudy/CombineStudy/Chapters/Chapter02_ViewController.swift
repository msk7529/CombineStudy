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
        let button: commonBtn = .init(title: "fifthExBtn")
        button.addTarget(self, action: #selector(didTapFifthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var sixthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "sixthExBtn")
        button.addTarget(self, action: #selector(didTapSixthEx), for: .touchUpInside)
        return button
    }()
    
    private let notiName: Notification.Name = .init("MyNotification")
    
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
}
