//
//  Chapter12_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/12.
//

import UIKit
import Combine

final class Chapter12_ViewController: UIViewController {

    private lazy var firstExBtn: commonBtn = {
        let button: commonBtn = .init(title: "firstEx")
        button.addTarget(self, action: #selector(didTapFirstEx), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter12"
        
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
extension Chapter12_ViewController {
    private func operationQueue() {
        example(of: "OperationQueue") {
            let queue = OperationQueue()
            
            queue.publisher(for: \.operationCount)
                // operationqueue에 새 작업이 추가될 때마다 subscription이 생성된다.
                .sink {
                    print("Outstanding operations in queue: \($0)")
                }
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter12_ViewController {
    
    @objc private func didTapFirstEx() {
        operationQueue()
    }
}
