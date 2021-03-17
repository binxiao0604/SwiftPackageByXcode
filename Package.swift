// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let versionStr = "10.3.0"

let package = Package(
    name: "SwiftPackageByXcode",
    //默认语言
    defaultLocalization:"en",
    
    //平台配置
    platforms: [
        .iOS(.v10) //枚举定义在 IOSVersion 中
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
            targets: ["SwiftPackageByXcode"]
        )
//        .executable(
//            name: "SwiftPackageByXcode",
//            targets: ["SwiftPackageByXcode"]),
    ],
    
    
    //依赖库配置
    dependencies: [
        .package(name: "Alamofire", url: "https://gitee.com/guaizaizaiguai/Alamofire.git", from: "5.4.1"),
        //目前没有条件配置了
//        .package(url: "https://github.com/Alamofire/Alamofire.git",majorVersion:1),
//        .package(url: "https://gitee.com/guaizaizaiguai/Alamofire.git",
//                 from: "5.4.1",
//                 when: .os(.linux)
//        ),

        //   .package(url: "https://gitee.com/guaizaizaiguai/Alamofire.git",from: "4.4.0"),

        //第三方有规范的格式: 大版本.小版本.测试版本
//        .package(url: "https://gitee.com/guaizaizaiguai/Alamofire.git",
//                 from: .init(5, 4, 1)
//        ),
        
//        //如果只有两位比如5.0
//        .package(url: "https://gitee.com/guaizaizaiguai/Alamofire.git",
//                 from: .init(stringLiteral: "5.4.1")
//        ),
        
        //指定分支/版本/commit，这里与我们再项目中引入Swift
        /*
         指定分支： Package.Dependency.Requirement.branch("master")
         指定commit： .revision("commit")
         指定5.4.1版本： .exact("5.4.1")
         指定5.4.1~6.0.0： .upToNextMajor(from: "5.4.1")
         指定5.4.1~5.5.0： .upToNextMinor(from: "5.4.1")
         //指定区间 5.4.1~5.5.6
         */
//        .package(url: "https://gitee.com/guaizaizaiguai/Alamofire.git",
//                 "5.4.1"..."5.5.6"
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
//                .byName(name: "Alamofire"),
//                .target(name: "Alamofire"),
//                .product(name: "Alamofire", package: "Alamofire"),
//                .target(name: "Alamofire", condition: .when(platforms: [.iOS]))
            ],
            //系统默认公开.h 是 Sources/[targetName]/include 路径，如果要修改需要重写publicHeadersPath（默认在 [Sources]/[targetName] 下）。主要是提供给OC使用的。他代表你要导出给别人用的文件夹, 如果不提供 publicHeadersPath, path: 文件夹下就必须包含一个 include 文件夹, 然后把所有要导出的 .h 放入到其中。
            //            publicHeadersPath: "../SwiftPackageByXcode",
            //要导出的 module,import后的代码
//            path:"SwiftPackageByXcode/Sources",
            
//            _url: "123",
//            url: "123",
            
//            _checksum: "",
            
            //排除
            exclude:[
                "Readme.txt"
            ],
            
            sources:[
                
            ],
                        
            //资源
            resources:[
                .process("image.png"),//推荐，会进行适当的优化
                .copy("BundleData")
            ],
            
            
//            swiftSettings:[
//                .define("ENABLE_SOMETHING", .when(configuration: .release)),
//                .define("ENABLE_OTHERTHING", .when(platforms: [.iOS], configuration: .release)),
//                .define("ENABLE_OTHERTHING", .when(configuration: .debug)),
//                .unsafeFlags(["-cross-module-optimization"]),
//                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
//            ]
            
             cSettings: [
                .headerSearchPath("path/relative/to/my/target"),
                .define("DISABLE_SOMETHING", .when(platforms: [.iOS], configuration: .release)),
             ],
            
             cxxSettings:[
                .headerSearchPath("aztec"),
                .define("REALM_DEBUG", .when(configuration: .debug)),
                .define("REALM_VERSION_MAJOR", to: String(versionStr.split(separator: "-")[0].split(separator: ".")[0]))
             ]
            
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
            dependencies: ["SwiftPackageByXcode"]
        ),
    ],
    
    //支持的 Swift 语言版本
    swiftLanguageVersions: [
        .v5
    ]
    
//    cLanguageStandard:.c11,
//
//    cxxLanguageStandard: .cxx14
)

