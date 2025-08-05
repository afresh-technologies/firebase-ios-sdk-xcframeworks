// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppAuth.xcframework.zip",
      checksum: "5412187584e4b37abff9b62d2ee97d6a9aee577c6989888e335e5154531c86c2"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppCheckCore.xcframework.zip",
      checksum: "13cae5bb7ce115586d194340b74340242c9646bdab9166499c290dd2c9aa8a53"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FBLPromises.xcframework.zip",
      checksum: "ec5b8e69662f3d58228db7a75564ba42ed7eeaebba6a23a2e5c7f46fe6561698"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "bab4c4d9b52e125e86aaada535375165aaef53fdfe8bc91f6b72d6f6cb8fd37e"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAI.xcframework.zip",
      checksum: "1b17d39b583d4b1304f936c043cb712b31c9a29799ddcecf2ba2f8cc1d40e736"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "edd696532a4e5c1bb9ed983008b3a1366ba881845e834be7bc56912281664054"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "991c3605c9bae77ef3ce2ff6cbf3f473f1981263b52db08041616d971c47ade3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8202c1bae424d3e342d50d71521d4ba267a28c2d4aeae9f612cd0fdb599e5f3c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fc655cb99c0693516cc65df53a8184c76a8ca372e438d324f25f4607065bad78"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "f25a2b0586eb84d9acdf7281194ec9c1a792013100b78e9fd70fbb51bf522428"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9d269be973abc1a7d5da5aef9d4f03042ecae4ca04ef54ec579877e068bec4ab"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCore.xcframework.zip",
      checksum: "7eb88726a9d26522823c2d215d1994a2a385b28b4d09408dc12a32ef527c8842"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6e7ced317b06a8c128928938cdae8ac5649f027d94218e13c57c302795984637"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "da03a8e9430aafbfdeb9d70bd5d4361a92530196855a77fac38ad6ade8a50833"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3c63479ff4082fc828956e0e828b89c2393f85788cc628b017314effc1942fdf"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "198a773fcedb7893c085978707fe158f8833d4e05a88c1771b689ffe8b6724de"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3e94553eb0c2c67613bec73bb1118d10cd95bb347a23788ce657cb584e5a7d7e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "0a9df4e576d1a15e9ae990a1104f0486118ca4f5557b01f406ec6b1ac48a6c26"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "562efe31ad7f5556f41d6a02af9274b6b138d2316335a03b26a693131c47c414"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1f526abb711a4d5a09be9e53044fc5ac34caab4713efcf46ede4391cbfc6a757"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "633d6298b1a54e48a42116f15f784f519f2af62f7576c2fd033f76743712c8e9"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "56822b2765a1dae4d0be2c71ac842b41881061a25ded1b321b78a7ddead049d1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f5c250757fb9fb49e60d0ceca7bebcbaaf241e3e3693cca245d5c424e1afb26d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "dfa639dd415fc0e0539f8428ba8cae9571c65f8311ac638361489aacfc03e5b3"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "5b93f20d5e9567c8425e0599278efd405e5236c58991bd7367f719fb8e057f01"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "092646386e2dcd0cf4672bb45c978f72e69ca07dde4061846acb9aac27266be9"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "482277c1f21057ec4a07fa04d91a092a4b213d31554aee9d312f6ee7c0bf5c8b"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "8a117e7e9b6e5266eb99077cd5d117cc4f17a46de3c10e5e5c177b3d224b6cd9"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5c93e75dd317b95ee06e2af64c59ae52a97087aeaa6f722e93cf9ef992685400"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "1c333987f19cdac21d20754baed999491b4c36bee79977b9e5130c087db92fac"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "0e2b7fc27964ce0fc454ed14cdde951220f3f301ae5e1911d7510ccb7e0ba58b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d0b5f8428bf5882497f84b4b2805c07b602ebe4c48a96f723020dbba92df6888"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "479b159050517302140736a135a38458d49e8c27b777064b0a3cbab07f4c63fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5b3d3fdbaec6003a748e9b56fb49cc8f066e5203d1c2cbb92da3fb861a0170bb"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "58d9ff545d7b8f5d82056302d21fc0cb15764fb6a2ea5de5187afeee86f1441b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e74991f782ffe20cbb7616401105a4bc5f4875398d0007fead67ec30dd2c36c9"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "3000ae03e22b36ed42fba67d66cb9ede2ccedecbbfd92dbbd05869fcfdd60957"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "189bf9a8e79b6ceddec42e58771dfee61e6c3c8a6fb029c896783ccab44a4115"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_Promises.xcframework.zip",
      checksum: "29fc5972dff68d575522cfdce5e5ff4187f08583a225fe61592c8825c87aae6b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c55591eaea928728b3720a7f1198f95d741b46a4e88a807efb84ab72f3943f72"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d39b5154dcb1e397494be78f795305c38e8dbd3f59911108ff8e38367de7880c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_absl.xcframework.zip",
      checksum: "8d8786a768e69bdc9fd06bff168567ce219c463f1c55a4db539ff7a0e60bb780"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpc.xcframework.zip",
      checksum: "a696f5137a94f26e835f5ca9ae007f473ec88362a7428b1c8f2ad00a87e123f6"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpcpp.xcframework.zip",
      checksum: "b9953ddb54372178545ff3e2c68bb49f7b6cbef87560a0aaa946ecd5148903c7"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_leveldb.xcframework.zip",
      checksum: "d2e6f6b63d35ee0cbbab278bfde5c8815bff80868f3b17d4d7df201768b89d43"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_nanopb.xcframework.zip",
      checksum: "8e0e4bd7eb2e62ff2cc0db1464df9ac33b1c93aadf0b3911f3edb830b62a1ea3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_openssl_grpc.xcframework.zip",
      checksum: "3949c6537cb7caeef2e9b6dd119208e8bc71c0b74d322094f60d6075c8723b22"
    )
  ]
)
    