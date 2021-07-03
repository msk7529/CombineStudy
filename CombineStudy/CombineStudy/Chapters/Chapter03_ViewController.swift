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
    
    private lazy var sixthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "sixthEx")
        button.addTarget(self, action: #selector(didTapSixthEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var seventhExBtn: commonBtn = {
        let button: commonBtn = .init(title: "seventhEx")
        button.addTarget(self, action: #selector(didTapSeventhEx), for: .touchUpInside)
        return button
    }()
    
    private lazy var eighthExBtn: commonBtn = {
        let button: commonBtn = .init(title: "eighthEx")
        button.addTarget(self, action: #selector(didTapEighthEx), for: .touchUpInside)
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
        self.view.addSubview(sixthExBtn)
        self.view.addSubview(seventhExBtn)
        self.view.addSubview(eighthExBtn)
        
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
        
        seventhExBtn.topAnchor.constraint(equalTo: fourthExBtn.bottomAnchor, constant: 30).isActive = true
        seventhExBtn.leadingAnchor.constraint(equalTo: fourthExBtn.leadingAnchor).isActive = true
        seventhExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        seventhExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        eighthExBtn.topAnchor.constraint(equalTo: seventhExBtn.topAnchor).isActive = true
        eighthExBtn.leadingAnchor.constraint(equalTo: seventhExBtn.trailingAnchor, constant: 30).isActive = true
        eighthExBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eighthExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    private func replaceNil() {
        ["A", nil, "C"].publisher
            .eraseToAnyPublisher()  // type erase를 수행하지 않으면 replaceNil 수행시 언래핑되지 않은 상태로 출력된다. 버그인가? 나중에 고쳐질려나 ..
            .replaceNil(with: "-")
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
    }
    
    private func replaceEmpty() {
        // replaceEmpty(with:): publihser가 값을 내보내지 않고 완료하는 경우 값을 대체하거나 실제로 삽입할 수 있다.
        example(of: "replaceEmpty(with:)") {
            let empty = Empty<Int, Never>()
            
            empty.replaceEmpty(with: 1)
                .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
                .store(in: &subscriptions)
        }
    }
    
    private func scan() {
        // scan(_:_:): upstream publisher가 클로저에 내보낸 현재값과 해당 클로저에 의해 반환된 마지막 값을 제공
        // reduce 처럼 사용할 수 있는것 같음.
        var dailyGainLose: Int {
            .random(in: -10...10)
        }
        
        let august2019 = (0..<22).map { _ in dailyGainLose }.publisher
        
        august2019
            .scan(50) { max(0, $0 + $1) }
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
    
    @objc private func didTapSixthEx() {
        replaceNil()
    }
    
    @objc private func didTapSeventhEx() {
        replaceEmpty()
    }
    
    @objc private func didTapEighthEx() {
        scan()
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
