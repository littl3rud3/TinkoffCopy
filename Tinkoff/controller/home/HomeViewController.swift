import UIKit

class HomeViewController: UIViewController {
    
    var scrollView: HomeScrollView!
    
    var lastOffsetY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Главная"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        scrollView = HomeScrollView(frame: view.bounds)
        scrollView.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : #colorLiteral(red: 0.9207761884, green: 0.9252272248, blue: 0.9250611663, alpha: 1)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 200)
        
        view.addSubview(scrollView)
    }
}
