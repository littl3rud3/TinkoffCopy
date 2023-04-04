import UIKit

struct BonusViewConstants {
    
    static func cashbackCV() -> CashbackCV {
        
        let cashbackCV = CashbackCV()
        cashbackCV.isSkeletonable = true
        
        return cashbackCV
    }
    
    static var YOU_WILL_RECIEVE: UILabel = {
        
        let label = UILabel()
        label.text = "Вы получите от 500 ₽ за каждого друга"
        label.textColor = #colorLiteral(red: 0.5515756011, green: 0.5583381057, blue: 0.5772238374, alpha: 1)
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        label.numberOfLines = 2
        
        return label
    }()
    
    static var TINKOFF_PRO_IMAGE: UIImageView = {
        var uiImageView = UIImageView(image: UIImage(named: "tinkoffProButton"))
        uiImageView.isSkeletonable = true
        
        return uiImageView
    }()
    
    static var BOX_ICON: UIImageView = {
        var uiImageView = UIImageView(image: UIImage(named: "boxIcon"))
        uiImageView.isSkeletonable = true
        
        return uiImageView
    }()
    
    static let DETAILS_BUTTON: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : .white
        
        return button
    }()
    
    static let DETAILS_LABEL: UILabel = {
       
        var uiLabel = UILabel()
        uiLabel.text = "Подробнее"
        uiLabel.font = UIFont(name: "Helvetica Neue Bold", size: 13)
        
        return uiLabel
    }()
    
    static func COMMON_VIEW() -> UIView {
        
        let uiView = UIView()
        uiView.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.1723024547, green: 0.1727027297, blue: 0.1774727106, alpha: 1) : #colorLiteral(red: 1, green: 0.9998466372, blue: 0.9964470267, alpha: 1)
        uiView.layer.cornerRadius = 20
        uiView.isSkeletonable = true
        uiView.skeletonCornerRadius = 15
        
        return uiView
    }
    
    static func ON_CARDS(text: String = "По всем картам") -> UILabel {
        
        let uiLabel = UILabel()
        uiLabel.text = text.uppercased()
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        uiLabel.textColor = #colorLiteral(red: 0.5371789336, green: 0.5391367674, blue: 0.5621590614, alpha: 1)
        
        return uiLabel
    }
    
    
    static var INCREASED_CASHBACK: UILabel = {
        
        var uiLabel = UILabel()
        uiLabel.text = "Повыешнный кэшбэк на \(CalendarConstants.calendarNominativeCase[Calendar.current.component(.month, from: Date())]!)"
        uiLabel.font = UIFont(name: "Helvetica Neue Bold", size: 22)
        uiLabel.numberOfLines = 2
        
        return uiLabel
    }()
    
    static let CHOSEN_CATEGORIES_IMAGES = [UIImageView(image: UIImage(named: "allPurchasesIcon")), UIImageView(image: UIImage(named: "entertainmentsIcon"))]
    
    static let CHOSEN_CATEGORIES = ["Все покупки", "Развлечения"]
    
    static var CHOSEN_CATEGORIES_LABEL: UILabel = {
        
        var uiLabel = UILabel()
        uiLabel.text = "1-5% \(CHOSEN_CATEGORIES.joined(separator: ", "))"
        
        return uiLabel
    }()
    
    static func BONUS_BUTTON(isYellow: Bool = false) -> UIButton {
        
        let uiButton = UIButton()
        let black = #colorLiteral(red: 0.2633734941, green: 0.2598109543, blue: 0.2688633204, alpha: 1)
        let yellow = #colorLiteral(red: 0.9975216985, green: 0.8685031533, blue: 0.1778993905, alpha: 1)
        uiButton.backgroundColor = isYellow ? yellow : UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.2649520934, green: 0.259755671, blue: 0.2688385248, alpha: 1) : #colorLiteral(red: 0.9636489749, green: 0.969581902, blue: 0.9659652114, alpha: 1)
        uiButton.layer.cornerRadius = 15
        
        return uiButton
    }
    
    static func BUTTON_LABEL(text: String = "Посмотреть все", isBlack: Bool = false) -> UILabel {
        
        let uiLabel = UILabel()
        uiLabel.text = text
        uiLabel.textColor = isBlack ? .black : #colorLiteral(red: 0.3333333333, green: 0.4630627632, blue: 0.7843137255, alpha: 1)
        
        return uiLabel
    }
    
    static var TOWN_CASHBACK: UILabel = {
        
        var uiLabel = UILabel()
        uiLabel.text = "Кэшбэк в разделе Город"
        uiLabel.font = UIFont(name: "Helvetica Neue Bold", size: 22)
        uiLabel.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        
        return uiLabel
    }()
    
    static func CASHBACK_LABEL(text: String, numberOfLines: Int = 1) -> UILabel {
        
        let uiLabel = UILabel()
        uiLabel.text = text
        uiLabel.numberOfLines = numberOfLines
        uiLabel.font = UIFont(name: "Helvetica Neue Bold", size: 22)
        uiLabel.isSkeletonable = true
        uiLabel.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        
        return uiLabel
    }
    
    static var ONE_PERCENT_CASHBACK: UILabel = {
        
        let uiLabel = UILabel()
        uiLabel.text = "1% за все покупки"
        uiLabel.font = UIFont(name: "Helvetica Neue Bold", size: 22)
        
        return uiLabel
    }()
    
    static var partnerCashbackCV = BonusCommonCV(imageNames: ["kfcCashbackIcon", "businessLinesCashbackIcon", "lentaCashbackIcon", "lentaOnlineCashbackIcon", "marketCashbackIcon"])
    static var sharesBuyCV = BonusCommonCV(imageNames: ["detMirIcon", "goldenAppleIcon", "rendezVousIcon", "rivGoshIcon", "sunlightIcon"])
    static var partnerSubsCV = BonusCommonCV(imageNames: ["iviIcon", "iviStartIcon", "kasperskyIcon", "myBookIcon"])
    static var townBonusCV = BonusCommonCV(imageNames: ["playbillIcon", "vkusVillIcon", "fuelIcon", "restaurantsIcon", "goodsIcon"])
    static var travelBonucCV = BonusCommonCV(imageNames: ["airTicketsIcon", "hotelsIcon", "toursIcon", "insuranceIcon"])
}
