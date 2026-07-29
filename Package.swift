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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
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
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_absl.xcframework.zip",
      checksum: "f2218516cd2f97bbd8a13157a446b61d92caade4a52375ea2d44c4385b5bee86"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppAuth.xcframework.zip",
      checksum: "df82ec7457b4b65ddf94dd4c54db27d47c9532d7d2051d243cf7f669595874d3"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppCheckCore.xcframework.zip",
      checksum: "6f8c926379e7e08ff7032ee90012ada5a8684d3f69183dc9662ecb7a8953ba9a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FBLPromises.xcframework.zip",
      checksum: "5545847aa1f2ff73998d846324bd5a5a891eb1c759423fcbe9c32036567a763d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "153e68beed304a307f31fc8a6f57e8305c39178c3398301d6375a6ad3d75a7b2"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAILogic.xcframework.zip",
      checksum: "72d2c345c500f189eb460c91ef21fc3e3ab51337163aac2387f63a6b79dd3f2f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f801d637a1d40c7ab1f16ea598179b70aa01d8854b037a88eb9cbb1e31d3ab04"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "14f8cb055741fb7d6a5bcce3b0e068ff3e00b9c22b413c3d07bd3ca598def0af"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "90ecf9f0db90f80e5afbf60ab681669f56537a4f9849b205c908aa819eb0ff5c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "e890badffb1b85cea03f648bff1dc12646bcb658dd8e10a0dd7aa378ae60cdde"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "311c3516074ba5800f46802aa586e1a552d54c097334cb29213f0a832247fc35"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "aabf3bdd61c6f4c6dce3009c91f4b44551a16e6515784d900f23976a0e4545e0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCore.xcframework.zip",
      checksum: "11acb74cf971cb5f19b0cd3dee5c46b698c0111460c920e7cad6fcb9ad30f897"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "927d8e110f68a2d7debee39879ca0458f6ada0f48b4b86df31f4215f3b5d2740"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d8f636377a2bd311fcb94bd2a96f82e77fc6a57f39e312c63b957ac609381e58"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "71bd97d9026f6c0448a7a67960519feba813e4b07202cb26208e60627c3689e3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "0ad562071fba85b6891b23e7cda02bf2e43ee1f0f20a7534fb8204ae6bd81737"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1f6cb482fcb1a8a1d8de4ba119bd120763154809c5678ea419381bb1d9391a90"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6c4d64fbb985be32825546d3087877d5187276af1ef0b0fadcb8415d69bc169f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "c8cf41ff9eac49f743d6e72b5a1c3528e8796b776373f0c16b5198387f2242e6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "97fc822ec8808cf471beff4af73fab9ac8386bdef446ec0cc991bda24d4f51f2"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6715e5714ea2ea26b905e6c5e08cddb7d28bbacc83a3858a401a6356cd0b7366"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "6b2131a333fb74db1e03dcc8a92631547d4456b705212aff6d61e179a3932fa8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "cf175b9259db1272d184d158f12b1000f571dc1927461e005dcf86ec26a34b6f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "768508c6fbb3d890e966cd9441a2589f1d68484609d355388116cf7e0039046c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "1f29aab3667dbc427e86900e32e2a66c85d557556f1f03f0c56b9d6276bf7ef7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4eb3c1f0176eeee1e7d87d0a2f5e536bb895df32101211988eef74b67c1c0b16"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "5ed72e6c72904af0dd916c727129716d4be57f5d87f1240b80b683acdb531f90"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "6d72455da72f884d6bdbbb462fc43e02872f38a9f9e6e5890ddc883012504e10"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "0c4e9c67c9daf8fbd1a863dc075dab9044e06e6f5ecf1e755139987b13bfdff2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "9641cf499c4781b80d4390f2bf1dcb766eab1aeb06151cf3f043d680e8d4e3c9"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0f088b8a085e62a38b016e33f04d000511deb0e6a0b15ada507cd73512593582"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "7842be5bb543fdb0775055942f7413b8ee067f82a7b4f881ddb042f80d418e7c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "855dd0964935c85f889c5c28733090d37ba63bf8cc80fce980df988ec2a994cb"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "511083ed002ae293e3cc3ab072fab326c49c3962419dfd82f068acd776a66992"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "a386499a7288294271cd5e302c5c8a41b8a5572d7979656682f36cb87a34d80f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "313da9cd8a765d281f39a96b9a77eafdb30c2f0b6e4a6b18424c3f119b92c0c2"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpc.xcframework.zip",
      checksum: "eaf1e97981a39136c333c0f53bd0cadaee84ae501e37ca7d472e38f50e2a279b"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpcpp.xcframework.zip",
      checksum: "b6d1c992f6e3eaa6a5bcfa882731e41dfec6a71c386426fc32ccefd2f8eefe35"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "3d1c83ff9c7c7ca33193004b917631e9cc817764c68ffb1f01f3ff17df8e33cc"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "93c58d8844b1490e362ab3deefb779e5e14feb4da60e20973820d3c79f636685"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_leveldb.xcframework.zip",
      checksum: "a0665f3aa0bbc88d4fc8dde63ce3a7cbaa9e333e9c2259361e9344f6ea8bdb7a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_nanopb.xcframework.zip",
      checksum: "59eb9a7bb27909e2e1bd1446483e6a3aedca1d884688a484a547458adb49fca7"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_openssl_grpc.xcframework.zip",
      checksum: "4b51700c228216954e374ac7a34037f2736eafec419a4c522e0aef16c2f41c35"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_Promises.xcframework.zip",
      checksum: "b10f5729e67ac9f54d8c6ee6b856616e66024479563723e2a796acc443f9966b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "67ef5ec7d1acdc3c9269ebf7915a4fc2fbe8964a52088573a7b4ac624b0015da"
    )
  ]
)
    