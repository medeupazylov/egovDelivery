//
//  ViewController.swift
//  egovDelivery
//
//  Created by Medeu Pazylov on 15.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView();

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        print(mainView.number)
        
    }
    

}

