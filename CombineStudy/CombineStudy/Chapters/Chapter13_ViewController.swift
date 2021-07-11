//
//  Chapter13_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/12.
//

import UIKit
import Combine

final class Chapter13_ViewController: UIViewController {

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
        self.navigationItem.title = "Chapter13"
        
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
extension Chapter13_ViewController {
    
    private func share() {
        // share: publisher를 value타입이 아닌 reference 타입으로 받을 수 있다.
        // 해당 publihser를 구독한 다수의 subscriber에게 동일한 결과를 반환한다.(요청을 새로 만들어내지 않는다.)
        // 단, 이미 completed된 share publisher를 구독하면 completed만 받게 된다.
        example(of: "Share") {
            let shared = URLSession.shared
                .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com")!)
                .map(\.data)
                .print("shared")
                .share()
            
            print("subscribing first")
            
            shared
                .sink(receiveCompletion: { _ in }, receiveValue: { print("subscription1 received: \($0)")})
                .store(in: &subscriptions)
            
            shared
                .sink(receiveCompletion: { _ in }, receiveValue: { print("subscription2 received: \($0)")})
                .store(in: &subscriptions)
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
                guard let strongSelf = self else { return }
                
                print("subscribing third")
                
                shared
                    .sink(receiveCompletion: { print("subscription3 completion \($0)") },
                          receiveValue: { print("subscription3 received \($0)") })
                    // 이 시점에는 이미 publihser가 완료된 상태여서 value를 받을 수 없다.
                    .store(in: &strongSelf.subscriptions)
            }
        }
    }
    
    private func multicast() {
        // connect()를 호출해야 이벤트를 시작한다.
        // 따라서, subscription들을 다 만들어두고, connect를 할 수 있어 편리하다.
        example(of: "multicast") {
            let subject = PassthroughSubject<Data, URLError>()  // upstream publisher가 내보내는 값과 완료이벤트를 전달하는 subject
            
            let multicasted = URLSession.shared
                .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com")!)
                .map(\.data)
                .print("multicast")
                .multicast(subject: subject)
            
            multicasted
                .sink(receiveCompletion: { _ in }, receiveValue: { print("subscription1 received \($0)")})
                .store(in: &subscriptions)
            
            multicasted
                .sink(receiveCompletion: { _ in }, receiveValue: { print("subscription2 received \($0)")})
                .store(in: &subscriptions)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
                guard let strongSelf = self else { return }
                
                multicasted
                    .sink(receiveCompletion: { print("subscription3 completion \($0)") },
                          receiveValue: { print("subscription3 received \($0)") })
                    // 이 시점에는 이미 publihser가 완료된 상태여서 value를 받을 수 없다.
                    .store(in: &strongSelf.subscriptions)
                
                multicasted.connect()   // publisher에게 upstream publisher와 연결하도록 한다.
                    .store(in: &strongSelf.subscriptions)
            }
        }
    }
}

// - MARK: Button Actions
extension Chapter13_ViewController {
    
    @objc private func didTapFirstEx() {
        share()
    }
    
    @objc private func didTapSecondEx() {
        multicast()
    }
}
