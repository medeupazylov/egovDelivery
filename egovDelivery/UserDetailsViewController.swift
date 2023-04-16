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
            userDetailsView.greetingLabel.text = "Здравствуйте, \n\(fldata.firstName)"
            userDetailsView.name.text = fldata.firstName
            userDetailsView.surname.text = fldata.lastName
            userDetailsView.id.text = fldata.iin
        }
    }
    
    var bmgdata : BmgData?{
        didSet{
            guard let bmgdata = bmgdata else{return}
            userDetailsView.phoneNum.text = bmgdata.phone
        }
    }
    
    var orderdata : OrderData?{
        didSet{
            guard let orderdata = orderdata else{return}
            userDetailsView.serviceName.text = orderdata.data.serviceType.nameRu
            userDetailsView.department.text = orderdata.data.organization.nameRu
            userDetailsView.orderNum.text = orderdata.data.requestId
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view = userDetailsView
        buttonTargets()
    }
    
    func buttonTargets(){
        userDetailsView.agreeCheck.checkBox.addTarget(self, action: #selector(pressCheckBox), for: .touchUpInside)
        userDetailsView.acceptCheck.checkBox.addTarget(self, action: #selector(pressCheckBox), for: .touchUpInside)
        userDetailsView.payButton.addTarget(self, action: #selector(payButtonPressed), for: .touchUpInside)
        userDetailsView.responsibilyMeButton.addTarget(self, action: #selector(mePressed), for: .touchUpInside)
        userDetailsView.responsibilyOtherButton.addTarget(self, action: #selector(otherPressed), for: .touchUpInside)
    }
    
    @objc func mePressed(){
        if (userDetailsView.responsibilyMeButton.titleLabel?.textColor == UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)){
        }else{
            userDetailsView.responsibilyOtherButton.setAttributedTitle(NSAttributedString(string: "Примет другой \nчеловек", attributes: [
                NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15),
                NSAttributedString.Key.foregroundColor : UIColor.lightGray]), for: .normal)
            userDetailsView.responsibilyOtherButton.layer.borderColor = UIColor.lightGray.cgColor
            userDetailsView.responsibilyMeButton.setAttributedTitle(NSAttributedString(string: "Приму я \nчеловек", attributes: [
                NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15),
                NSAttributedString.Key.foregroundColor : UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)]), for: .normal)
            userDetailsView.responsibilyMeButton.layer.borderColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0).cgColor
        }
    }
    
    @objc func otherPressed(){
        if (userDetailsView.responsibilyOtherButton.titleLabel?.textColor == UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)){
        }else{
            userDetailsView.responsibilyMeButton.setAttributedTitle(NSAttributedString(string: "Приму я \nчеловек", attributes: [
                NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15),
                NSAttributedString.Key.foregroundColor : UIColor.lightGray]), for: .normal)
            userDetailsView.responsibilyMeButton.layer.borderColor = UIColor.lightGray.cgColor
            userDetailsView.responsibilyOtherButton.setAttributedTitle(NSAttributedString(string: "Примет другой \nчеловек", attributes: [
                NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15),
                NSAttributedString.Key.foregroundColor : UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)]), for: .normal)
            userDetailsView.responsibilyOtherButton.layer.borderColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0).cgColor
        }
    }
    
    @objc func pressCheckBox(_ sender : UIButton){
        if (sender.currentImage == UIImage(systemName: "square")!){
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @objc func payButtonPressed(){
        if (self.userDetailsView.acceptCheck.checkBox.currentImage == UIImage(systemName: "checkmark.square.fill") && self.userDetailsView.agreeCheck.checkBox.currentImage == UIImage(systemName: "checkmark.square.fill")){
            userDetailsView.notAgreeCheck.isHidden = true
            userDetailsView.notAcceptCheck.isHidden = true
        }else{
            if (self.userDetailsView.acceptCheck.checkBox.currentImage == UIImage(systemName: "checkmark.square.fill")){
                userDetailsView.notAcceptCheck.isHidden = true
            }else{
                userDetailsView.notAcceptCheck.isHidden = false
            }
            if (self.userDetailsView.agreeCheck.checkBox.currentImage == UIImage(systemName: "checkmark.square.fill")){
                userDetailsView.notAgreeCheck.isHidden = true
            }else{
                userDetailsView.notAgreeCheck.isHidden = false
            }
        }
    }
}

