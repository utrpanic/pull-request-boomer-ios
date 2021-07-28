import CommonLib
import ModernRIBs

protocol HomeDependency: Dependency {
    
}

final class HomeComponent: Component<HomeDependency> {

}

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> ViewableRouting
}

final class HomeBuilder: BuilderWithTargetDependency<HomeDependency>, HomeBuildable {
    
    var interactorParams: HomeInteractor.Params {
        return HomeInteractor.Params()
    }

    func build(withListener listener: HomeListener) -> ViewableRouting {
        _ = HomeComponent(dependency: self.dependency)
        let interactor = HomeInteractor(params: self.interactorParams)
        interactor.listener = listener
        let viewController = HomeViewController()
        viewController.listener = interactor
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
