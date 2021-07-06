//
//  Chapter06_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/07.
//

import UIKit
import Combine

final class Chapter06_ViewController: UIViewController {

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
}
