//
//  Chapter11_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/11.
//

import UIKit
import Combine

final class Chapter11_ViewController: UIViewController {

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
        self.navigationItem.title = "Chapter11"
        
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
extension Chapter11_ViewController {
    
    private func runLoop() {
        example(of: "RunLoop") {
            let runLoop = RunLoop.main
            
            let subscription = runLoop.schedule(after: runLoop.now, interval: .seconds(1), tolerance: .milliseconds(100), options: nil) {
                print("Timer fired")
            }
            // 이렇게 생성된 타이머는 어떤 값도 넘기지 않고, publisher를 생성하지 않는다.
            
            subscription.store(in: &subscriptions)
            
            runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
                subscription.cancel()
            }
            // RunLoop를 사용하는 타이머 생성 방식은 좋은 방식이 아니라고 한다.
        }
    }
    
    private func timer() {
        example(of: "Timer") {
            let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
                // on에 main을 사용하면 메인쓰레드의 런루프, current를 사용하면 현재스레드의 런루프
                // main대신 DispatchQueue.main을 사용하면 예상치못한 결과를 얻을 수 있다고 한다.
                // Dispatch framework는 해당 스레드를 런루프를 사용하지 않고 관리한다고 함..
                .autoconnect()
                // subscription이 시작할 때 timer가 시작된다.
                .scan(0) { counter, _ in counter + 1 }
                .sink { counter in
                    print("Counter is \(counter)")
                }
            
            subscription.store(in: &subscriptions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                subscription.cancel()
            }
        }
    }
    
    private func dispatchQueue() {
        // RunLoop는 딜레이 될 가능성이 있어서, 디스패치큐를 더 많이 사용할수도 ?
        example(of: "dispatchQueue") {
            let queue = DispatchQueue.main
            
            let source = PassthroughSubject<Int, Never>()
            
            var counter = 0
            
            let cancellable = queue.schedule(after: queue.now, interval: .seconds(1)) {
                source.send(counter)
                counter += 1
            }
            
            cancellable.store(in: &subscriptions)
            
            source.sink {
                print("Timer emitted \($0)")
            }
            .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter11_ViewController {
    
    @objc private func didTapFirstEx() {
        runLoop()
    }
    
    @objc private func didTapSecondEx() {
        timer()
    }
    
    @objc private func didTapThirdEx() {
        dispatchQueue()
    }
}
