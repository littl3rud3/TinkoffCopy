import UIKit

class CashbackMiniCV: UICollectionView {

    var IMAGE_NAMES = [String]()
    
    init(imageNames: [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 2
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        isScrollEnabled = false
        IMAGE_NAMES = imageNames
        
        
        delegate = self
        dataSource = self
        
        self.showsHorizontalScrollIndicator = false
        
        register(CashbackMiniCell.self, forCellWithReuseIdentifier: CashbackMiniCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadImages() {
        IMAGE_NAMES = IMAGE_NAMES.shuffled()
        self.reloadData()
    }
}

extension CashbackMiniCV: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        IMAGE_NAMES.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(
            withReuseIdentifier: CashbackMiniCell.id, for: indexPath) as! CashbackMiniCell
        
        cell.imageName = IMAGE_NAMES[indexPath.row]
        
        return cell
    }
}

extension CashbackMiniCV: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 40)
    }
}

