//
//  ViewController.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit

class ViewController: UIViewController {

    private var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "main"
        self.label.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(label)
    }


}

