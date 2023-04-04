import UIKit

class HomeView: UIView {

    var circle = HomeViewConstants.circle
    var letter = HomeViewConstants.letter
    var userName = HomeViewConstants.userName
    var rightArrow = HomeViewConstants.RIGHT_ARROW
    var olegIcon = UIImageView(image: UIImage(named: "olegIcon"))

    var searchBar = HomeViewConstants.searchBar

    var storyView = StoryCV()

    var operationsAndCashback = OperationsAndCashabackView(frame: .zero)
    var cards = CardsView(frame: CGRect())
    var linkedCards = LinkedCardsView(frame: .zero)

    lazy var openNewBill = HomeViewConstants.openNewBill

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTap()
        
        addSubview(circle)
        circle.addSubview(letter)
        
        addSubview(userName)
        addSubview(olegIcon)
        addSubview(searchBar)
        addSubview(operationsAndCashback)
        addSubview(storyView)
        addSubview(cards)
        addSubview(linkedCards)
        addSubview(openNewBill)
        addSubview(rightArrow)
//        addSubview(searchView)
        
        searchBar.delegate = self
        
//        storyView.showAnimatedSkeleton(usingColor: .wetAsphalt)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTap() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        endEditing(true)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyTamic(views: storyView, operationsAndCashback, cards, linkedCards, openNewBill, searchBar, olegIcon, userName, circle, letter, rightArrow)
        
        letter.text = String(userName.text!.first!)

        NSLayoutConstraint.activate([

            circle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            circle.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -7),
            circle.heightAnchor.constraint(equalToConstant: 35),
            circle.widthAnchor.constraint(equalToConstant: 35),
            
            letter.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            letter.centerYAnchor.constraint(equalTo: circle.centerYAnchor),

            userName.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 13),
            userName.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -7),
            
            rightArrow.leadingAnchor.constraint(equalTo: userName.trailingAnchor, constant: 4),
            rightArrow.centerYAnchor.constraint(equalTo: userName.centerYAnchor, constant: 3),

            olegIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            olegIcon.bottomAnchor.constraint(equalTo: storyView.topAnchor, constant: -50),
            olegIcon.heightAnchor.constraint(equalToConstant: 35),
            olegIcon.widthAnchor.constraint(equalToConstant: 35),

            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            searchBar.heightAnchor.constraint(equalToConstant: 30),

            storyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            storyView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            storyView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            storyView.heightAnchor.constraint(equalToConstant: 110),

            operationsAndCashback.topAnchor.constraint(
                equalTo: storyView.bottomAnchor, constant: 15),
            operationsAndCashback.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            operationsAndCashback.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            operationsAndCashback.heightAnchor.constraint(equalToConstant: 135),

            cards.topAnchor.constraint(equalTo: operationsAndCashback.bottomAnchor, constant: 20),
            cards.leadingAnchor.constraint(equalTo: operationsAndCashback.leadingAnchor),
            cards.trailingAnchor.constraint(equalTo: operationsAndCashback.trailingAnchor),
            cards.heightAnchor.constraint(equalToConstant: 270),

            linkedCards.topAnchor.constraint(equalTo: cards.bottomAnchor, constant: 20),
            linkedCards.leadingAnchor.constraint(equalTo: operationsAndCashback.leadingAnchor),
            linkedCards.trailingAnchor.constraint(equalTo: operationsAndCashback.trailingAnchor),
            linkedCards.heightAnchor.constraint(equalToConstant: 220),

            openNewBill.leadingAnchor.constraint(equalTo: operationsAndCashback.leadingAnchor),
            openNewBill.trailingAnchor.constraint(equalTo: operationsAndCashback.trailingAnchor),
            openNewBill.heightAnchor.constraint(equalToConstant: 50),
            openNewBill.topAnchor.constraint(equalTo: linkedCards.bottomAnchor, constant: 20),
        ])
    }
}

extension HomeView: UISearchBarDelegate {
        
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

        let searchController = SearchController()
        searchController.modalPresentationStyle = .fullScreen
        parentViewController?.present(searchController, animated: true)
    }
}
