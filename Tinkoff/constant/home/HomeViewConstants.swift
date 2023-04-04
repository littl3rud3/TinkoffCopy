import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

struct HomeViewConstants {
    
    static var openNewBill: UIButton = {
        
        var openNewBillButton = UIButton()
        
        openNewBillButton.backgroundColor = .yellow
        openNewBillButton.setTitle("Открыть новый счёт или продукт", for: .normal)
        openNewBillButton.setTitleColor(.black, for: .normal)
        openNewBillButton.layer.cornerRadius = 10
        
        return openNewBillButton
    }()
    
    static var searchBar: UISearchBar = {
        
        let bar = UISearchBar()
        
        bar.layer.cornerRadius = 15
        bar.clipsToBounds = true
        bar.searchBarStyle = UISearchBar.Style.default
        bar.backgroundColor = .clear
        bar.layer.borderColor = UIColor.clear.cgColor
        bar.placeholder = "Платежи"
        bar.layer.borderWidth = 1
        bar.searchTextField.font = UIFont(name: "Helvetica Neue", size: 12)
        
        return bar
    }()
    
    
    static var userName: UILabel = {
        
        let label = UILabel()
        
        label.text = "Алексей"
        label.font = UIFont(name: "Helvetica Neue Bold", size: 26)
        label.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        
        return label
    }()
    
    static var RIGHT_ARROW: UIImageView = {
        
        let smallFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        var image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(font: smallFont))
        
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        
        return imageView
    }()
    
    static var circle: UIView = {
       
        var view = UIView()
        view.layer.cornerRadius = 17
        view.backgroundColor = #colorLiteral(red: 0.2938232124, green: 0.295683682, blue: 0.3171930313, alpha: 1)
        
        return view
    }()
    
    static var letter: UILabel = {
       
        var label = UILabel()
        label.font = UIFont(name: "Helvetica Bold", size: 14)
        label.textColor = .white
        
        return label
    }()
}
