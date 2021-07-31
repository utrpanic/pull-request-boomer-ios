public struct CommonDependency {
    
    public var gitHubApi: GitHubApiProtocol
    
    public init(gitHubApi: GitHubApiProtocol) {
        self.gitHubApi = gitHubApi
    }
}
