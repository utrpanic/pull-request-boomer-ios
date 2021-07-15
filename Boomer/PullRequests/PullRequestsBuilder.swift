import BoomerLib
import ModernRIBs

extension RibletName {
    static var pullRequests: String { #function }
}

protocol PullRequestsDependency: Dependency {
    var buildableFactory: BuildableFactoryProtocol { get }
}

final class PullRequestsComponent: Component<PullRequestsDependency> {

}

protocol PullRequestsBuildable: Buildable {
    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting
}

final class PullRequestsBuilder: Builder<PullRequestsDependency>, PullRequestsBuildable {

    func build(withListener listener: PullRequestsListener) -> PullRequestsRouting {
        let interactor = PullRequestsInteractor()
        interactor.listener = listener
        let viewController = PullRequestsViewController()
        _ = PullRequestsComponent(dependency: dependency)
        return PullRequestsRouter(interactor: interactor, viewController: viewController)
    }
}
