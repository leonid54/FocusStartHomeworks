//
//  HobbieViewController.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit
import SnapKit

class HobbieViewController: UIViewController {
    
    struct HobbieScreenContent {
        internal let sportText = "Спорт"
        internal let descSportText = "Бывший профессиональный спортсмен в различных видах спорта: Триатлон(зим, лет. КМС), Лыжные гонки(КМС), Велоспорт(КМС), Плавание(КМС), Настольный теннис(2 в.р)."
        internal let artText = "Исскуство"
        internal let descArtText = "10 лет обучался и выступал на международных конкурсах по фортепиано."
    }
    
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let sportLabel = UILabel()
    private let descSportLabel = UILabel()
    private let artLabel = UILabel()
    private let descArtLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    internal func setContent(model: HobbieScreenContent) {
        self.sportLabel.text = model.sportText
        self.descSportLabel.text = model.descSportText
        self.artLabel.text = model.artText
        self.descArtLabel.text = model.descArtText
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

        self.contentView.addSubview(self.sportLabel)
        self.contentView.addSubview(self.descSportLabel)
        self.contentView.addSubview(self.artLabel)
        self.contentView.addSubview(self.descArtLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = .white

        self.sportLabel.textColor = .black
        self.sportLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.sportLabel.adjustsFontSizeToFitWidth = true
        self.sportLabel.numberOfLines = 0
        
        self.descSportLabel.adjustsFontSizeToFitWidth = true
        self.descSportLabel.numberOfLines = 0
        
        self.artLabel.textColor = .black
        self.artLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.artLabel.adjustsFontSizeToFitWidth = true
        self.artLabel.numberOfLines = 0
        
        self.descArtLabel.adjustsFontSizeToFitWidth = true
        self.descArtLabel.numberOfLines = 0
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

        self.sportLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descSportLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sportLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }

        self.artLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.descSportLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descArtLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.artLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
    }
}
