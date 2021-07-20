import InterfaceLib
import ModernRIBs

protocol PullRequestsDependency: Dependency {
    
}

final class PullRequestsComponent: ComponentInThisWorld<PullRequestsDependency> {

}

extension PullRequestsComponent: PullRequestsInteractorParams {
    
}

final class PullRequestsBuilder: BuilderInThisWorld<PullRequestsDependency>, PullRequestsBuildable {

    func build(withListener listener: PullRequestsListener) -> ViewableRouting {
        let component = PullRequestsComponent(dependency: self.dependency, in: self.world)
        let interactor = PullRequestsInteractor(params: component)
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
