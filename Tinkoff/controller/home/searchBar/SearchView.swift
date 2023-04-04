import UIKit

class SearchVStack: UIView {
    
    var exchangeRates = SearchConstants.exchangeRates
    
    var dollarView = UIView()
    var DOLLAR_SIGN = Constants.CURRENCY(text: "$")
    var dollarRate = Constants.LABEL_14_FONT(text: "30,0")
    
    var euroView = UIView()
    var EURO_SIGN = Constants.CURRENCY(text: "€")
    var euroRate = Constants.LABEL_14_FONT(text: "40,0")
    
    var poundView = UIView()
    var POUND_SIGN = Constants.CURRENCY(text: "£")
    var poundRate = Constants.LABEL_14_FONT(text: "100,0")
    
    var suggestionStack = SuggestionHStack(frame: .zero)
    
    var ACTUAL_HARDCODE = Constants.LABEL_20_BOLD_FONT(text: "Актуальное")
    
    var actualView = ActualCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        
        exchangeRates.addSubview(dollarView)
        exchangeRates.addSubview(euroView)
        exchangeRates.addSubview(poundView)
        
        dollarView.addSubview(dollarRate)
        dollarView.addSubview(DOLLAR_SIGN)
        
        euroView.addSubview(euroRate)
        euroView.addSubview(EURO_SIGN)
        
        poundView.addSubview(poundRate)
        poundView.addSubview(POUND_SIGN)

        addSubview(exchangeRates)
        addSubview(suggestionStack)
        addSubview(ACTUAL_HARDCODE)
        addSubview(actualView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        exchangeRates.translatesAutoresizingMaskIntoConstraints = false
        dollarView.translatesAutoresizingMaskIntoConstraints = false
        DOLLAR_SIGN.translatesAutoresizingMaskIntoConstraints = false
        dollarRate.translatesAutoresizingMaskIntoConstraints = false
        euroView.translatesAutoresizingMaskIntoConstraints = false
        EURO_SIGN.translatesAutoresizingMaskIntoConstraints = false
        euroRate.translatesAutoresizingMaskIntoConstraints = false
        poundView.translatesAutoresizingMaskIntoConstraints = false
        POUND_SIGN.translatesAutoresizingMaskIntoConstraints = false
        poundRate.translatesAutoresizingMaskIntoConstraints = false
        suggestionStack.translatesAutoresizingMaskIntoConstraints = false
        ACTUAL_HARDCODE.translatesAutoresizingMaskIntoConstraints = false
        actualView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            exchangeRates.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            exchangeRates.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            exchangeRates.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            exchangeRates.heightAnchor.constraint(equalToConstant: 45),
            
            dollarView.topAnchor.constraint(equalTo: exchangeRates.topAnchor, constant: 10),
            dollarView.leadingAnchor.constraint(equalTo: exchangeRates.leadingAnchor, constant: 50),
            dollarView.heightAnchor.constraint(equalToConstant: 20),
            dollarView.widthAnchor.constraint(equalToConstant: 20),
            dollarView.centerYAnchor.constraint(equalTo: exchangeRates.centerYAnchor),
            
            suggestionStack.topAnchor.constraint(equalTo: exchangeRates.bottomAnchor, constant: 20),
            suggestionStack.leadingAnchor.constraint(equalTo: exchangeRates.leadingAnchor),
            suggestionStack.trailingAnchor.constraint(equalTo: exchangeRates.trailingAnchor),
            suggestionStack.heightAnchor.constraint(equalToConstant: 90),
            
            ACTUAL_HARDCODE.topAnchor.constraint(equalTo: suggestionStack.bottomAnchor, constant: 25),
            ACTUAL_HARDCODE.leadingAnchor.constraint(equalTo: exchangeRates.leadingAnchor),

            DOLLAR_SIGN.leadingAnchor.constraint(equalTo: dollarView.leadingAnchor),
            DOLLAR_SIGN.centerYAnchor.constraint(equalTo: dollarView.centerYAnchor),
            
            dollarRate.leadingAnchor.constraint(equalTo: DOLLAR_SIGN.trailingAnchor, constant: 5),
            dollarRate.centerYAnchor.constraint(equalTo: dollarView.centerYAnchor),
            
            euroView.topAnchor.constraint(equalTo: exchangeRates.topAnchor, constant: 10),
            euroView.leadingAnchor.constraint(equalTo: dollarView.trailingAnchor, constant: 100),
            euroView.heightAnchor.constraint(equalToConstant: 20),
            euroView.widthAnchor.constraint(equalToConstant: 20),
            euroView.centerYAnchor.constraint(equalTo: exchangeRates.centerYAnchor),
            
            poundView.topAnchor.constraint(equalTo: exchangeRates.topAnchor, constant: 10),
            poundView.leadingAnchor.constraint(equalTo: euroView.trailingAnchor, constant: 100),
            poundView.heightAnchor.constraint(equalToConstant: 20),
            poundView.widthAnchor.constraint(equalToConstant: 20),
            poundView.centerYAnchor.constraint(equalTo: exchangeRates.centerYAnchor),
            
            EURO_SIGN.leadingAnchor.constraint(equalTo: euroView.leadingAnchor),
            EURO_SIGN.centerYAnchor.constraint(equalTo: euroView.centerYAnchor),
            
            euroRate.leadingAnchor.constraint(equalTo: EURO_SIGN.trailingAnchor, constant: 5),
            euroRate.centerYAnchor.constraint(equalTo: exchangeRates.centerYAnchor),
            
            POUND_SIGN.leadingAnchor.constraint(equalTo: poundView.leadingAnchor),
            POUND_SIGN.centerYAnchor.constraint(equalTo: poundView.centerYAnchor),
            
            poundRate.leadingAnchor.constraint(equalTo: POUND_SIGN.trailingAnchor, constant: 5),
            poundRate.centerYAnchor.constraint(equalTo: exchangeRates.centerYAnchor),
            
            actualView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            actualView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            actualView.topAnchor.constraint(equalTo: ACTUAL_HARDCODE.bottomAnchor, constant: 20),
            actualView.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}
