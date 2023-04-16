//
//  LabelSampleView.swift
//  egovDelivery
//
//  Created by Temirlan Tursynbekov on 15.04.2023.
//

import Foundation
import UIKit

final class LabelSampleView : UILabel {
//    var string = String()
//    let style = String()
//    let size = Int()
    
    init(string: String, style : String, size : Int) {
        super.init(frame: .zero)
        self.textAlignment = .left
        self.textColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Montserrat-\(style)", size: CGFloat(size))
        self.text = string
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
