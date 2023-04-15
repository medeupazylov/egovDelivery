import UIKit

final class InputTextField: UIView {
    
    let text: String
    var delegate: UITextFieldDelegate? {
        didSet{
            customTextField.delegate = delegate
        }
    }
    
    init(placeholderText: String) {
        text = placeholderText
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 25.0
        self.addSubview(customTextField)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
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
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,  NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15)! ])
        textField.layer.cornerRadius = 20.0
        textField.returnKeyType = .search
        return textField
    } ()
    
    
    
}
