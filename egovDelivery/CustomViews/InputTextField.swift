import UIKit

final class InputTextField: UIView {
    
  
    
    let constants = Constants()
    let text: String
    var height: Double = 50
    
    var delegate: UITextFieldDelegate? {
        didSet{
            customTextField.delegate = delegate
        }
    }
    
    init(placeholderText: String, textFieldHeight: Double) {
        text = placeholderText
        height = textFieldHeight
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.layer.borderWidth = 2
        self.layer.borderColor = constants.buttonColor.cgColor
        self.backgroundColor = .white
        self.layer.cornerRadius = 25.0
        self.addSubview(customTextField)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height),
            customTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            customTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            customTextField.topAnchor.constraint(equalTo: self.topAnchor),
            customTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    lazy var customTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,  NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15)! ])
        textField.layer.cornerRadius = 20.0
        textField.returnKeyType = .search
        return textField
    } ()
    
    
    
}
