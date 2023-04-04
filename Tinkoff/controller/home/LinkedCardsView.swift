import UIKit

class LinkedCardsView: UIStackView {
    
    lazy var openCard = Constants.COMMON_BUTTON()
    var opencardTitle = Constants.LABEL_17_BOLD_FONT(text: "Открытие")
    
    lazy var raifCard = Constants.COMMON_BUTTON()
    var raifCardTitle = Constants.LABEL_17_BOLD_FONT(text: "Райффайзен")
    
    var raifIcon = LinkedCardsConstants.RAIFFISEN_CARD_ICON
    var openIcon = LinkedCardsConstants.OPENCARD_ICON

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        distribution = .fillEqually
        spacing = 20
        
        addArrangedSubview(openCard)
        addArrangedSubview(raifCard)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyTamic(views: raifIcon, openIcon, raifCardTitle, opencardTitle)
        
        raifCard.addSubview(raifCardTitle)
        raifCard.addSubview(raifIcon)
        openCard.addSubview(opencardTitle)
        openCard.addSubview(openIcon)

        NSLayoutConstraint.activate([
            
            raifCardTitle.topAnchor.constraint(equalTo: raifCard.topAnchor, constant: 20),
            raifCardTitle.leadingAnchor.constraint(equalTo: raifCard.leadingAnchor, constant: 20),
            raifCardTitle.trailingAnchor.constraint(equalTo: raifCard.trailingAnchor, constant: -10),
            
            raifIcon.topAnchor.constraint(equalTo: raifCardTitle.bottomAnchor, constant: 10),
            raifIcon.leadingAnchor.constraint(equalTo: raifCardTitle.leadingAnchor),
            raifIcon.widthAnchor.constraint(equalToConstant: 55),
            raifIcon.heightAnchor.constraint(equalToConstant: 35),

            opencardTitle.topAnchor.constraint(equalTo: openCard.topAnchor, constant: 20),
            opencardTitle.leadingAnchor.constraint(equalTo: openCard.leadingAnchor, constant: 20),
            opencardTitle.trailingAnchor.constraint(equalTo: openCard.trailingAnchor, constant: -10),
             
            openIcon.topAnchor.constraint(equalTo: opencardTitle.bottomAnchor, constant: 10),
            openIcon.leadingAnchor.constraint(equalTo: opencardTitle.leadingAnchor),
            openIcon.widthAnchor.constraint(equalToConstant: 55),
            openIcon.heightAnchor.constraint(equalToConstant: 35),

        ])
    }
}
