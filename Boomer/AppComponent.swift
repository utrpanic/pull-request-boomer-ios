import InterfaceLib
import ModelLib
import ModernRIBs

final class AppComponent: MainDependency, HasDependencyProvider {
    var apis: ApiProviderProtocol = ApiProvider()
    var buildables: BuildableProviderProtocol = BuildableProvider()
}
