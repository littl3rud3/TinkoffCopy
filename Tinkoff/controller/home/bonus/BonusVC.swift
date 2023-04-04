import UIKit

class BonusVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Бонусы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))

        let bonusSv = BonusSV(frame: view.bounds)
        bonusSv.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1600)
        view.addSubview(bonusSv)
    }
    
    @objc func cancelButtonPressed(_ sender: UIBarItem) {
        dismiss(animated: true)
    }
}
