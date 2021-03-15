
public struct SwiftPackageByXcode {
    
    public init() {
        
    }
    
    public var text = "Hello, World!"

    public func test() {
        print(self.text)
    }
    
}

/// The type of this target.

public enum TargetType : String, Encodable {
    case regular
    case test
    case system
}
