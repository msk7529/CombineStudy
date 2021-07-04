//
//  Chapter05_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/05.
//

import UIKit
import Combine

final class Chapter05_ViewController: UIViewController {

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
    
    private lazy var fourthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "fourthEx")
        button.addTarget(self, action: #selector(didTapFourthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var fifthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "fifthEx")
        button.addTarget(self, action: #selector(didTapFifthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var sixthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "sixthEx")
        button.addTarget(self, action: #selector(didTapSixthEx), for: .touchUpInside)
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
        self.view.addSubview(secondExBtn)
        self.view.addSubview(thirdExBtn)
        self.view.addSubview(fourthExBtn)
        self.view.addSubview(fifthExBtn)
        self.view.addSubview(sixthExBtn)
        
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
        
        fourthExBtn.topAnchor.constraint(equalTo: firstExBtn.bottomAnchor, constant: 30).isActive = true
        fourthExBtn.leadingAnchor.constraint(equalTo: firstExBtn.leadingAnchor).isActive = true
        fourthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fourthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        fifthExBtn.topAnchor.constraint(equalTo: fourthExBtn.topAnchor).isActive = true
        fifthExBtn.leadingAnchor.constraint(equalTo: fourthExBtn.trailingAnchor, constant: 30).isActive = true
        fifthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fifthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sixthExBtn.topAnchor.constraint(equalTo: fourthExBtn.topAnchor).isActive = true
        sixthExBtn.leadingAnchor.constraint(equalTo: fifthExBtn.trailingAnchor, constant: 30).isActive = true
        sixthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sixthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

// - MARK: Example tests
extension Chapter05_ViewController {
    
    private func prependOutput() {
        // prepend: upstream의 맨 앞에 값을 추가한다.
        example(of: "prepend(Output...)") {
            let publisher = [3, 4].publisher
            
            publisher
                .prepend(1, 2)  // 맨 앞에 1,2 추가 -> 1,2,3,4
                .prepend(-1, 0) // 맨 앞에 -1, 0 추가 -> -1, 0, 1, 2, 3, 4
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prependSequence() {
        example(of: "prepend(Sequence)") {
            let publisher = [5, 6, 7].publisher
            
            publisher
                .prepend([3, 4])
                .prepend(Set(1...2))    // Set이기 때문에 순서보장이 되지 않는다.
                .prepend(stride(from: 6, to: 11, by: 2))
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func prependPublisher() {
        // 하나의 publisher의 값에 다른 publisher의 값을 앞에 묶는다.
        example(of: "prepend(Publisher)") {
            let publisher1 = [3, 4].publisher
            let publihser2 = [1, 2].publisher
            
            publisher1
                .prepend(publihser2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
        
        example(of: "prepend(Publisher) #2") {
            let publisher1 = [3, 4].publisher
            let publisher2 = PassthroughSubject<Int, Never>()
            
            publisher1
                .prepend(publisher2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publisher2.send(1)
            publisher2.send(2)
            
            publisher2.send(completion: .finished)  // 이걸 수행해야 publisher1의 값들이 출력된다.
            // prepending이 완료되었음을 알고, 기본 publisher로 계속 진행할 수 있도록 완료해야 한다.
        }
    }
    
    private func appendOutput() {
        // append: upstream의 맨 뒤에 값을 추가한다.
        example(of: "append(Output...)") {
            let publisher = [1].publisher
            
            publisher
                .append(2, 3)
                .append(4)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
        
        example(of: "append(Output...) #2") {
            let publiser = PassthroughSubject<Int, Never>()
            
            publiser
                .append(3, 4)
                .append(5)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
            
            publiser.send(1)
            publiser.send(2)
            
            publiser.send(completion: .finished)    // 이걸 수행해야 append한 값들이 출력된다.
            // 즉, publisher가 완료 이벤트를 보내지 않으면 append가 발생하지 않는다.
        }
    }
    
    private func appendSequence() {
        example(of: "append(Sequence)") {
            let publisher = [1, 2, 3].publisher
            
            publisher
                .append([4, 5])
                .append(Set([6, 7]))    // 순서 보장 되지 않음.
                .append(stride(from: 8, to: 11, by: 2))
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func appendPublisher() {
        example(of: "append(Publisher)") {
            let publisher1 = [1, 2].publisher
            let publisher2 = [3, 4].publisher
            
            publisher1
                .append(publisher2)
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter05_ViewController {

    @objc private func didTapFirstEx() {
        prependOutput()
    }
    
    @objc private func didTapSecondEx() {
        prependSequence()
    }
    
    @objc private func didTapThirdEx() {
        prependPublisher()
    }
    
    @objc private func didTapFourthEx() {
        appendOutput()
    }
    
    @objc private func didTapFifthEx() {
        appendSequence()
    }
    
    @objc private func didTapSixthEx() {
        appendPublisher()
    }
}
