import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let vc = PickAssembly.makeModule()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.tintColor = Colors.navBarTintColor
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
    }
}

