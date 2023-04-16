//
//  userDetailsView.swift
//  egovDelivery
//
//  Created by Temirlan Tursynbekov on 15.04.2023.
//

import UIKit

final class UserDetailsView : UIView {
    
    let constants = Constants()
    
    let greetingLabel : UILabel = {
        let text = UILabel()
        text.textAlignment = .left
        text.textColor = .white
        text.text = "Здравствуйте,\nMedeu!"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "Montserrat-SemiBold", size: 40)
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        return text
    }()
    
    let greetingView : UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 109/255, green: 214/255, blue: 194/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let orderNumLabel = LabelSampleView(string: "Номер заказа", style: "SemiBold", size: 15)
    
    let serviceNameLabel = LabelSampleView(string: "Наименование услуги", style: "SemiBold", size: 15)
    
    let departmentLabel = LabelSampleView(string: "Отделение", style: "SemiBold", size: 15)
    
    let clientInfoLabel = LabelSampleView(string: "Данные \nполучателя", style: "SemiBold", size: 30)
    
    let nameLabel = LabelSampleView(string: "Имя", style: "SemiBold", size: 15)
    
    let surnameLabel = LabelSampleView(string: "Фамилия", style: "SemiBold", size: 15)
    
    let idLabel = LabelSampleView(string: "ИИН", style: "SemiBold", size: 15)
    
    let phoneNumLabel = LabelSampleView(string: "Номер телефона", style: "SemiBold", size: 15)
    
    let addressLabel = LabelSampleView(string: "Адрес доставки", style: "SemiBold", size: 30)
    
    let regionAddress = InputTextField(placeholderText: "Область", textFieldHeight: 50)
    
    let cityAddress = InputTextField(placeholderText: "Город", textFieldHeight: 50)
    
    let streetAddress = InputTextField(placeholderText: "Улица", textFieldHeight: 50)
    
    let apartmentAddress = InputTextField(placeholderText: "Номер Дома", textFieldHeight: 50)
    
    let flatNumAddress = InputTextField(placeholderText: "Квартира", textFieldHeight: 50)
    
    let gateNumAddress = InputTextField(placeholderText: "Подъезд", textFieldHeight: 50)
    
    let floorNumAddress = InputTextField(placeholderText: "Этаж", textFieldHeight: 50)
    
    let blockNumAddress = InputTextField(placeholderText: "Корпус", textFieldHeight: 50)
    
    let apartmentNameAddress = InputTextField(placeholderText: "Наименование ЖК", textFieldHeight: 50)
    
    let additionAddress = InputTextField(placeholderText: "Дополнительная Информация", textFieldHeight: 50)
    
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.layer.cornerRadius = 30
        return scroll
    }()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
    }()
    
    let infoStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let responsibilityStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    let responsibilyMeButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0).cgColor
        button.setAttributedTitle(NSAttributedString(string: "Приму я", attributes: [
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15)!,
            NSAttributedString.Key.foregroundColor : UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)]), for: .normal)
        return button
    }()
    
    let responsibilyOtherButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setAttributedTitle(NSAttributedString(string: "Примет другой \nчеловек", attributes: [
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15)!,
            NSAttributedString.Key.foregroundColor : UIColor.lightGray]), for: .normal)
        return button
    }()
    
    let acceptCheck = CheckBoxView(string: "Я принимаю условия публичного договора-оферты")
    
    let agreeCheck = CheckBoxView(string: "Я ознакомлен и согласен с условиями политики конфиденциальности и персональных данных")
    
    let payButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 19/255, green: 125/255, blue: 197/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Перейти к оплате", attributes: [
            NSAttributedString.Key.font : UIFont(name: "Montserrat-SemiBold", size: 15)!,
            NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = constants.backgroundColor
        setup()
        setLayout()
    }
    
    func setup(){
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(greetingView)
        stackView.addArrangedSubview(infoStack)
        greetingView.addSubview(greetingLabel)
        infoStack.addArrangedSubview(orderNumLabel)
        infoStack.addArrangedSubview(serviceNameLabel)
        infoStack.addArrangedSubview(departmentLabel)
        infoStack.addArrangedSubview(clientInfoLabel)
        infoStack.addArrangedSubview(idLabel)
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(surnameLabel)
        infoStack.addArrangedSubview(phoneNumLabel)
        infoStack.addArrangedSubview(addressLabel)
        infoStack.addArrangedSubview(regionAddress)
        infoStack.addArrangedSubview(cityAddress)
        infoStack.addArrangedSubview(streetAddress)
        infoStack.addArrangedSubview(apartmentAddress)
        infoStack.addArrangedSubview(flatNumAddress)
        infoStack.addArrangedSubview(gateNumAddress)
        infoStack.addArrangedSubview(floorNumAddress)
        infoStack.addArrangedSubview(blockNumAddress)
        infoStack.addArrangedSubview(apartmentNameAddress)
        infoStack.addArrangedSubview(additionAddress)
        infoStack.addArrangedSubview(responsibilityStack)
        responsibilityStack.addArrangedSubview(responsibilyMeButton)
        responsibilityStack.addArrangedSubview(responsibilyOtherButton)
        infoStack.addArrangedSubview(acceptCheck)
        infoStack.addArrangedSubview(agreeCheck)
        infoStack.addArrangedSubview(payButton)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
        scrollView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
        scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        scrollView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
        stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        
        greetingView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        greetingView.heightAnchor.constraint(equalToConstant: 150),
        
        greetingLabel.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor),
        greetingLabel.centerYAnchor.constraint(equalTo: greetingView.centerYAnchor),
        
        infoStack.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
        infoStack.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
                
        responsibilyMeButton.heightAnchor.constraint(equalToConstant: 50),
        responsibilyOtherButton.heightAnchor.constraint(equalToConstant: 50),
        
        payButton.heightAnchor.constraint(equalToConstant: 50),
        acceptCheck.heightAnchor.constraint(equalToConstant: 50),
        agreeCheck.heightAnchor.constraint(equalToConstant: 70)
        ])
        for view in infoStack.arrangedSubviews{
            makeLayouts(view: view)
        }
        makeLayouts(view: acceptCheck)
        makeLayouts(view: agreeCheck)
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: stackView.bounds.height)
    }
    
    func makeLayouts(view: UIView){
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: self.infoStack.rightAnchor, constant: -20),
            view.leftAnchor.constraint(equalTo: self.infoStack.leftAnchor, constant: 20)
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}