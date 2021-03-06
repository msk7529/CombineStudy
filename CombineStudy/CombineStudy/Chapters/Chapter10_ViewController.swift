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
    
    private lazy var thirdExBtn: commonBtn = {
        let button: commonBtn = .init(title: "thirdEx")
        button.addTarget(self, action: #selector(didTapThirdEx), for: .touchUpInside)
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
extension Chapter10_ViewController {
    
    private func printEvent() {
        example(of: "print event") {
            // print: subscription??? ????????? ??? ????????????, upstream publisher??? ??????????????? ????????????.
            // ????????? ?????? ????????? ???????????? ????????? ??? ??? ????????? subscriber??? demand request??? ????????????.
            // upstream publisher??? emit?????? ?????? ?????? ????????????.
            // completion ???????????? ????????????.
            
            (1...3).publisher
                .print("publisher")
                .sink { _ in }
                .store(in: &subscriptions)
        }
        
        example(of: "print event using TimeLogger") {
            (1...3).publisher
                .print("publisher", to: TimeLogger())
                // log??? ???????????? ???????????? ???????????? print??????.
                .sink { _ in }
                .store(in: &subscriptions)
        }
    }
    
    private func performingSideEffets() {
        example(of: "performingSideEffets") {
            // handleEvents: publisher??? lifecycle??? ?????? ?????? ???????????? ?????????????????? ??? ???????????? ????????? ?????? ??? ??????. ??????????????? ???????????? ??? ??? ??????
            
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
    
    private func breakPoint() {
        example(of: "breakPoint") {
            (1...12).publisher
                .breakpoint(receiveOutput: { value in
                    return value > 10 && value < 15
                })
                // upstream publisher??? ????????? ?????? ????????? ???????????? ???????????? ??????????????? ??????.
                .sink(receiveValue: {
                    print($0)
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
    
    @objc private func didTapThirdEx() {
        breakPoint()
    }
}
    
