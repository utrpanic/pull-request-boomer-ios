import InterfaceLib
import ModelLib
import ModernRIBs

final class AppDependency: EmptyDependency, HasDependencyProvider {
    var apis: ApiProviderProtocol = ApiProvider()
    var buildables: BuildableProviderProtocol = BuildableProvider()
}

final class AppComponent: Component<EmptyDependency>, MainDependency {
    init() {
        super.init(dependency: AppDependency())
    }
}
