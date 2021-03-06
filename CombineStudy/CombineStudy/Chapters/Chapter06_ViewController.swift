//
//  Chapter06_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/07.
//

import UIKit
import Combine

final class Chapter06_ViewController: UIViewController {

    enum TimeoutError: Error {
        case timedOut
    }
    
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
        button.addTarget(self, action: #selector(didTapSevenEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var challengeBtn: commonBtn = {
        let button: commonBtn = .init(title: "challenge")
        button.addTarget(self, action: #selector(didTapChallenge), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    private let buttonSubject = PassthroughSubject<Void, TimeoutError>()
    
    let deltaFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.negativePrefix = ""
        f.minimumFractionDigits = 1
        f.maximumFractionDigits = 1
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter06"
        
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
        
        challengeBtn.topAnchor.constraint(equalTo: seventhExBtn.topAnchor).isActive = true
        challengeBtn.leadingAnchor.constraint(equalTo: seventhExBtn.trailingAnchor, constant: 30).isActive = true
        challengeBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        challengeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func deltaTime(_ date: Date) -> String {
        return deltaFormatter.string(for: Date().timeIntervalSince(date))!
    }
}

// - MARK: Example tests
extension Chapter06_ViewController {
    
    private func shiftingTime() {
        // publisher??? ????????? ?????? ???????????? ????????? ???????????? ????????? ????????? ??? ??? ????????? ??????.
        example(of: "Shifting Time") {
            let valuesPerSecond = 1.0
            let delayInSeconds = 1.5
            
            let sourcePublisher = PassthroughSubject<Date, Never>()
            
            sourcePublisher.sink { print("source: \($0)") }
                .store(in: &subscriptions)
            
            let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)  // delay: ?????????????????? n?????? delay???, output?????? downstream?????? ????????????.
                
            delayedPublisher
                .sink(receiveValue: { print("deday: \($0)") })
                .store(in: &subscriptions)
            
            Timer
                .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)  // every ????????? ????????? Date??? ???????????? publisher??? ??????. ???????????? ?????? TimerPublisher?????? ?????? ???????????? publisher ????????? ConnectablePublisher ??????. ??? ????????? connect()??? ????????? ????????? element??? ???????????? ?????????.
                .autoconnect()  // ConnectablePublisher ?????? ????????????/????????? ????????????. ???????????? publisher??? ???????????? ?????????????????????, ?????? sink ????????? ?????? ????????? ??? ?
                .subscribe(sourcePublisher) // subscribe??? ????????? ????????? ????????? ??? ??? ????????? Subject??? subcriber ??????. ????????? ??????.
                .store(in: &subscriptions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                sourcePublisher.send(completion: .finished)
            }
        }
    }
    
