import InterfaceLib
import ModelLib
import ModernRIBs

final class AppComponent: MainDependency {    
    var world: World = AppWorld()
    lazy var buildables: BuildableProviderProtocol = BuildableProvider(in: self.world)
}
