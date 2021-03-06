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
            // ????????? ????????? ???????????? ?????? ?????? ????????? ??????, publisher??? ???????????? ?????????.
            
            subscription.store(in: &subscriptions)
            
            runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
                subscription.cancel()
            }
            // RunLoop??? ???????????? ????????? ?????? ????????? ?????? ????????? ???????????? ??????.
        }
    }
    
    private func timer() {
        example(of: "Timer") {
            let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
                // on??? main??? ???????????? ?????????????????? ?????????, current??? ???????????? ?????????????????? ?????????
                // main?????? DispatchQueue.main??? ???????????? ??????????????? ????????? ?????? ??? ????????? ??????.
                // Dispatch framework??? ?????? ???????????? ???????????? ???????????? ?????? ??????????????? ???..
                .autoconnect()
                // subscription??? ????????? ??? timer??? ????????????.
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
        // RunLoop??? ????????? ??? ???????????? ?????????, ?????????????????? ??? ?????? ??????????????? ?
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
