import UIKit

struct SearchConstants {
    
    static var exchangeRates: UIView = {
        
        let view = UIView()
        view.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.1079376563, green: 0.1088205203, blue: 0.1190210059, alpha: 1) : #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694762826, alpha: 1)
        view.layer.cornerRadius = 15
        
        return view
    }()
}
