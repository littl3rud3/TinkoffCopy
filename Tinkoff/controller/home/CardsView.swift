import UIKit

class CardsView: UIStackView {

    lazy var tinkoffBlackButton = Constants.COMMON_BUTTON()
    var roublesIcon = CardsConstants.ROUBLES_ICON()
    var tinkoffBlackBalance = Constants.LABEL_17_BOLD_FONT(text: "0 ₽")
    var tinkoffBlackTitle = Constants.LABEL_14_FONT(text: "Tinkoff Black")
    var tinkoffBlackIcon = CardsConstants.TINKOFF_BLACK_CARD_ICON
    var tinkoffBlackExtraIcon = CardsConstants.TIKOFF_BLACK_EXTRA_CARD_ICON
    var crowns = CardsConstants.CROWNS_VIEW
    var crownIcon = CardsConstants.CROWN_ICON
    var crownBalance = Constants.LABEL_12_BOLD_FONT(text: "1 081 ₽")
    
    lazy var tinkoffPlatinumButton = Constants.COMMON_BUTTON()
    var tinkoffPlatinumBalance = Constants.LABEL_17_BOLD_FONT(text: "0 ₽")
    var tinkoffPlatinumIcon = CardsConstants.TINKOFF_PLATINUM_ICON
    var tinkoffPlatinumTitle = Constants.LABEL_14_FONT(text: "Тинькофф Платинум")
    var roublesIconPlatinum = CardsConstants.ROUBLES_ICON()
    var platinumBonusIcon = CardsConstants.PLATINUM_BONUS_ICON
    var platinumBonus = CardsConstants.PLATINUM_BONUS_VIEW
    var platinumBonusBalance = Constants.LABEL_12_BOLD_FONT(text: "0")

