import UIKit

extension UIResponder {
    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}

extension UIView {
    
    func applyTamic(views: UIView...) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func hideViews(views: UIView...) {
        views.forEach{ $0.isHidden = true }
    }
    
    func showViews(views: UIView...) {
        views.forEach{ $0.isHidden = false }
    }
}
