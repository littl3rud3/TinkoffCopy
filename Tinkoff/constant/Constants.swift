import UIKit
import SkeletonView

struct Constants {

    static func COMMON_BUTTON() -> UIButton  {

        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? DARK_VIEW_COLOR : LIGHT_VIEW_COLOR

        return button
    }
    
    static func COMMON_VIEW() -> UIView {

        let uiView = UIView()
        uiView.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? DARK_VIEW_COLOR : LIGHT_VIEW_COLOR
        uiView.layer.cornerRadius = 20
        uiView.isSkeletonable = true
        uiView.skeletonCornerRadius = 15

        return uiView
    }
    
    static let DARK_VIEW_COLOR = #colorLiteral(red: 0.1079376563, green: 0.1088205203, blue: 0.1190210059, alpha: 1)
    static let LIGHT_VIEW_COLOR = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)

    static func LABEL_12_BOLD_FONT(text: String) -> UILabel {
        
        createBoldLabel(text: text, fontSize: 12)
    }
    
    static func LABEL_17_BOLD_FONT(text: String) -> UILabel {

        createBoldLabel(text: text, fontSize: 17)
    }
    
    static func LABEL_14_BOLD_FONT(text: String) -> UILabel {
        
        createBoldLabel(text: text, fontSize: 14)
    }
    
    static func LABEL_20_BOLD_FONT(text: String) -> UILabel {
        
        createBoldLabel(text: text, fontSize: 20)
    }
    
    static func LABEL_14_FONT(text: String) -> UILabel {
        
        createLabel(text: text, fontSize: 14)
    }
    
    static func LABEL_15_FONT(text: String) -> UILabel {
        
        createLabel(text: text, fontSize: 15)
    }
    
    static func CURRENCY(text: String) ->  UILabel {
        
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5514283776, green: 0.5585219264, blue: 0.581197381, alpha: 1)
        label.text = text
        label.font = UIFont(name: "Helvetica Neue", size: 13)
        
        return label
    }
    
    static func SEARCH_BUTTON() -> UIButton  {
        
        let button = UIButton()
        button.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.1079376563, green: 0.1088205203, blue: 0.1190210059, alpha: 1) : #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694762826, alpha: 1)
        button.layer.cornerRadius = 12
        
        return button
    }
    
    
    private static func createBoldLabel(text: String, fontSize: Int) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Helvetica Neue Bold", size: CGFloat(fontSize))
        label.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        
        return label
    }
    
    private static func createLabel(text: String, fontSize: Int) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Helvetica Neue", size: CGFloat(fontSize))
        label.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        
        return label
    }
}
