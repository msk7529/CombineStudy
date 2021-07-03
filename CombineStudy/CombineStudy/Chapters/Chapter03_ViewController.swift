//
//  Chapter03_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/04.
//

import UIKit
import Combine

final class Chapter03_ViewController: UIViewController {

    private lazy var firstExBtn: commonBtn = {
        let button: commonBtn = .init(title: "firstEx")
        button.addTarget(self, action: #selector(didTapFirstEx), for: .touchUpInside)
        return button
    }()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter03"
        
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
extension Chapter03_ViewController {
    private func collect() {
        // collect는 upstream publihser가 완료하면, 개별 값 스트림을 해당 값의 배열로 버퍼링한다.
        // 그런 다음 해당 배열을 다운스트림으로 내보낸다.
        
        example(of: "collect") {
            ["A", "B", "C", "D", "E"].publisher
                //.collect()
                .collect(2)
                .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter03_ViewController {
    @objc private func didTapFirstEx() {
        collect()
    }
}