    private func collectValue1() {
        example(of: "Collect Value1") {
            let valuesPerSecond = 1.0
            let collectTimeStride = 4
            
            let sourcePublisher = PassthroughSubject<Date, Never>()
            
            sourcePublisher
                .sink { print("source: \($0)") }
                .store(in: &subscriptions)
            
            let collectedPublisher = sourcePublisher
                .collect(.byTime(DispatchQueue.main, .seconds(collectTimeStride)))
            // collectTimeStride ????????? ????????? ????????? ??????????????? ????????????.
                .flatMap { dates in dates.publisher }
            // flatMap??? ??????????????????, collect??? ????????? ????????? ????????? ??????????????? ????????? ????????? ????????????.
            
            collectedPublisher
                .sink { print("collect: \($0)") }
                .store(in: &subscriptions)
            
            Timer
                .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)
                .autoconnect()
                .subscribe(sourcePublisher)
                .store(in: &subscriptions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                sourcePublisher.send(completion: .finished)
            }
        }
    }
    
    private func collectValue2() {
        example(of: "Collect Value2") {
            let valuesPerSecond = 1.0
            let collectTimeStride = 4
            let collectMaxCount = 2
            
            let sourcePublisher = PassthroughSubject<Date, Never>()
            
            sourcePublisher
                .sink { print("source: \($0)") }
                .store(in: &subscriptions)
            
            let collectedPublisher = sourcePublisher
                .collect(.byTimeOrCount(DispatchQueue.main, .seconds(collectTimeStride), collectMaxCount))
            // collectTimeStride ????????? ????????? ????????? ??????????????? ???????????????, ????????? ????????? ??? ?????? ??? ?????? ?????? ????????????. ????????? ????????? 2????????? 2?????? ?????? ???????????? ??????.
            
            collectedPublisher
                .sink { print("collect: \($0)") }
                .store(in: &subscriptions)
            
            Timer
                .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)
                .autoconnect()
                .subscribe(sourcePublisher)
                .store(in: &subscriptions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 15.0) {
                sourcePublisher.send(completion: .finished)
            }
        }
    }
    
    private func debounce() {
        let start = Date()
        
        let typingHelloWorld: [(TimeInterval, String)] = [
          (0.0, "H"),
          (0.1, "He"),
          (0.2, "Hel"),
          (0.3, "Hell"),
          (0.5, "Hello"),
          (0.6, "Hello "),
          (2.0, "Hello W"),
          (2.1, "Hello Wo"),
          (2.2, "Hello Wor"),
          (2.4, "Hello Worl"),
          (2.5, "Hello World")
        ]
        
        example(of: "Debounce") {
            let subject = PassthroughSubject<String, Never>()
            
            let debounced = subject
                .debounce(for: .seconds(1.0), scheduler: DispatchQueue.main)
                // ?????? ????????? ????????? ????????? ?????? ????????????. ???, ??? ?????? ??????????????? ????????? ?????? ????????? ??? 1????????? ???????????? ???????????? ????????? ?????? ?????? ????????????. ????????? ?????? ???????????? ????????? ?????? ????????????.
                .share()    // ?????? subscriber??? ????????? ???????????? ?????? ??????.
            
            subject
                .sink { [weak self] string in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Subject emitted: \(string)")
                }
                .store(in: &subscriptions)
            
            debounced
                .sink { [weak self] string in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Debounced emitted: \(string)")
                }
                .store(in: &subscriptions)
            
            subject.feed(with: typingHelloWorld)
        }
    }
    
    private func throttle() {
        let start = Date()
        let throttleDelay = 1.0
        
        let typingHelloWorld: [(TimeInterval, String)] = [
          (0.0, "H"),
          (0.1, "He"),
          (0.2, "Hel"),
          (0.3, "Hell"),
          (0.5, "Hello"),
          (0.6, "Hello "),
          (2.0, "Hello W"),
          (2.1, "Hello Wo"),
          (2.2, "Hello Wor"),
          (2.4, "Hello Worl"),
          (2.5, "Hello World")
        ]
        
        example(of: "Throttle") {
            let subject = PassthroughSubject<String, Never>()
            
            let throttled = subject
                .throttle(for: .seconds(throttleDelay), scheduler: DispatchQueue.main, latest: false)
                // ?????? ?????? ????????? ?????? ?????? ????????????, lastest??? false??? ?????? ?????? ?????? ?????? ????????? ?????? ????????????.
                // ?????? ????????? ?????? ?????? ???????????? ?????????????????? ????????? ????????? ???
                // lastest??? true??? ?????? ?????? ???????????? ????????? ?????? ????????????.
                .share()
            
            subject
                .sink { [weak self] string in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Subject emitted: \(string)")
                }
                .store(in: &subscriptions)
            
            throttled
                .sink { [weak self] string in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Throttled emitted: \(string)")
                }
                .store(in: &subscriptions)
            
            subject.feed(with: typingHelloWorld)
        }
    }
    
    private func timeout() {
        let eventBtn: commonBtn = {
            let button: commonBtn = .init(title: "eventBtn")
            button.addTarget(self, action: #selector(didTapEventButton), for: .touchUpInside)
            return button
        }()
        
        self.view.addSubview(eventBtn)
        
        eventBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        eventBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        eventBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eventBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        example(of: "Time out") {
            buttonSubject
                .timeout(.seconds(5), scheduler: DispatchQueue.main, customError: { .timedOut })
                // 5????????? ????????? ?????? ???????????? ?????????(???????????? ???????????? ?????????) publishing??? ????????????. 5????????? ?????? ???????????? ????????? ?????? ????????????.
                .sink(receiveCompletion: {
                    if case let .failure(error) = $0 {
                        print(error)    // Error?????? Never??? ???????????? ????????????.
                    }
                    eventBtn.removeFromSuperview()
                }, receiveValue: { print("Button did Tap!") })
                .store(in: &subscriptions)
        }
    }
    
    private func measuringTime() {
        let typingHelloWorld: [(TimeInterval, String)] = [
            (0.0, "H"),
            (0.2, "He"),
            (0.4, "Hel"),
            (0.6, "Hell"),
            (0.8, "Hello"),
            (1.0, "Hello "),
            (2.5, "Hello W"),
            (2.8, "Hello Wo"),
            (3.2, "Hello Wor"),
            (3.6, "Hello Worl"),
            (5.0, "Hello World")
        ]
        
        example(of: "Measuring Time") {
            let start = Date()
            
            let subject = PassthroughSubject<String, Never>()
            
            let measureSubject = subject.measureInterval(using: DispatchQueue.main)
            // upstream publisher??? ?????? ???????????? ??? ?????? ???????????? ??? ????????? ????????? ??????(TimeInterval)??? ????????????.
            // RunLoop.main??? ???????????? ??? ??????, DispatchQueue.main??? ???????????? ???????????????
            // ???????????? ?????? DispatchQueue.main??? ?????????????????? ????????? ???.
            
            subject
                .sink { [weak self] string in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Subject emitted: \(string)")
                }
                .store(in: &subscriptions)

            measureSubject
                .sink { [weak self] in
                    guard let self = self else { return }
                    
                    print("+\(self.deltaTime(start))s: Measure emitted: \(Double($0.magnitude) / 1_000_000_000.0)")
                }
                .store(in: &subscriptions)
            
            subject.feed(with: typingHelloWorld)
        }
    }
    
    private func challenge() {
        let aaa: [Character] = ["1", "2", "3", "4"]
        let _ = String(aaa) // Char????????? ??????????????? String ????????? ??????????????? ..
        
        example(of: "Challenge") {
            let subject = PassthroughSubject<Int, Never>()
            
            let strings = subject
                .collect(.byTime(DispatchQueue.main, .seconds(0.5)))    // 0.5??? ????????? ???????????????
                .map { numArray in
                    String(numArray.map { Character(Unicode.Scalar($0)!) }) // String?????? ??????
                }
            
            let spaces = subject.measureInterval(using: DispatchQueue.main) // ??????????????? ??????????????? ???????????? ?????? publisher
                .map { interval in
                    interval > 0.9 ? "????" : ""
                }
            
            strings
                .merge(with: spaces)
                .filter { !$0.isEmpty }
                .sink { print($0) }
                .store(in: &subscriptions)
            
            startFeeding(subject: subject)
        }
    }
}

