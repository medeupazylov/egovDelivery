//
//  userDetailsViewController.swift
//  egovDelivery
//
//  Created by Temirlan Tursynbekov on 15.04.2023.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    let userDetailsView = UserDetailsView()
    var orderData : OrderData?{
        didSet{
            guard let data = orderData else {return}
//            print(data)
            print("we are herrre")
            
//            userDetailsView.nameLabel.text = data.data.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = userDetailsView
        buttonTargets()
    }
    
    func buttonTargets(){
        userDetailsView.agreeCheck.checkBox.addTarget(self, action: #selector(pressCheckBox), for: .touchUpInside)
    }

    @objc func pressCheckBox(){
        
        
        
    }
}

