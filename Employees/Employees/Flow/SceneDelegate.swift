import UIKit
import RealmSwift

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        var config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 2) {}
        })
        config.deleteRealmIfMigrationNeeded = true

        Realm.Configuration.defaultConfiguration = config

        _ = try! Realm()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        self.window = UIWindow(windowScene: windowScene)
        
        let vc = CompanyView()

        let rootNC = UINavigationController(rootViewController: vc)
        
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
    }
}

