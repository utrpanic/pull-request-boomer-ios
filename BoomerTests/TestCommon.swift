import ModernRIBs

struct Riblet: Equatable {
    
    let root: String
    let children: [Riblet]
    
    init<T: Routing>(_ root: T.Type, _ children: [Riblet] = []) {
        self.root = String(describing: root)
        self.children = children
    }
    
    init(_ router: Routing) {
        self.root = String(describing: type(of: router))
        self.children = router.children.map { Riblet($0) }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.root == rhs.root && lhs.children == rhs.children
    }
}
