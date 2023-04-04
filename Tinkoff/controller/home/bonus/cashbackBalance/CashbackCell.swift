import UIKit
import SkeletonView

class CashbackCell: UICollectionViewCell {

    static let id = "cashbackCell"

    lazy var cashbackInfoButton: UIButton = {

        let button = UIButton()
        button.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.1079376563, green: 0.1088205203, blue: 0.1190210059, alpha: 1) : #colorLiteral(red: 0.990305841, green: 0.9868829846, blue: 1, alpha: 1)

        return button
    }()
    var ovalView: UIView = {
        var uiView = UIView()
        uiView.layer.cornerRadius = 15

        return uiView
    }()
    var balanceLabel: UILabel = {

        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue Bold", size: 16)

        return label
    }()
    var CASHBACK_ACCUMULATED: UILabel = {
        var uiLabel = UILabel()
        uiLabel.numberOfLines = 2
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 16)

        return uiLabel
    }()
    var WILL_BE_CREDITED: UILabel = {

        var uiLabel = UILabel()
        uiLabel.textColor = #colorLiteral(
            red: 0.5283680558, green: 0.53552562, blue: 0.5583892465, alpha: 1)
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        uiLabel.numberOfLines = 2

        return uiLabel
    }()

    var balanceIcon: UIImageView!
    var color: UIColor?
    var balance = 0
    var currency = "₽"
    var cornerRadius = 20

    let numFormatter: NumberFormatter = {
       
        var numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        
        return numberFormatter
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isSkeletonable = true

        addSubview(cashbackInfoButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSubviews()

        cashbackInfoButton.isSkeletonable = true
        ovalView.isSkeletonable = true
        WILL_BE_CREDITED.isSkeletonable = true
        CASHBACK_ACCUMULATED.isSkeletonable = true
        balanceLabel.isSkeletonable = true
        
        cashbackInfoButton.frame = bounds
//        cashbackInfoButton.translatesAutoresizingMaskIntoConstraints = false
        ovalView.translatesAutoresizingMaskIntoConstraints = false
        WILL_BE_CREDITED.translatesAutoresizingMaskIntoConstraints = false
        CASHBACK_ACCUMULATED.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceIcon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            cashbackInfoButton.topAnchor.constraint(equalTo: topAnchor),
//            cashbackInfoButton.bottomAnchor.constraint(equalTo: bottomAnchor),
//            cashbackInfoButton.widthAnchor.constraint(equalToConstant: 180),

            ovalView.topAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: -10),
            ovalView.leadingAnchor.constraint(equalTo: balanceIcon.leadingAnchor, constant: -7),
            ovalView.trailingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 10),
            ovalView.heightAnchor.constraint(equalToConstant: 27),
            ovalView.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor),

            balanceIcon.leadingAnchor.constraint(
                equalTo: cashbackInfoButton.leadingAnchor, constant: 20),
            balanceIcon.topAnchor.constraint(equalTo: cashbackInfoButton.topAnchor, constant: 30),
            balanceIcon.heightAnchor.constraint(equalTo: balanceLabel.heightAnchor),
            balanceIcon.widthAnchor.constraint(equalToConstant: 15),

            balanceLabel.topAnchor.constraint(equalTo: balanceIcon.topAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: balanceIcon.leadingAnchor, constant: 20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 12),

            CASHBACK_ACCUMULATED.topAnchor.constraint(equalTo: ovalView.bottomAnchor, constant: 10),
            CASHBACK_ACCUMULATED.leadingAnchor.constraint(equalTo: ovalView.leadingAnchor, constant: 5),
            CASHBACK_ACCUMULATED.widthAnchor.constraint(equalToConstant: 100),

            WILL_BE_CREDITED.topAnchor.constraint(
                equalTo: CASHBACK_ACCUMULATED.bottomAnchor, constant: 10),
            WILL_BE_CREDITED.leadingAnchor.constraint(equalTo: CASHBACK_ACCUMULATED.leadingAnchor),
            WILL_BE_CREDITED.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
    
    private func setupSubviews() {
        ovalView.backgroundColor = color
        
        cashbackInfoButton.layer.cornerRadius = CGFloat(cornerRadius)
        balanceLabel.text = "\(String((numFormatter.string(for: balance)!))) \(currency)"
        
        if balance > 0 {
            CASHBACK_ACCUMULATED.text = "Накоплено кэшбэка"
            WILL_BE_CREDITED.text =
            "Зачислится 1 \(CalendarConstants.calendarGenitiveCase[Calendar.current.component(.month, from: Date()) + 1]!)"
        } else {
            CASHBACK_ACCUMULATED.text = "Доступно сейчас"
            WILL_BE_CREDITED.text = "Начните тратить, и все появится"
        }
        
        cashbackInfoButton.addSubview(ovalView)
        cashbackInfoButton.addSubview(balanceIcon)
        cashbackInfoButton.addSubview(balanceLabel)
        cashbackInfoButton.addSubview(WILL_BE_CREDITED)
        cashbackInfoButton.addSubview(CASHBACK_ACCUMULATED)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
