import UIKit

struct CashbackDesign {
    
    var currency: String
    var balance: Int
    var balanceIcon: UIImageView
    var backgroundColor: UIColor
    
    static let array = [CashbackDesign(currency: "₽", balance: 1081, balanceIcon: UIImageView(image: UIImage(named: "crownIcon")), backgroundColor: #colorLiteral(red: 0.3075784147, green: 0.3075784147, blue: 0.3075784147, alpha: 1)),
                        CashbackDesign(currency: "баллов", balance: 0, balanceIcon: UIImageView(image: UIImage(named: "platinumBonusIcon")), backgroundColor: #colorLiteral(red: 0.3729674518, green: 0.429463923, blue: 0.4949666262, alpha: 1))]
}
