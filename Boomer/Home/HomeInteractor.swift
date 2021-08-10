import Foundation
import Apollo
import BoomerLib
import ModernRIBs

protocol HomeRouting: ViewableRouting {
    
}

protocol HomeListener: AnyObject {
    
}

protocol HomeInteractorParams {
    var gitHubApi: GitHubApiProtocol { get }
}

final class HomeInteractor: Interactor, HomeInteractable, HomeViewListener {
    
    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    let params: HomeInteractorParams
    
    init(params: HomeInteractorParams) {
        self.params = params
    }
    
    lazy var client: ApolloClient = {
        let endpoint = URL(string: "https://api.github.com/graphql")!
        if let authToken = self.params.gitHubApi.authToken {
            let store = ApolloStore()
            let network = RequestChainNetworkTransport(
                interceptorProvider: DefaultInterceptorProvider(store: store),
                endpointURL: endpoint,
                additionalHeaders: ["Authorization": "Bearer \(authToken)"]
            )
            return ApolloClient(networkTransport: network, store: store)
        } else {
            return ApolloClient(url: endpoint)
        }
    }()
    
    override func didBecomeActive() {
        super.didBecomeActive()
        let query = SearchRepositoriesQuery(query: "graphql", count: 20)
        self.client.fetch(query: query) { result in
            switch result {
            case .success(let result):
                result.data?.search.edges?.forEach { edge in
                    guard let repository = edge?.node?.asRepository else { return }
                    print("Name: \(repository.name)")
                    print("Path: \(repository.url)")
                    print("Stars: \(repository.stargazers.totalCount)")
                    print("\n")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
