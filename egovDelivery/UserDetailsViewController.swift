//
//  userDetailsViewController.swift
//  egovDelivery
//
//  Created by Temirlan Tursynbekov on 15.04.2023.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    let userDetailsView = UserDetailsView()
    var fldata : FLData?{
        didSet{
            guard let fldata = fldata else {return}
            userDetailsView.nameLabel.text = fldata.firstName
            userDetailsView.surnameLabel.text = fldata.lastName
            userDetailsView.idLabel.text = fldata.iin
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

