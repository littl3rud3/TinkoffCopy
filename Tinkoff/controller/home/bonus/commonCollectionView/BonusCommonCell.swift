import UIKit

class BonusCommonCell: UICollectionViewCell {
    
    static let id = "bonusCommonCell"

    var imageName: String!
    var picture = UIImageView()
    var picturePlaceholder: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        picture = UIImageView(image: UIImage(named: imageName))
        picture.frame = bounds
        addSubview(picture)
    }
}
