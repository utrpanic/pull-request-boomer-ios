import BoomerLib
import ModernRIBs

protocol HomeDependency: Dependency {
    var apis: AppApis { get }
}

private final class HomeComponent: Component<HomeDependency> {

}

extension HomeComponent: HomeInteractorParams {
    var gitHubApi: GitHubApiProtocol { self.dependency.apis.gitHub }
}

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> ViewableRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    func build(withListener listener: HomeListener) -> ViewableRouting {
        let component = HomeComponent(dependency: self.dependency)
        let interactor = HomeInteractor(params: component)
        interactor.listener = listener
        let viewController = HomeViewController()
        viewController.listener = interactor
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
