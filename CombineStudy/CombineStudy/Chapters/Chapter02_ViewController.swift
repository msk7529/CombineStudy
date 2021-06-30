//
//  Chapter02_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/01.
//

import UIKit
import Combine

final class Chapter02_ViewController: UIViewController {

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
    
    private let notiName: Notification.Name = .init("MyNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter02"
        
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
extension Chapter02_ViewController {
    
    private func helloPublisher() {
        // 이 코드는 publisher를 생성은 했지만, 실제 noti를 받는건 publisher가 아니라 observer임.
        example(of: "Publisher") {
            let publisher: NotificationCenter.Publisher = .init(center: NotificationCenter.default, name: notiName, object: nil)
            let observer: NSObjectProtocol = NotificationCenter.default.addObserver(forName: notiName, object: nil, queue: nil) { notification in
                print("Notification received!")
            }
            
            NotificationCenter.default.post(name: notiName, object: nil)
            
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    private func helloSubscriber() {
        example(of: "Subscriber") {
            let publisher: NotificationCenter.Publisher = .init(center: NotificationCenter.default, name: notiName, object: nil)
            let subscription: AnyCancellable = publisher.sink { _ in
                // publisher에 sink를 호출함으로써 subscription을 생성한다.
                print("Notification received from a publisher!")
            }
            
            NotificationCenter.default.post(name: notiName, object: nil)
            
            subscription.cancel()
        }
    }
}

// - MARK: Button Actions
extension Chapter02_ViewController {
    @objc private func didTapFirstEx() {
        helloPublisher()
    }
    
    @objc private func didTapSecondEx() {
        helloSubscriber()
    }
}
