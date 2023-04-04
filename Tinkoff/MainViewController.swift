import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tabBarAppearance = UITabBarAppearance()
        let blueColor = #colorLiteral(red: 0.2329585552, green: 0.4789062738, blue: 0.863681376, alpha: 1)
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: blueColor]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = blueColor

        view.backgroundColor = .systemBackground
        tabBar.unselectedItemTintColor = .gray
        tabBar.standardAppearance = tabBarAppearance
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let paymentViewController = UINavigationController(rootViewController: PaymentViewController())
        let townViewController = UINavigationController(rootViewController: TownViewController())
        let chatViewController = UINavigationController(rootViewController: ChatViewController())
        let moreViewController = UINavigationController(rootViewController: MoreViewController())
        
        homeViewController.tabBarItem.image = UIImage(named: "homeIcon")
        paymentViewController.tabBarItem.image = UIImage(named: "paymentsIcon")
        townViewController.tabBarItem.image = UIImage(named: "townIcon")
        chatViewController.tabBarItem.image = UIImage(named: "chatIcon")
        moreViewController.tabBarItem.image = UIImage(named: "moreIcon")
        
        homeViewController.title = "Главная"
        paymentViewController.title = "Платежи"
        townViewController.title = "Город"
        chatViewController.title = "Чат"
        moreViewController.title = "Ещё"

        tabBar.tintColor = .label
        
        setViewControllers(
            [homeViewController, paymentViewController, townViewController, chatViewController, moreViewController], animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UITabBar.appearance().tintColor = .blue
        UIToolbar.appearance().barTintColor = .blue
    }
}
