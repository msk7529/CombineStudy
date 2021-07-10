//
//  Chapter09_ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/10.
//

import UIKit
import Combine

final class Chapter09_ViewController: UIViewController {
    
    struct TestModel: Codable {
        let name: String
        let age: Int
        
        private enum CodingKeys: String, CodingKey {
            case name
            case age = "Age"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = (try? values.decode(String.self, forKey: .name)) ?? ""
            age = (try? values.decode(Int.self, forKey: .age)) ?? 0
        }
    }
    
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
        self.navigationItem.title = "Chapter09"
        
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
extension Chapter09_ViewController {
    
    private func networking() {
        example(of: "URLSession extensions") {
            guard let url = URL(string: "https://www.naver.com") else {
                return
            }
            
            URLSession.shared
                .dataTaskPublisher(for: url)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Retrieving data failed with error \(error)")
                    }
                }, receiveValue: { data, response in
                    print("Retrieved data of size \(data.count), response = \(response)")
                })
                .store(in: &subscriptions)
        }
    }
    
    private func codableSupport() {
        example(of: "Codable Support") {
            guard let url = URL(string: "https://www.naver.com") else {
                return
            }
            
            URLSession.shared
                .dataTaskPublisher(for: url)
                .print("codable Test: ")
                .map(\.data)
                .decode(type: TestModel.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Retrieving data failed with error \(error)")
                    }
                }, receiveValue: { object in
                    print("Retrieved object \(object)")
                })
                .store(in: &subscriptions)
        }
    }
    
    private func multicast() {
        example(of: "multicast") {
            let url = URL(string: "https://www.raywenderlich.com")!
            let publisher = URLSession.shared
                .dataTaskPublisher(for: url)
                .map(\.data)
                .multicast { PassthroughSubject<Data, URLError>() }
            // sink로 구독이 활성화되면 publisher가 작업을 바로 수행하게 되는데, 이럴때 Publisher에 여러 Subscriber가 붙는 경우 여러번 API를 수행하게 된다. 이를 방지하기 위해 multicast를 사용하여 API를 한번만 실행할 수 있도록 한다.
            
            publisher.sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Sink1 Retrieving data failed with error \(error)")
                }
            }, receiveValue: { object in
                print("Sink1 Retrieved object \(object)")
            })
            .store(in: &subscriptions)
            
            publisher
                .receive(on: DispatchQueue.main)    // upstream에 영향을 주는 subscribe(on:)과는 달리 downstream에 영향을 준다. 이렇게 하면 메인스레드에서 값을 받을 수 있다.
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Sink2 Retrieving data failed with error \(error)")
                    }
                }, receiveValue: { object in
                    print("Sink2 Retrieved object \(object)")
                })
                .store(in: &subscriptions)
            
            publisher
                .connect()
                .store(in: &subscriptions)
        }
    }
}

// - MARK: Button Actions
extension Chapter09_ViewController {
    
    @objc private func didTapFirstEx() {
        networking()
    }
    
    @objc private func didTapSecondEx() {
        codableSupport()
    }
    
    @objc private func didTapThirdEx() {
        multicast()
    }
}
