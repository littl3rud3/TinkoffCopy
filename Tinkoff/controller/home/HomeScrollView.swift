
import UIKit
//import SkeletonView

class HomeScrollView: UIScrollView {
    
    var homeStack: HomeView!
    
    var refreshIndicator = UIRefreshControl()

    override init(frame: CGRect) {
        super.init(frame: frame)
        showsVerticalScrollIndicator = false
        
        refreshIndicator.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl = refreshIndicator
        
        homeStack = HomeView(frame: bounds)
        
        addSubview(homeStack)
        
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refresh() {

        homeStack.operationsAndCashback.cashbackIcons.reloadImages()
        refreshIndicator.endRefreshing()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : #colorLiteral(red: 0.9207761884, green: 0.9252272248, blue: 0.9250611663, alpha: 1)
    }
}

extension HomeScrollView: UIScrollViewDelegate {

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        parentViewController?.navigationController?.setNavigationBarHidden(velocity.y < 0, animated: true)
    }
}

