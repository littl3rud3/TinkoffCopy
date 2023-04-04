import UIKit

class OperationsAndCashabackView: UIStackView {

    lazy var operationsButton = Constants.COMMON_BUTTON()
    var allOperationsLabel = Constants.LABEL_17_BOLD_FONT(text: "Все операции")
    var SEGMENTED_OVAL = OperationsAndCashbackConstants.SEGMENTED_OVAL
    var wastesLabel = OperationsAndCashbackConstants.WASTES_HARDOCDE
    var wastes = OperationsAndCashbackConstants.WASTES

    lazy var cashbackButton = Constants.COMMON_BUTTON()
    var cashbackLabel = OperationsAndCashbackConstants.CASHBACK_AND_BONUSES
    
    let CASHBACK_MINI_IMAGES = OperationsAndCashbackConstants.CASHBACK_MINI_IMAGES()
    let cashbackIcons = CashbackMiniCV(imageNames: OperationsAndCashbackConstants.CASHBACK_MINI_IMAGES_NAMES)

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = 20
        distribution = .fillEqually

        addArrangedSubview(operationsButton)
        addArrangedSubview(cashbackButton)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        cashbackButton.addTarget(self, action: #selector(openCashbackSheet), for: .touchUpInside)
        
        applyTamic(views: cashbackIcons, allOperationsLabel, wastesLabel, wastes, cashbackLabel, SEGMENTED_OVAL)
        
        operationsButton.addSubview(allOperationsLabel)
        operationsButton.addSubview(wastesLabel)
        operationsButton.addSubview(wastes)
        operationsButton.addSubview(SEGMENTED_OVAL)

        cashbackButton.addSubview(cashbackLabel)
        cashbackButton.addSubview(cashbackIcons)
        
        NSLayoutConstraint.activate([

            allOperationsLabel.topAnchor.constraint(
                equalTo: operationsButton.topAnchor, constant: 15),
            allOperationsLabel.leadingAnchor.constraint(
                equalTo: operationsButton.leadingAnchor, constant: 20),
            
            wastesLabel.topAnchor.constraint(
                equalTo: allOperationsLabel.bottomAnchor, constant: 10),
            wastesLabel.leadingAnchor.constraint(equalTo: allOperationsLabel.leadingAnchor),
            
            wastes.topAnchor.constraint(equalTo: wastesLabel.bottomAnchor, constant: 2),
            wastes.leadingAnchor.constraint(equalTo: wastesLabel.leadingAnchor),
            
            SEGMENTED_OVAL.topAnchor.constraint(equalTo: wastes.bottomAnchor, constant: 15),
            SEGMENTED_OVAL.leadingAnchor.constraint(equalTo: wastes.leadingAnchor, constant: -10),
            SEGMENTED_OVAL.trailingAnchor.constraint(equalTo: operationsButton.trailingAnchor, constant: -15),
            SEGMENTED_OVAL.heightAnchor.constraint(equalToConstant: 15),

            cashbackLabel.topAnchor.constraint(
                equalTo: cashbackButton.topAnchor, constant: 15),
            cashbackLabel.leadingAnchor.constraint(
                equalTo: cashbackButton.leadingAnchor, constant: 20),
            
            cashbackIcons.topAnchor.constraint(equalTo: cashbackLabel.bottomAnchor, constant: 20),
            cashbackIcons.leadingAnchor.constraint(equalTo: cashbackLabel.leadingAnchor),
            cashbackIcons.trailingAnchor.constraint(equalTo: cashbackButton.trailingAnchor, constant: -53),
            cashbackIcons.heightAnchor.constraint(equalToConstant: 35),
            cashbackIcons.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func openCashbackSheet() {
        let temp = UINavigationController(rootViewController:BonusVC())
        parentViewController?.present(temp, animated: true)
    }
    
    func reloadStack() {
        cashbackIcons.setNeedsDisplay()
    }
}
