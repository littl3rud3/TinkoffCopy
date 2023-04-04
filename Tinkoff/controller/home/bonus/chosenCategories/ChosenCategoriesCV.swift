import UIKit

class ChosenCategoriesCV: UICollectionView {

    let CHOSEN_CATEGORIES_IMAGES = ["allPurchasesIcon", "entertainmentsIcon"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = -20
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        
        delegate = self
        dataSource = self
        
        self.showsHorizontalScrollIndicator = false
        
        register(ChosenCategoryCell.self, forCellWithReuseIdentifier: ChosenCategoryCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChosenCategoriesCV: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CHOSEN_CATEGORIES_IMAGES.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(
            withReuseIdentifier: ChosenCategoryCell.id, for: indexPath) as! ChosenCategoryCell
        
        cell.imageName = CHOSEN_CATEGORIES_IMAGES[indexPath.row]
        cell.layer.cornerRadius = 5
        
        return cell
    }
}

extension ChosenCategoriesCV: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 45, height: 45)
    }
}
