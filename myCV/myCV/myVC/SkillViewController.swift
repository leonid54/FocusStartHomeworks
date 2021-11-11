//
//  SkillViewController.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit
import SnapKit

class SkillViewController: UIViewController {
    
    struct SkillScreenContent {
        internal let devExperienceText = "Как давно занимаетесь программированием?"
        internal let descDevExperienceText = "Я занимаюсь программирование на протяжении 3 лет"
        internal let languageExperienceText = "Какие языки изучали?"
        internal let descLanguageExperienceText = "Языки, которые я изучал: С, С++, С#, Swift, Python, Assembly"
        internal let myExpectText = "Чего ждете от обучения?"
        internal let descMyExpectText = "Ожидаю, что я получу и закреплю полученные знания и буду использовать их в работе!"
    }
    
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let devExperienceLabel = UILabel()
    private let descDevExperienceLabel = UILabel()
    private let languageExperienceLabel = UILabel()
    private let descLanguageExperienceLabel = UILabel()
    private let myExpectLabel = UILabel()
    private let descMyExpectLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    internal func setContent(model: SkillScreenContent) {
        self.devExperienceLabel.text = model.devExperienceText
        self.descDevExperienceLabel.text = model.descDevExperienceText
        self.languageExperienceLabel.text = model.languageExperienceText
        self.descLanguageExperienceLabel.text = model.descLanguageExperienceText
        self.myExpectLabel.text = model.myExpectText
        self.descMyExpectLabel.text = model.descMyExpectText
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

        self.contentView.addSubview(self.devExperienceLabel)
        self.contentView.addSubview(self.descDevExperienceLabel)
        self.contentView.addSubview(self.languageExperienceLabel)
        self.contentView.addSubview(self.descLanguageExperienceLabel)
        self.contentView.addSubview(self.myExpectLabel)
        self.contentView.addSubview(self.descMyExpectLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = .white

        self.devExperienceLabel.textColor = .black
        self.devExperienceLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.devExperienceLabel.adjustsFontSizeToFitWidth = true
        self.devExperienceLabel.numberOfLines = 0
        
        self.descDevExperienceLabel.adjustsFontSizeToFitWidth = true
        self.descDevExperienceLabel.numberOfLines = 0
        
        self.languageExperienceLabel.textColor = .black
        self.languageExperienceLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.languageExperienceLabel.adjustsFontSizeToFitWidth = true
        self.languageExperienceLabel.numberOfLines = 0
        
        self.descLanguageExperienceLabel.adjustsFontSizeToFitWidth = true
        self.descLanguageExperienceLabel.numberOfLines = 0
        
        self.myExpectLabel.textColor = .black
        self.myExpectLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.myExpectLabel.adjustsFontSizeToFitWidth = true
        self.myExpectLabel.numberOfLines = 0

        self.descMyExpectLabel.adjustsFontSizeToFitWidth = true
        self.descMyExpectLabel.numberOfLines = 0
    }

    private func setConstraint() {
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.scrollView)
            make.bottom.equalTo(self.scrollView)
            make.width.equalTo(self.scrollView)
            make.height.equalTo(self.scrollView)
        }

        self.devExperienceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descDevExperienceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.devExperienceLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }

        self.languageExperienceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.descDevExperienceLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descLanguageExperienceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.languageExperienceLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.myExpectLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.descLanguageExperienceLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descMyExpectLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.myExpectLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
    }
}
