//
//  ViewController.swift
//  CombineStudy
//
//  Created by kakao on 2021/07/01.
//

import UIKit

class FirstViewController: UIViewController {

    private lazy var chapter2Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter02")
        button.addTarget(self, action: #selector(moveChapter2), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Combine Test"
        
        self.initView()
    }

    private func initView() {
        self.view.addSubview(chapter2Btn)
        
        chapter2Btn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        chapter2Btn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        chapter2Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter2Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // - MARK: Move to chapter examples

    @objc private func moveChapter2() {
        let nextVC: Chapter02_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

