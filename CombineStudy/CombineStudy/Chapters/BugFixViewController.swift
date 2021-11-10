//
//  BugFixViewController.swift
//  CombineStudy
//
//  Created on 2021/11/10.
//

import UIKit
import Combine

final class ObserveViewModel {
    @Published var progressValue: Float = 0.01
}

final class BugFixViewController: UIViewController {

    private lazy var firstExBtn: commonBtn = {
        let button: commonBtn = .init(title: "progressView")
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0xFE, green: 0xE5, blue: 0x00, alpha: 1)
        button.addTarget(self, action: #selector(didTapProgressView), for: .touchUpInside)
        return button
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView: UIProgressView = .init(progressViewStyle: .bar)
        progressView.progressTintColor = UIColor(red: 0xFE, green: 0xE5, blue: 0x00, alpha: 1)  // 이 컬러가 왜 흰색이지 ... 버튼은 정상인데
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.5
        progressView.isAccessibilityElement = false
        progressView.layer.cornerRadius = 2
        progressView.layer.masksToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    let viewModel: ObserveViewModel = .init()
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "BugFix"
        
        self.initView()
    }

    private func initView() {
        self.view.addSubview(firstExBtn)
        self.view.addSubview(progressView)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 130).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        progressView.centerYAnchor.constraint(equalTo: firstExBtn.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: firstExBtn.trailingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        //bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.$progressValue
            .sink { [weak self] value in
                self?.progressView.progress = value
                self?.progressView.progressTintColor = UIColor(red: 0xFE, green: 0xE5, blue: 0x00, alpha: 1.00)
                //self?.progressView.progressTintColor = value > 0.1 ? .red : .yellow
            }.store(in: &subscriptions)
    }
    
}

extension BugFixViewController {
    @objc
    private func didTapProgressView() {
        let just: Just<Float> = .init(0.5)

        just.sink(receiveCompletion: { failure in
            print("Received completion", failure)
        }, receiveValue: { [weak self] value in
            self?.progressView.progressTintColor = .red
        }).store(in: &subscriptions)
    }
}
