import BoomerLib
import ModernRIBs

final class AppComponent: Component<EmptyDependency>, MainDependency {
    
    private var authService = AuthService(api: AuthApi())
    
    var samIsLoggedIn: Bool { self.authService.samIsLoggedIn }

    init() {
        super.init(dependency: EmptyComponent())
    }
}
