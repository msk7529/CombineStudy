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
    
    private lazy var chapter3Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter03")
        button.addTarget(self, action: #selector(moveChapter3), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter4Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter04")
        button.addTarget(self, action: #selector(moveChapter4), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter5Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter05")
        button.addTarget(self, action: #selector(moveChapter5), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter6Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter06")
        button.addTarget(self, action: #selector(moveChapter6), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter7Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter07")
        button.addTarget(self, action: #selector(moveChapter7), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter9Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter09")
        button.addTarget(self, action: #selector(moveChapter9), for: .touchUpInside)
        return button
    }()
    
    private lazy var chapter10Btn: commonBtn = {
        let button: commonBtn = .init(title: "Chapter10")
        button.addTarget(self, action: #selector(moveChapter10), for: .touchUpInside)
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
        self.view.addSubview(chapter3Btn)
        self.view.addSubview(chapter4Btn)
        self.view.addSubview(chapter5Btn)
        self.view.addSubview(chapter6Btn)
        self.view.addSubview(chapter7Btn)
        self.view.addSubview(chapter9Btn)
        self.view.addSubview(chapter10Btn)
        
        chapter2Btn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        chapter2Btn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        chapter2Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter2Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter3Btn.topAnchor.constraint(equalTo: chapter2Btn.topAnchor).isActive = true
        chapter3Btn.leadingAnchor.constraint(equalTo: chapter2Btn.trailingAnchor, constant: 30).isActive = true
        chapter3Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter3Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter4Btn.topAnchor.constraint(equalTo: chapter2Btn.topAnchor).isActive = true
        chapter4Btn.leadingAnchor.constraint(equalTo: chapter3Btn.trailingAnchor, constant: 30).isActive = true
        chapter4Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter4Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter5Btn.topAnchor.constraint(equalTo: chapter2Btn.bottomAnchor, constant: 30).isActive = true
        chapter5Btn.leadingAnchor.constraint(equalTo: chapter2Btn.leadingAnchor).isActive = true
        chapter5Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter5Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter6Btn.topAnchor.constraint(equalTo: chapter5Btn.topAnchor).isActive = true
        chapter6Btn.leadingAnchor.constraint(equalTo: chapter5Btn.trailingAnchor, constant: 30).isActive = true
        chapter6Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter6Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter7Btn.topAnchor.constraint(equalTo: chapter6Btn.topAnchor).isActive = true
        chapter7Btn.leadingAnchor.constraint(equalTo: chapter6Btn.trailingAnchor, constant: 30).isActive = true
        chapter7Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter7Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter9Btn.topAnchor.constraint(equalTo: chapter5Btn.bottomAnchor, constant: 30).isActive = true
        chapter9Btn.leadingAnchor.constraint(equalTo: chapter5Btn.leadingAnchor).isActive = true
        chapter9Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter9Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        chapter10Btn.topAnchor.constraint(equalTo: chapter9Btn.topAnchor).isActive = true
        chapter10Btn.leadingAnchor.constraint(equalTo: chapter9Btn.trailingAnchor, constant: 30).isActive = true
        chapter10Btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chapter10Btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // - MARK: Move to chapter examples

    @objc private func moveChapter2() {
        let nextVC: Chapter02_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter3() {
        let nextVC: Chapter03_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter4() {
        let nextVC: Chapter04_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter5() {
        let nextVC: Chapter05_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter6() {
        let nextVC: Chapter06_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter7() {
        let nextVC: Chapter07_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter9() {
        let nextVC: Chapter09_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func moveChapter10() {
        let nextVC: Chapter10_ViewController = .init()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

