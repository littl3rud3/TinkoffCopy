import UIKit

class SearchController: UISearchController {
    
    var searchView = SearchVStack(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        view.addSubview(searchView)
    }
    
    override func viewDidLayoutSubviews() {
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            searchBar.heightAnchor.constraint(equalToConstant: 30),
            
            searchView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: view.bounds.height - 30),
        ])
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
}
