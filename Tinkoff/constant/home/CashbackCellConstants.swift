import UIKit

struct CashbackCellConstants {
    
    static var CASHBACK_INFO_BUTTON: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(
            red: 0.1723024547, green: 0.1727027297, blue: 0.1774727106, alpha: 1)
        
        return button
    }()
    
    static var OVAL_VIEW: UIView = {
        var uiView = UIView()
        uiView.layer.cornerRadius = 15
        
        return uiView
    }()
    
    static var BALANCE_LABEL: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    static var CASHBACK_ACCUMULATED: UILabel = {
        var uiLabel = UILabel()
        uiLabel.numberOfLines = 2
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        
        return uiLabel
    }()
    
    static var WILL_BE_CREDITED: UILabel = {
        
        var uiLabel = UILabel()
        uiLabel.textColor = #colorLiteral(
            red: 0.5283680558, green: 0.53552562, blue: 0.5583892465, alpha: 1)
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        uiLabel.numberOfLines = 2
        
        return uiLabel
    }()
}
