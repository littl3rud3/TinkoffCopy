import UIKit

class BonusCommonCV: UICollectionView {

    var IMAGE_NAMES = [String]()

    init(imageNames: [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 140, height: 140)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        self.IMAGE_NAMES = imageNames

        delegate = self
        dataSource = self

        self.showsHorizontalScrollIndicator = false

        register(BonusCommonCell.self, forCellWithReuseIdentifier: BonusCommonCell.id)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BonusCommonCV: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
    -> Int
    {
        IMAGE_NAMES.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell
    {
        let cell =
        dequeueReusableCell(
            withReuseIdentifier: BonusCommonCell.id, for: indexPath) as! BonusCommonCell
        
        cell.imageName = IMAGE_NAMES[indexPath.row]
        
        return cell
    }
}
