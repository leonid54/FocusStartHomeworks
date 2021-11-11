//
//  ViewController.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit

class MyInfoViewController: UIViewController {
    struct MyInfoScreenContent {
        internal let devExperienceText = "Как давно занимаетесь программированием?"
        internal let descDevExperienceText = "Я занимаюсь программирование на протяжении 3 лет"
        internal let languageExperienceText = "Какие языки изучали?"
        internal let descLanguageExperienceText = "Языки, которые я изучал: С, С++, С#, Swift, Python, Assembly"
        internal let myExpectText = "Чего ждете от обучения?"
        internal let descMyExpectText = "Ожидаю, что я получу и закреплю полученные знания и буду использовать их в работе!"
    }
    
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let myPhoto = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    internal func setContent(model: MyInfoScreenContent) {
        
    }

    private func configure() {
        self.setContent(model: .init())
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)

//        self.contentView.addSubview(self.devExperienceLabel)
//        self.contentView.addSubview(self.descDevExperienceLabel)
//        self.contentView.addSubview(self.languageExperienceLabel)
//        self.contentView.addSubview(self.descLanguageExperienceLabel)
//        self.contentView.addSubview(self.myExpectLabel)
//        self.contentView.addSubview(self.descMyExpectLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = .white


    }

    private func setConstraint() {
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
//        self.contentView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 0).isActive = true
//        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
//        self.contentView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: 0).isActive = true
//        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}

