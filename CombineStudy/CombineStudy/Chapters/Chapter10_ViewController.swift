//
//  Chapter10_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/11.
//

import UIKit
import Combine

final class Chapter10_ViewController: UIViewController {

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
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter10"
        
        self.initView()
    }
    
    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(secondExBtn)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondExBtn.topAnchor.constraint(equalTo: firstExBtn.topAnchor).isActive = true
        secondExBtn.leadingAnchor.constraint(equalTo: firstExBtn.trailingAnchor, constant: 30).isActive = true
        secondExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter10_ViewController {
    
    private func printEvent() {
        example(of: "print event") {
            // print: subscription을 수신할 때 출력하고, upstream publisher의 상세정보를 보여준다.
            // 얼마나 많은 항목이 요청되고 있는지 볼 수 있도록 subscriber의 demand request를 출력한다.
            // upstream publisher가 emit하는 모든 값을 출력한다.
            // completion 이벤트를 출력한다.
            
            (1...3).publisher
                .print("publisher")
                .sink { _ in }
                .store(in: &subscriptions)
        }
        
        example(of: "print event using TimeLogger") {
            (1...3).publisher
                .print("publisher", to: TimeLogger())
                // log에 부가적인 정보들을 추가해서 print한다.
                .sink { _ in }
                .store(in: &subscriptions)
        }
    }
    
    private func performingSideEffets() {
        example(of: "performingSideEffets") {
            // handleEvents: publisher의 lifecycle에 있는 모든 이벤트를 인터셉트하여 각 단계에서 조치를 취할 수 있다. 디버깅할때 용이하게 쓸 수 있음
            
            let request = URLSession.shared
                .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com/")!)
            
            request
                .handleEvents(receiveSubscription: { _ in
                    print("Network request will start")
                }, receiveOutput: { _ in
                    print("Network request data received")
                }, receiveCancel: {
                    print("Network request cancelled")
                }, receiveRequest: { _ in
                    print("Received request")
                })
                .sink(receiveCompletion: { completion in
                    print("Sink received completion: \(completion)")
                }, receiveValue: { (data, _ ) in
                    print("Sink received data: \(data)")
                })
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter10_ViewController {
    
    @objc private func didTapFirstEx() {
        printEvent()
    }
    
    @objc private func didTapSecondEx() {
        performingSideEffets()
    }
}
    
