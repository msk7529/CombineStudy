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
}

// - MARK: Button Actions
extension Chapter09_ViewController {
    
    @objc private func didTapFirstEx() {
        networking()
    }
    
    @objc private func didTapSecondEx() {
        codableSupport()
    }
}
