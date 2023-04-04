import UIKit

class ActualCell: UICollectionViewCell {
    
    static let id = "actualCell"
    
    lazy var button: UIButton = {
       
        let uiButton = UIButton()
        
        uiButton.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? #colorLiteral(red: 0.1079376563, green: 0.1088205203, blue: 0.1190210059, alpha: 1) : #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694762826, alpha: 1)
        uiButton.layer.cornerRadius = 20
        
        return uiButton
    }()
    
    var image: UIImage!
    var title: String!
    
    var imageView = UIImageView()
    var label: UILabel = {
        
        let uiLabel = UILabel()
        uiLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        uiLabel.textColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
        uiLabel.numberOfLines = 2
        
        return uiLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.addSubview(label)
        button.addSubview(imageView)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        label.text = title
        imageView.image = image

        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),

            imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),

            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
