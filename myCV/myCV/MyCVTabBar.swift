import UIKit

final class MyCVTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        self.tabBar.tintColor = .label
        setupVC()
    }

    
    private func setupVC() {
        viewControllers = [
            createNavController(for: MyInfoViewController(), title: l10n("TAB_BAR_INFO"), image: UIImage(systemName: "person.circle")!),
            createNavController(for: SkillViewController(), title: l10n("TAB_BAR_SKILL"), image: UIImage(systemName: "star")!),
            createNavController(for: HobbieView(), title: l10n("TAB_BAR_HOBBIE"), image: UIImage(systemName: "music.house")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
}
