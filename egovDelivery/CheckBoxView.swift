//
//  CheckBoxView.swift
//  egovDelivery
//
//  Created by Temirlan Tursynbekov on 16.04.2023.
//

import Foundation
import UIKit

final class CheckBoxView : UIView {
    
    let constants = Constants()
    
    var isChecked = false
    
    let checkBox : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.imageView!.tintColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var label = UILabel()
    
    init(string: String) {
        super.init(frame: .zero)
        let label = LabelSampleView(string: string, style: "SemiBold", size: 15)
        self.label = label
        setup()
        setLayouts()
    }
    
    func setup(){
        self.addSubview(checkBox)
        self.addSubview(label)
    }
    
    func setLayouts(){
        NSLayoutConstraint.activate([
            checkBox.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkBox.leftAnchor.constraint(equalTo: self.leftAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: 50),
            checkBox.heightAnchor.constraint(equalToConstant: 50),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leftAnchor.constraint(equalTo: checkBox.rightAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
