import UIKit

struct CardsConstants {
    
    static let CROWNS_VIEW: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }()
    
    static let PLATINUM_BONUS_VIEW: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 9
        view.clipsToBounds = true
        
        return view
    }()
    
    static func ROUBLES_ICON() -> UIImageView {
        UIImageView(image: UIImage(named: "roublesIcon"))
    }
    static let TINKOFF_BLACK_CARD_ICON = UIImageView(image: UIImage(named: "tinkoffBlackMC"))
    static let TIKOFF_BLACK_EXTRA_CARD_ICON = UIImageView(image: UIImage(named: "tinkoffBlackMIR"))
    static let TINKOFF_PLATINUM_ICON = UIImageView(image: UIImage(named: "tinkoffPlatinumIcon"))
    static let CROWN_ICON = UIImageView(image: UIImage(named: "crownIcon"))
    static let PLATINUM_BONUS_ICON = UIImageView(image: UIImage(named: "platinumBonusIcon"))
}
