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
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Chapter03"
        
        self.initView()
    }
    
    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(secondExBtn)
        self.view.addSubview(thirdExBtn)
        self.view.addSubview(fourthExBtn)
        self.view.addSubview(fifthExBtn)
        
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
    }
    
    private func quadrantOf(x: Int, y: Int) -> String {
        var quadrant = ""
        
        switch (x, y) {
        case (1..., 1...):
            quadrant = "1"
        case (..<0, 1...):
            quadrant = "2"
        case (..<0, ..<0):
            quadrant = "3"
        case (1..., ..<0):
            quadrant = "4"
        default:
            quadrant = "boundary"
        }
        
        return quadrant
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
    
    private func map() {
        example(of: "map") {
            let formatter: NumberFormatter = .init()
            formatter.numberStyle = .spellOut
            
            [123, 4, 56].publisher
                .map { formatter.string(for: NSNumber(integerLiteral: $0)) ?? "" }
                .sink(receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func mapKeyPath() {
        example(of: "map key paths") {
            let publisher = PassthroughSubject<Coordinate, Never>()
            
            publisher
                .map(\.x, \.y)  // map에서 key path는 최대 3개까지만 사용할 수 있다.
                .sink { x, y in
                    print("The coordinate at \(x), \(y) is in quadrant \(self.quadrantOf(x: x, y: y))")
                }
                .store(in: &subscriptions)
            
            publisher.send(Coordinate(x: 10, y: -8))
            publisher.send(Coordinate(x: 0, y: 5))
        }
    }
    
    private func tryMap() {
        // tryMap: 에러를 throw 할 수 있는 map
        example(of: "tryMap") {
            Just("Directory name that does not exist")
                .tryMap { try FileManager.default.contentsOfDirectory(atPath: $0) }
                .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func flatMap() {
        // flatMap: 다수의 upstream publisher들을 하나의 downstream publisher로 평탄화 할 수 있다.
        func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
            Just(
                codes.compactMap { code in
                    guard (32...255).contains(code) else { return nil }
                    return String(UnicodeScalar(code) ?? " ")
                }.joined()
            ).eraseToAnyPublisher() // 함수의 반환 유형과 일치하도록 publisher의 type을 지운다.
        }
        
        [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33].publisher
            .collect()
            .flatMap(decode)
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
    }
}

// - MARK: Button Actions
extension Chapter03_ViewController {
    @objc private func didTapFirstEx() {
        collect()
    }
    
    @objc private func didTapSecondEx() {
        map()
    }
    
    @objc private func didTapThirdEx() {
        mapKeyPath()
    }
    
    @objc private func didTapFourthEx() {
        tryMap()
    }
    
    @objc private func didTapFifthEx() {
        flatMap()
    }
}

// - MARK: Coordinate
extension Chapter03_ViewController {
    public struct Coordinate {
        public let x: Int
        public let y: Int
        
        public init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
}
