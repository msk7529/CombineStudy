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
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter11"
        
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
extension Chapter11_ViewController {
    
    private func runLoop() {
        example(of: "RunLoop") {
            let runLoop = RunLoop.main
            
            let subscription = runLoop.schedule(after: runLoop.now, interval: .seconds(1), tolerance: .milliseconds(100), options: nil) {
                print("Timer fired")
            }
            // 이렇게 생성된 타이머는 어떤 값도 넘기지 않고, publisher를 생성하지 않는다.
            
            runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
                subscription.cancel()
            }
            // RunLoop를 사용하는 타이머 생성 방식은 좋은 방식이 아니라고 한다.
        }
    }
}

// - MARK: Button Actions
extension Chapter11_ViewController {
    
    @objc private func didTapFirstEx() {
        runLoop()
    }
}
