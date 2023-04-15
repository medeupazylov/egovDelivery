import UIKit

final class MainView: UIView {
    
    let constants = Constants()
    
    let number = 3;
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = constants.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let mainStack: UIStackView = {
        let stack = UIStackView
        stack
        
        return stack
    }
    
    
    
}
