import UIKit

struct OperationsAndCashbackConstants {
    
    static var SEGMENTED_OVAL = UIImageView(image: UIImage(named: "segmentedOval"))

    static var WASTES_HARDOCDE: UILabel = {

        let label = UILabel()
        label.text =
            "Трат в \(CalendarConstants.calendarPrepositionalCase[Calendar.current.component(.month, from: Date())]!)"
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        label.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black

        return label
    }()

    static var WASTES: UILabel = {

        let label = UILabel()
        label.text = "303 279 ₽"
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        label.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black

        return label
    }()

    static var CASHBACK_AND_BONUSES: UILabel = {

        let button = UILabel()
        button.text = "Кэшбэк \nи бонусы"
        button.font = UIFont(name: "Helvetica Neue Bold", size: 17)
        button.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        button.lineBreakMode = .byWordWrapping
        button.numberOfLines = 2

        return button
    }()

    static let CASHBACK_MINI_IMAGES_NAMES = [
        "kfcIcon", "yaFoodIcon", "yaMarketIcon", "businessLinesIcon", "pikIcon",
        "sportmasterIcon", "chitaiGorodIcon", "verniiIcon",
    ]
    
    static func CASHBACK_MINI_IMAGES() -> [UIImageView] {
        
        return CASHBACK_MINI_IMAGES_NAMES.map{UIImageView(image: UIImage(named: $0))}
    }
    
    static func cashbackIcons() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: Array(CASHBACK_MINI_IMAGES().shuffled().prefix(upTo: 3)))
        
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        return stack
    }
}