    override init(frame: CGRect) {
        super.init(frame: frame)

        axis = .vertical
        distribution = .fillEqually
        spacing = 20

        addArrangedSubview(tinkoffBlackButton)
        addArrangedSubview(tinkoffPlatinumButton)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        applyTamic(views: roublesIcon, roublesIconPlatinum, tinkoffBlackIcon, tinkoffBlackExtraIcon, crowns, tinkoffBlackBalance, tinkoffPlatinumIcon, tinkoffPlatinumBalance, platinumBonus, platinumBonusBalance, crownIcon, crownBalance, platinumBonusIcon, tinkoffBlackTitle, tinkoffPlatinumTitle)

        applyGradients()

        tinkoffBlackButton.addSubview(tinkoffBlackTitle)
        tinkoffBlackButton.addSubview(roublesIcon)
        tinkoffBlackButton.addSubview(tinkoffBlackIcon)
        tinkoffBlackButton.addSubview(tinkoffBlackExtraIcon)
        tinkoffBlackButton.addSubview(crowns)
        tinkoffBlackButton.addSubview(tinkoffBlackBalance)

        crowns.addSubview(crownBalance)
        crowns.addSubview(crownIcon)

        platinumBonus.addSubview(platinumBonusBalance)
        platinumBonus.addSubview(platinumBonusIcon)

        tinkoffPlatinumButton.addSubview(tinkoffPlatinumTitle)
        tinkoffPlatinumButton.addSubview(tinkoffPlatinumIcon)
        tinkoffPlatinumButton.addSubview(roublesIconPlatinum)
        tinkoffPlatinumButton.addSubview(tinkoffPlatinumBalance)
        tinkoffPlatinumButton.addSubview(platinumBonus)

        NSLayoutConstraint.activate([

            roublesIcon.leadingAnchor.constraint(
                equalTo: tinkoffBlackButton.leadingAnchor, constant: 20),
            roublesIcon.topAnchor.constraint(equalTo: tinkoffBlackButton.topAnchor, constant: 20),
            roublesIcon.widthAnchor.constraint(equalToConstant: 45),
            roublesIcon.heightAnchor.constraint(equalToConstant: 45),

            tinkoffBlackBalance.topAnchor.constraint(
                equalTo: tinkoffBlackButton.topAnchor, constant: 20),
            tinkoffBlackBalance.leadingAnchor.constraint(
                equalTo: roublesIcon.trailingAnchor, constant: 15),

            tinkoffBlackTitle.topAnchor.constraint(
                equalTo: tinkoffBlackBalance.topAnchor, constant: 25),
            tinkoffBlackTitle.leadingAnchor.constraint(equalTo: tinkoffBlackBalance.leadingAnchor),

            tinkoffBlackIcon.topAnchor.constraint(
                equalTo: tinkoffBlackTitle.bottomAnchor, constant: 10),
            tinkoffBlackIcon.leadingAnchor.constraint(equalTo: tinkoffBlackTitle.leadingAnchor),
            tinkoffBlackIcon.widthAnchor.constraint(equalToConstant: 55),
            tinkoffBlackIcon.heightAnchor.constraint(equalToConstant: 35),

            tinkoffBlackExtraIcon.topAnchor.constraint(equalTo: tinkoffBlackIcon.topAnchor),
            tinkoffBlackExtraIcon.leadingAnchor.constraint(
                equalTo: tinkoffBlackIcon.trailingAnchor, constant: 5),
            tinkoffBlackExtraIcon.widthAnchor.constraint(equalToConstant: 55),
            tinkoffBlackExtraIcon.heightAnchor.constraint(equalToConstant: 35),

            crowns.trailingAnchor.constraint(
                equalTo: tinkoffBlackButton.trailingAnchor, constant: -20),
            crowns.topAnchor.constraint(equalTo: tinkoffBlackButton.topAnchor, constant: 20),
            crowns.heightAnchor.constraint(equalToConstant: 20),
            crowns.widthAnchor.constraint(equalToConstant: 70),

            crownBalance.centerYAnchor.constraint(equalTo: crowns.centerYAnchor),
            crownBalance.leadingAnchor.constraint(equalTo: crownIcon.trailingAnchor, constant: 5),

            roublesIconPlatinum.leadingAnchor.constraint(
                equalTo: tinkoffPlatinumButton.leadingAnchor, constant: 20),
            roublesIconPlatinum.topAnchor.constraint(
                equalTo: tinkoffPlatinumButton.topAnchor, constant: 20),
            roublesIconPlatinum.widthAnchor.constraint(equalToConstant: 45),
            roublesIconPlatinum.heightAnchor.constraint(equalToConstant: 45),

            tinkoffPlatinumBalance.topAnchor.constraint(
                equalTo: tinkoffPlatinumButton.topAnchor, constant: 20),
            tinkoffPlatinumBalance.leadingAnchor.constraint(
                equalTo: roublesIconPlatinum.trailingAnchor, constant: 15),

            tinkoffPlatinumTitle.topAnchor.constraint(
                equalTo: tinkoffPlatinumBalance.topAnchor, constant: 25),
            tinkoffPlatinumTitle.leadingAnchor.constraint(
                equalTo: tinkoffPlatinumBalance.leadingAnchor),

            tinkoffPlatinumIcon.topAnchor.constraint(
                equalTo: tinkoffPlatinumTitle.bottomAnchor, constant: 10),
            tinkoffPlatinumIcon.leadingAnchor.constraint(
                equalTo: tinkoffPlatinumTitle.leadingAnchor),
            tinkoffPlatinumIcon.widthAnchor.constraint(equalToConstant: 55),
            tinkoffPlatinumIcon.heightAnchor.constraint(equalToConstant: 35),

            platinumBonus.trailingAnchor.constraint(
                equalTo: tinkoffPlatinumButton.trailingAnchor, constant: -20),
            platinumBonus.topAnchor.constraint(
                equalTo: tinkoffPlatinumButton.topAnchor, constant: 20),
            platinumBonus.heightAnchor.constraint(equalToConstant: 17),
            platinumBonus.widthAnchor.constraint(equalToConstant: 30),

            platinumBonusBalance.centerYAnchor.constraint(equalTo: platinumBonus.centerYAnchor),
            platinumBonusBalance.leadingAnchor.constraint(
                equalTo: platinumBonusIcon.trailingAnchor, constant: 3),

            platinumBonusIcon.centerYAnchor.constraint(equalTo: platinumBonus.centerYAnchor),
            platinumBonusIcon.leadingAnchor.constraint(
                equalTo: platinumBonus.leadingAnchor, constant: 3),
            platinumBonusIcon.heightAnchor.constraint(equalToConstant: 9),
            platinumBonusIcon.widthAnchor.constraint(equalToConstant: 11),

            crownIcon.centerYAnchor.constraint(equalTo: crowns.centerYAnchor),
            crownIcon.leadingAnchor.constraint(equalTo: crowns.leadingAnchor, constant: 5),
            crownIcon.heightAnchor.constraint(equalToConstant: 9),
            crownIcon.widthAnchor.constraint(equalToConstant: 11),
        ])
    }

    private func applyGradients() {

        let crownGradient = CAGradientLayer()
        crownGradient.frame = crowns.bounds
        let leftBorder = #colorLiteral(
            red: 0.2006945312, green: 0.2006945312, blue: 0.2006945312, alpha: 1)
        let rightBorder = #colorLiteral(
            red: 0.3450980186, green: 0.3450980186, blue: 0.3450980186, alpha: 1)
        crownGradient.colors = [leftBorder.cgColor, rightBorder.cgColor]
        crownGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        crownGradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        crowns.layer.addSublayer(crownGradient)

        let platinumGradient = CAGradientLayer()
        platinumGradient.frame = platinumBonus.bounds
        let leftBorder2 = #colorLiteral(
            red: 0.3590142131, green: 0.4047384858, blue: 0.4712913036, alpha: 1)
        let rightBorder2 = #colorLiteral(
            red: 0.4421990514, green: 0.5132694244, blue: 0.5799381137, alpha: 1)
        platinumGradient.colors = [leftBorder2.cgColor, rightBorder2.cgColor]
        platinumGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        platinumGradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        platinumBonus.layer.addSublayer(platinumGradient)
    }
}
