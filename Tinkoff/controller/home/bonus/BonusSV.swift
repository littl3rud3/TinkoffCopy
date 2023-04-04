import UIKit

class BonusSV: UIScrollView {

    private var bonusView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground
        showsVerticalScrollIndicator = false
        bonusView = BonusView(frame: bounds)
        backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : #colorLiteral(red: 0.9207761884, green: 0.9252272248, blue: 0.9250611663, alpha: 1)
        addSubview(bonusView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
