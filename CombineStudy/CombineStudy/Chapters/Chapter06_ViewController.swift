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
        // publisher가 내보낸 값을 지연시켜 실제로 발생하는 것보다 나중에 볼 수 있도록 한다.
        example(of: "Shifting Time") {
            let valuesPerSecond = 1.0
            let delayInSeconds = 1.5
            
            let sourcePublisher = PassthroughSubject<Date, Never>()
            
            sourcePublisher.sink { print("source: \($0)") }
                .store(in: &subscriptions)
            
            let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)  // delay: 스케쥴러에서 n초의 delay로, output들을 downstream으로 내보낸다.
                
            delayedPublisher
                .sink(receiveValue: { print("deday: \($0)") })
                .store(in: &subscriptions)
            
            Timer
                .publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)  // every 초마다 현재의 Date를 내보내는 publisher를 반환. 타이머의 경우 TimerPublisher인데 얘는 특이하게 publisher 타입이 ConnectablePublisher 이다. 이 타입은 connect()를 호출할 때까지 element를 생성하지 않는다.
                .autoconnect()  // ConnectablePublisher 와의 연결시작/해제를 자동으로. 업스트림 publisher에 자동으로 연결해주는거라, 이걸 sink 다음에 쓰면 안되는 듯 ?
                .subscribe(sourcePublisher) // subscribe는 인자로 두가지 형태가 올 수 있는데 Subject와 subcriber 이다. 여기선 전자.
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
            // collectTimeStride 초마다 수집한 값들을 배열형태로 내보낸다.
                .flatMap { dates in dates.publisher }
            // flatMap을 수행함으로써, collect로 배열을 내보낼 때마다 개별값으로 나누어 하나씩 내보낸다.
            
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
            // collectTimeStride 초마다 수집한 값들을 배열형태로 내보내는데, 그전에 버퍼가 꽉 차면 그 즉시 값을 내보낸다. 따라서 여기선 2초마다 2개씩 값을 내보내게 된다.
            
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
                // 입력 주기가 끝나면 마지막 값을 내보낸다. 즉, 쭉 값이 들어오다가 마지막 값이 들어온 후 1초동안 아무값도 들어오지 않으면 해당 값을 내보낸다. 추가로 값이 들어오면 주기가 다시 갱신된다.
                .share()    // 여러 subscriber가 동일한 결과값을 받기 위함.
            
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
                // 처음 구독 시점에 값을 한번 내보내고, lastest를 false로 주면 특정 주기 안의 첫번째 값을 내보낸다.
                // 버튼 터치와 같은 연속 이벤트를 방지해야하는 경우에 유용할 듯
                // lastest를 true로 주면 특정 주기안의 마지막 값을 내보낸다.
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
                // 5초동안 아무런 값이 들어오지 않으면(이벤트가 발생하지 않으면) publishing을 종료한다. 5초안에 값이 들어오면 주기를 다시 갱신한다.
                .sink(receiveCompletion: {
                    if case let .failure(error) = $0 {
                        print(error)    // Error없이 Never로 정의해도 관계없다.
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
            // upstream publisher에 의해 내보내진 두 개의 연속적인 값 사이에 경과된 시간(TimeInterval)을 내보낸다.
            // RunLoop.main을 사용하면 초 단위, DispatchQueue.main을 사용하면 나노초단위
            // 일반적인 경우 DispatchQueue.main을 사용하는것이 좋다고 함.
            
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
        let _ = String(aaa) // Char배열을 이런식으로 String 변환이 가능하구나 ..
        
        example(of: "Challenge") {
            let subject = PassthroughSubject<Int, Never>()
            
            let strings = subject
                .collect(.byTime(DispatchQueue.main, .seconds(0.5)))    // 0.5초 단위로 그룹화해서
                .map { numArray in
                    String(numArray.map { Character(Unicode.Scalar($0)!) }) // String으로 변환
                }
            
            let spaces = subject.measureInterval(using: DispatchQueue.main) // 문자사이의 시간간격을 층정하기 위한 publisher
                .map { interval in
                    interval > 0.9 ? "😒" : ""
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
                // 정의된 시간만큼 후에 값을 내보낸다.
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
