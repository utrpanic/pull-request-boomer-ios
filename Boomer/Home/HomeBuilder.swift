import InterfaceLib
import ModernRIBs

protocol HomeDependency: Dependency {
    
}

final class HomeComponent: ComponentInThisWorld<HomeDependency> {

}

extension HomeComponent: HomeInteractorParams {
    
}

final class HomeBuilder: BuilderInThisWorld<HomeDependency>, HomeBuildable {

    func build(withListener listener: HomeListener) -> ViewableRouting {
        let component = HomeComponent(dependency: self.dependency, in: self.world)
        let interactor = HomeInteractor(params: component)
        interactor.listener = listener
        let viewController = HomeViewController()
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
