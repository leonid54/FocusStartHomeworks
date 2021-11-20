import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        self.window = UIWindow(windowScene: windowScene)
        
        let vc = PhotoCollectionView()
        
        let rootNC = UINavigationController(rootViewController: vc)
        
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
    }
}