// - MARK: Button Actions
extension Chapter06_ViewController {
    
    @objc private func didTapFirstEx() {
        shiftingTime()
    }
    
    @objc private func didTapSecondEx() {
        collectValue1()
    }
    
    @objc private func didTapThirdEx() {
        collectValue2()
    }
    
    @objc private func didTapFourthEx() {
        debounce()
    }
    
    @objc private func didTapFifthEx() {
        throttle()
    }
    
    @objc private func didTapSixthEx() {
        timeout()
    }
    
    @objc private func didTapEventButton() {
        buttonSubject.send()
    }
    
    @objc private func didTapSevenEx() {
        measuringTime()
    }
    
    @objc private func didTapChallenge() {
        challenge()
    }
}

private extension Subject where Output == String {
    /// A function that can feed delayed values to a subject for testing and simulation purposes
    func feed(with data: [(TimeInterval, String)]) {
        var lastDelay: TimeInterval = 0
        for entry in data {
            lastDelay = entry.0
            DispatchQueue.main.asyncAfter(deadline: .now() + entry.0) { [unowned self] in
                // ????????? ???????????? ?????? ?????? ????????????.
                self.send(entry.1)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + lastDelay + 1.5) { [unowned self] in
            self.send(completion: .finished)
        }
    }
}

public func startFeeding<S>(subject: S) where S: Subject, S.Output == Int {
    // sample data!
    let samples: [(TimeInterval, Int)] = [
        (0.05, 67), (0.10, 111), (0.15, 109), (0.20, 98), (0.25, 105), (0.30, 110), (0.35, 101),
        (1.50, 105), (1.55, 115),
        (2.60, 99), (2.65, 111), (2.70, 111), (2.75, 108), (2.80, 33)
    ]
    
    var lastDelay: TimeInterval = 0
    
    for entry in samples {
        lastDelay = entry.0
        DispatchQueue.main.asyncAfter(deadline: .now() + entry.0) {
            subject.send(entry.1)
        }
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + lastDelay + 0.5) {
        subject.send(completion: .finished)
    }
}
