//
//  SuggestionHStack.swift
//  Tinkoff
//
//  Created by littl3rud3 ‍ on 20.12.2022.
//

import UIKit

class SuggestionHStack: UIStackView {
    
    var atms = Constants.SEARCH_BUTTON()
    var atmIcon = UIImageView(image: UIImage(named: "atmIcon"))
    var ATM_HARDCODE = Constants.LABEL_15_FONT(text: "Банкоматы")
    
    var transfers = Constants.SEARCH_BUTTON()
    var transferIcon = UIImageView(image: UIImage(named: "transferIcon"))
    var TRANSFERS_HARDCODE = Constants.LABEL_15_FONT(text: "Переводы")
    
    var cashback = Constants.SEARCH_BUTTON()
    var cashbackIcon = UIImageView(image: UIImage(named: "cashbackIcon"))
    var CASHBACK_HARDCODE = Constants.LABEL_15_FONT(text: "Кэшбэк")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillEqually
        axis = .horizontal
        spacing = 12
        
        addArrangedSubview(atms)
        addArrangedSubview(transfers)
        addArrangedSubview(cashback)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        atms.translatesAutoresizingMaskIntoConstraints = false
        transfers.translatesAutoresizingMaskIntoConstraints = false
        ATM_HARDCODE.translatesAutoresizingMaskIntoConstraints = false
        TRANSFERS_HARDCODE.translatesAutoresizingMaskIntoConstraints = false
        cashback.translatesAutoresizingMaskIntoConstraints = false
        CASHBACK_HARDCODE.translatesAutoresizingMaskIntoConstraints = false
        atmIcon.translatesAutoresizingMaskIntoConstraints = false
        transferIcon.translatesAutoresizingMaskIntoConstraints = false
        cashbackIcon.translatesAutoresizingMaskIntoConstraints = false

        atms.addSubview(ATM_HARDCODE)
        atms.addSubview(atmIcon)
        transfers.addSubview(TRANSFERS_HARDCODE)
        transfers.addSubview(transferIcon)
        cashback.addSubview(CASHBACK_HARDCODE)
        cashback.addSubview(cashbackIcon)

        NSLayoutConstraint.activate([
        
            atmIcon.topAnchor.constraint(equalTo: atms.topAnchor, constant: 15),
            atmIcon.leadingAnchor.constraint(equalTo: atms.leadingAnchor, constant: 15),
            atmIcon.heightAnchor.constraint(equalToConstant: 30),
            atmIcon.widthAnchor.constraint(equalToConstant: 30),

            ATM_HARDCODE.leadingAnchor.constraint(equalTo: atms.leadingAnchor, constant: 15),
            ATM_HARDCODE.topAnchor.constraint(equalTo: atms.topAnchor, constant: 55),
            
            transferIcon.topAnchor.constraint(equalTo: transfers.topAnchor, constant: 15),
            transferIcon.leadingAnchor.constraint(equalTo: transfers.leadingAnchor, constant: 15),
            transferIcon.heightAnchor.constraint(equalToConstant: 30),
            transferIcon.widthAnchor.constraint(equalToConstant: 30),
            
            TRANSFERS_HARDCODE.leadingAnchor.constraint(equalTo: transfers.leadingAnchor, constant: 15),
            TRANSFERS_HARDCODE.topAnchor.constraint(equalTo: transfers.topAnchor, constant: 55),
            
            cashbackIcon.topAnchor.constraint(equalTo: cashback.topAnchor, constant: 15),
            cashbackIcon.leadingAnchor.constraint(equalTo: cashback.leadingAnchor, constant: 15),
            cashbackIcon.heightAnchor.constraint(equalToConstant: 30),
            cashbackIcon.widthAnchor.constraint(equalToConstant: 30),
            
            CASHBACK_HARDCODE.leadingAnchor.constraint(equalTo: cashback.leadingAnchor, constant: 15),
            CASHBACK_HARDCODE.topAnchor.constraint(equalTo: cashback.topAnchor, constant: 55),
        ])
    }
    
}
