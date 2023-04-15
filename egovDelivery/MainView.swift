import UIKit

final class MainView: UIView {
    
    let constants = Constants()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = constants.backgroundColor
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(mainStack)
        mainStack.addArrangedSubview(mainIcon)
        mainStack.setCustomSpacing(70, after: mainIcon)
        mainStack.addArrangedSubview(requestTextField)
        mainStack.addArrangedSubview(idTextField)
        mainStack.setCustomSpacing(50, after: idTextField)
        mainStack.addArrangedSubview(searchButton)
        
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            mainStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            mainStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            mainIcon.heightAnchor.constraint(equalToConstant: 240),
            mainIcon.widthAnchor.constraint(equalToConstant: 300),
            
            idTextField.leftAnchor.constraint(equalTo: mainStack.leftAnchor),
            idTextField.rightAnchor.constraint(equalTo: mainStack.rightAnchor),
            idTextField.heightAnchor.constraint(equalToConstant: 55.0),
            
            requestTextField.leftAnchor.constraint(equalTo: mainStack.leftAnchor),
            requestTextField.rightAnchor.constraint(equalTo: mainStack.rightAnchor),
            requestTextField.heightAnchor.constraint(equalToConstant: 55),
            
            searchButton.leftAnchor.constraint(equalTo: mainStack.leftAnchor),
            searchButton.rightAnchor.constraint(equalTo: mainStack.rightAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20.0
        return stack
    } ()
    
    
    let idTextField: InputTextField = {
        let textField = InputTextField(placeholderText: "Введите свой ИИН")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    
    let requestTextField: InputTextField = {
        let textField = InputTextField(placeholderText: "Введите номер вашего заказа")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = constants.buttonColor
        button.layer.cornerRadius = 25.0
        button.setAttributedTitle(NSAttributedString(string: "ПОИСК", attributes: [
            NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20)!,
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]), for: .normal)
        return button
    } ()
    
    let mainIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "main_logo"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    } ()
    
    
}
