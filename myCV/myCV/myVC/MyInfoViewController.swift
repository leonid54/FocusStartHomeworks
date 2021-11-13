//
//  ViewController.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit

class MyInfoViewController: UIViewController {
    struct MyInfoScreenContent {
        internal let nameText = "Имя: Леонид"
        internal let surnameText = "Фамилия: Горбунцов"
        internal let ageText = "Возраст: 20 лет"
        internal let educationText = "Образование: НГТУ"
        internal let cityText = "Город: г.Новосибирск"
    }
    
    private let newView = UIView()
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private var myPhoto = UIImage()
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let ageLabel = UILabel()
    private let educationLabel = UILabel()
    private let cityLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    internal func setContent(model: MyInfoScreenContent) {
        self.nameLabel.text = model.nameText
        self.surnameLabel.text = model.surnameText
        self.ageLabel.text = model.ageText
        self.educationLabel.text = model.educationText
        self.cityLabel.text = model.cityText
    }

    private func configure() {
        self.setContent(model: .init())
        self.addSubviews()
        self.setScrollConstraint()
        self.setContentConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.surnameLabel)
        self.contentView.addSubview(self.ageLabel)
        self.contentView.addSubview(self.educationLabel)
        self.contentView.addSubview(self.cityLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = .white
        
        self.myPhoto = UIImage(named: "myPhoto") ?? myPhoto
        self.imageView.image = myPhoto
        self.imageView.contentMode = .scaleAspectFit
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.ageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.educationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cityLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setScrollConstraint() {
        NSLayoutConstraint.activate([self.scrollView.topAnchor.constraint         (equalTo: self.view.topAnchor),
                                     self.scrollView.bottomAnchor.constraint      (equalTo: self.view.bottomAnchor),
                                     self.scrollView.leadingAnchor.constraint     (equalTo: self.view.leadingAnchor),
                                     self.scrollView.trailingAnchor.constraint    (equalTo: self.view.trailingAnchor),
                                     
                        self.contentView.topAnchor.constraint         (equalTo: self.scrollView.topAnchor),
                        self.contentView.bottomAnchor.constraint      (equalTo: self.scrollView.bottomAnchor),
                        self.contentView.trailingAnchor.constraint    (equalTo: self.scrollView.trailingAnchor),
                        self.contentView.leadingAnchor.constraint     (equalTo: self.scrollView.leadingAnchor),
                                     
                        self.contentView.widthAnchor.constraint        (equalTo: self.scrollView.widthAnchor),
                        self.contentView.heightAnchor.constraint       (equalTo: self.scrollView.heightAnchor, constant: 300)]) //поставил палку из-за бага на маленьких экранах
    }
    
    private func setContentConstraint() {
        NSLayoutConstraint.activate([
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 14),
            self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -14),
            self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
//            баг на маленьких экранах
            self.nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 30),
            self.nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor , constant: 20),
            
            self.surnameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 30),
            self.surnameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.surnameLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor , constant: 20),

            self.ageLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 30),
            self.ageLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.ageLabel.topAnchor.constraint(equalTo: self.surnameLabel.bottomAnchor , constant: 20),

            self.educationLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 30),
            self.educationLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.educationLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor , constant: 20),
            
            self.cityLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 30),
            self.cityLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            self.cityLabel.topAnchor.constraint(equalTo: self.educationLabel.bottomAnchor , constant: 20),
        ])
    }
}
