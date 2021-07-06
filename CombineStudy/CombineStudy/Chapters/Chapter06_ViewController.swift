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
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter04"
        
        self.initView()
    }
    
    private func initView() {
        self.view.addSubview(firstExBtn)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
}

// - MARK: Button Actions
extension Chapter06_ViewController {
    
    @objc private func didTapFirstEx() {
        shiftingTime()
    }
}
