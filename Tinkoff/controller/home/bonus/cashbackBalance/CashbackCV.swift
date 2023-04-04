import UIKit
import SkeletonView

class CashbackCV: UICollectionView {
    
    let cells = CashbackDesign.array
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        super.init(frame: .zero, collectionViewLayout: layout)
        isScrollEnabled = cells.count > 2
        isSkeletonable = true
        backgroundColor = .black
        
        delegate = self
        dataSource = self
        
        showsHorizontalScrollIndicator = false
        
        register(CashbackCell.self, forCellWithReuseIdentifier: CashbackCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CashbackCV: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(
            withReuseIdentifier: CashbackCell.id, for: indexPath) as! CashbackCell
        
        cell.currency = cells[indexPath.row].currency
        cell.balance = cells[indexPath.row].balance
        cell.balanceIcon = cells[indexPath.row].balanceIcon
        cell.color = cells[indexPath.row].backgroundColor
        cell.cornerRadius = cells.count > 2 ? 20 : 30

        return cell
    }
}

extension CashbackCV: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cells.count > 2 ? CGSize(width: 160, height: 160) : CGSize(width: 190, height: 160)
    }
}
