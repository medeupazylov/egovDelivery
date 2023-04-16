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
//        let userDetailsViewController = UserDetailsViewController()
//        userDetailsViewController.modalPresentationStyle = .fullScreen
//        presentDetail(userDetailsViewController)
        
        print("Button pressed")
        
        networkService.makeRequest(nationalId: "020924551400", completion: {bmg, error in
            
            guard let bmg = bmg else {
                return
            }
            print(bmg.firstName)

            
        })
        
    
    }
    
    private func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(viewControllerToPresent, animated: false, completion: nil)
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

