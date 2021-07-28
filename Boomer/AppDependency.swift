import CommonLib
import ModelLib

final class AppDependency: TargetDependency {
    var gitHubApi: GitHubApiProtocol = GitHubApi()
}
