import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navVc: UINavigationController?
    var vc: UIViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.vc = PickAssembly.makeModule()
        guard let vc = self.vc else {
            return
        }
        self.navVc = UINavigationController(rootViewController: vc)
        self.navVc?.navigationBar.tintColor = Metrics.navBarTintColor
        self.window?.rootViewController = self.navVc
        self.window?.makeKeyAndVisible()
    }
}

