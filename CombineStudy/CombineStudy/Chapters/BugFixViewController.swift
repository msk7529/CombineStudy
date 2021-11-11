//
//  BugFixViewController.swift
//  CombineStudy
//
//  Created on 2021/11/10.
//

import UIKit
import Combine

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
    
    private lazy var slider: RoundedSlider = {
        let slider: RoundedSlider = .init(height: 4, minTrackColor: .yellow, maxTrackColor: .systemGray)
        slider.value = 0.3
        slider.isUserInteractionEnabled = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
        
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
        self.view.addSubview(slider)
        
        firstExBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        firstExBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        firstExBtn.widthAnchor.constraint(equalToConstant: 130).isActive = true
        firstExBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        progressView.centerYAnchor.constraint(equalTo: firstExBtn.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: firstExBtn.trailingAnchor, constant: 10).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        slider.topAnchor.constraint(equalTo: firstExBtn.bottomAnchor, constant: 10).isActive = true
        slider.leadingAnchor.constraint(equalTo: firstExBtn.leadingAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 300).isActive =  true
        slider.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        firstExBtn.layer.applyShadow(color: .red, x: 0, y: 2, blur: 5, spread: 0)
    }
}

extension BugFixViewController {
    @objc
    private func didTapProgressView() {
        let just: Just<Float> = .init(0.01)

        just.sink(receiveCompletion: { failure in
            print("Received completion", failure)
        }, receiveValue: { [weak self] value in
            // value가 1.0 일때, thumb가 slider의 오른쪽끝을 벗어나는 문제가 있어서 0.99까지만 주어야 함.
            self?.progressView.progress = value
            self?.progressView.progressTintColor = .red
            self?.slider.value = min(0.99, value)
            self?.slider.remakeThumb(withColor: .red)
        }).store(in: &subscriptions)
    }
}

private extension CALayer {
    func applyShadow(color: UIColor, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        masksToBounds = false
        shadowOpacity = 0
        shadowColor = color.cgColor
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2
        if spread == 0 {
            shadowPath = nil
        } else {
            let dxx = -spread
            let rect = bounds.insetBy(dx: dxx, dy: dxx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
