// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageByXcode",
    //默认语言
    defaultLocalization:"en",
    
    //平台配置
    platforms: [
        .iOS(.v10), //枚举定义在 IOSVersion 中
//        .macOS(.v10_12),// MacOSVersion
//        .watchOS(.v5),//WatchOSVersion
//        .tvOS(.v10),//TVOSVersion
    ],
    
    //库配置
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftPackageByXcode",
            //动态库 or 静态库(默认)
            type: .static, //.dynamic,
            targets: ["SwiftPackageByXcode"]),
//        .executable(
//            name: "SwiftPackageByXcode",
//            targets: ["SwiftPackageByXcode"]),
    ],
    
    
    //依赖库配置
    dependencies: [
//        .package(url: "https://github.com/Alamofire/Alamofire.git",majorVersion:1),
//        .package(url: "https://github.com/Alamofire/Alamofire.git",
//                 from: "5.4.1",
//                 when: .os(.linux)
//        ),

        //第三方有规范的格式: 大版本.小版本.测试版本
//        .package(url: "https://github.com/Alamofire/Alamofire.git",
//                 from: .init(5, 4, 1)
//        ),
        
//        //如果只有两位比如5.0
//        .package(url: "https://github.com/Alamofire/Alamofire.git",
//                 from: .init(stringLiteral: "5.4")
//        ),
        
        //指定分支/版本/commit，这里与我们再项目中引入Swift Package相对应(Package.Dependency.Requirement中没有定义range)
        /*
         指定分支： Package.Dependency.Requirement.branch("master")
         指定commit： Package.Dependency.Requirement.revision("commit")
         指定5.4.1版本： Package.Dependency.Requirement.exact("5.4.1")
         指定5.4.1~6.0.0： Package.Dependency.Requirement.upToNextMajor(from: "5.4.1")
         指定5.4.1~5.5.0： Package.Dependency.Requirement.upToNextMinor(from: "5.4.1")
         */
        //指定分支
//        .package(url: "https://github.com/Alamofire/Alamofire.git",
//                 Package.Dependency.Requirement.branch("master")
//        ),
        
        //关联本地支持SPM的库
//        .package(path: "../Example"),
    ],
    
    targets: [
        //自己库的target
        .target(
            name: "SwiftPackageByXcode",
            //导入依赖
            dependencies: [
//                "Alamofire",
//                "UIKit"
            ],
            //要导出的 module,import后的代码
//            path:"SwiftPackageByXcode/Sources",
            
            //系统默认公开.h 是 Sources/[targetName]/include 路径，如果要修改需要重写publicHeadersPath（默认在 [Sources]/[targetName] 下）。主要是提供给OC使用的。他代表你要导出给别人用的文件夹, 如果不提供 publicHeadersPath, path: 文件夹下就必须包含一个 include 文件夹, 然后把所有要导出的 .h 放入到其中。
            //            publicHeadersPath: "../SwiftPackageByXcode",
            //排除
            exclude:[
                "Readme.txt"
            ],
            //资源
            resources:[
                .process("image.png"),//推荐，会进行适当的优化
                .copy("BundleData")
            ]
            // cSettings: [
            //           .headerSearchPath("path/relative/to/my/target"),
            //             .define("DISABLE_SOMETHING", .when(platforms: [.iOS], configuration: .release)),
            //         ],
            //         swiftSettings: [
            //             .define("ENABLE_SOMETHING", .when(configuration: .release)),
            //         ],
            //         linkerSettings: [
            //             .linkedLibrary("openssl", .when(platforms: [.linux])),
            //         ]

            ),
        //测试target
        .testTarget(
            name: "SwiftPackageByXcodeTests",
            dependencies: ["SwiftPackageByXcode"]),
    ],
    
    //支持的 Swift 语言版本
    swiftLanguageVersions: [
        .v5
    ]
)
