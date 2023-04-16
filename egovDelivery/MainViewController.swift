//
//  ViewController.swift
//  egovDelivery
//
//  Created by Medeu Pazylov on 15.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.idTextField.delegate = self
        mainView.requestTextField.delegate = self
        mainView.searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
    }
    
    @objc func searchButtonAction() {
        print("pressed")
//        networkService.makeRequest(nationalId: "021007551031", completion: {flData, error in
//            if error != nil { print (error)
//                return }
//            guard let flData = flData else { return }
//            
//            print(flData)
//        })
        
        networkService.doRequest(nationalId: "020924551400", completion: {bmgData, error in
            if error != nil { print (error)
                return }
            guard let bmgData = bmgData else { return }
            
            print(bmgData)
        })
//        networkService.performRequest(nationalId: "", requestId: "", completion: { orderData, error in
//            if error != nil { return }
//
//            guard let orderData = orderData else { return }
//
//            print(orderData)
//            userDetailsViewController.orderData = orderData
//
//        })
    }

    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {

        UIView.transition(with: mainView.mainIcon, duration: 0.4,
                          options: .curveEaseOut,
                          animations: {
                        self.mainView.mainIcon.layer.opacity = 0.0
                         self.mainView.mainIcon.isHidden = true
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.transition(with: mainView.mainIcon, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                         self.mainView.mainIcon.layer.opacity = 1.0
                         self.mainView.mainIcon.isHidden = false
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

