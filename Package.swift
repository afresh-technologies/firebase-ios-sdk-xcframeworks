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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_absl.xcframework.zip",
      checksum: "3118a71ccf9cb499add339e4c1e745026e1cf95ac26f01b6e2c8a887ca871484"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppAuth.xcframework.zip",
      checksum: "4f88ffd905ab6008abce2a120287ca5dd2bfe0aa68dc59c00edd893746c76352"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppCheckCore.xcframework.zip",
      checksum: "53f051f15f3361a72cf47177053547a42dee7f3ce644b98fbd0265f39ddcc4ae"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FBLPromises.xcframework.zip",
      checksum: "b633d897eb9d005c1e9de8e847e91b8416ebaa210f517aaff40f4d7596641779"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "dde7884827897e16e9f609281e8724b5cbe9228a21888cc1a3158e08e68ce2d0"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAI.xcframework.zip",
      checksum: "22727911e0b0dabd058455ff62dc7ac57da5599573d9cb3823aec93bfce2a011"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2376d6d1b5b3c259563421cdeec2773f654f889c512a28ef39c11bb6c09dc07b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "1c488a9d4703142f8949d885a6e840b12640f7aa288f37ae790db19772c32015"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "69d097570994af90d76389d3ad105b3a5b80e5eac26641192ccb77eb2a5157be"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7b8ee46cb6befc4b245f088af7111546c326be2cedd8d6730369ce1a94e96be2"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "2cdb1dd0db63eb29d53b3216641b7213edde04e2c97bf402678c2310e069946a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d052694f1718b0a49034b0630542a8ad3b21a2aa9c835560b63f1b64ab0fe473"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCore.xcframework.zip",
      checksum: "b291d7f17bbef9e230823ab05ff233d54ff77f974ef137741e167da07948ff04"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a43898d0b8ffe6021ad879858d4d54ffe9be2026aa50beade020090c62a3b8b7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "91621373a1c0da84978c2ec57dfea9774901a753ac80fcca5e2adcdbad95303e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "67c9d4b7269363418d3d065c77ddc0078551da66aa53b30b8094c8630b8bd819"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "4376c799b3102ed0130c667fdece9e90ded40f556cd0e43d29bcc516ffddefe1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d5c13776e9a6095091960a8d98f6897b68fc13714e8e8946cc445908e2d830cb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ebdc8cceef7ba3dce22216ef2c4fbfdea1b566fe622f1c023cf1733012f35211"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b4e313c4db19a1b61feddd33ff3085ee009a5b2c7cace58888e9cf4290aee956"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e30a86db86834d048b3d6ab98ef32192727f6e679f6764d137fd2b747c186663"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "aebb1451d74c663ccc367441d7b57fb804bbc572c816cb33a290712d774a1720"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "64b72a14bcf5a2a1ca44021895d849c2b83b97fd1e1813220ef2e6fed3150f86"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f1f918c731799536b3742534db059491a6d0afa10786f1ca2229b1e8bcbac5c1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "600e67d114c4fbeb991fdacfa1b552f027a897807ece13a6d84340c30ab4fd6d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "fc2f490be735ebb2f1dd52e5016f6f3e39dc750fbd6946126a46babeed84413e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7a776fc1cac5bf926ea05be3ec929ec1f27b00c78846c8bb657daec2172bac40"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1fbbca64ef833eb289a7f27ed9554ac2fe1dd537d17382e79129e6c84cc7f2ce"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "42ba205c5e1d1bb1b0c10412095eaf9aee0f86dfd98edadef339e3993dada546"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a38be534d15e05908bd4d2a0d83493c9d921c96c8c6fbde0d7474ad652c83581"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "ef309928d6d3c706c019437a55fd74116f5866a3fb33b49a0edbe639c8d64ef7"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3a3d35a48703b429c7f3f99b582c3224ca57c09c551e22372d798106cf27ba9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a8047ffaf5a30d122963eb7810e4960560949554cb1788ba004e1ca91fef8775"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "9aafc4dbf6cfefc8d950fa827b229ecdb031f9edbc399b0861fdafb5c5630498"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0c7e535dd3c76d91fc64a2e36c2b419e2856260c734d4f4c987168bb9dd71648"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "d66b51add2ae2540cb3a565b7024fc3c54a74ab6e10c86863cdd9ebcf416ee39"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "0f1b07692c2a0931a6bcd0a5260d5914969f1c7f22230e18cc036fb6ad631d54"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpc.xcframework.zip",
      checksum: "09d030ed96e2e05ed04cc06fa50e49b4baa4e5e107d6e0151012e6dd5304c9eb"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpcpp.xcframework.zip",
      checksum: "62ff9803e8838c12e2e6d963246544f2a2f46f7c505ccfddcf8f2cf25be5f399"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "7417e2fad6034a69aeb4ca1325ad069fc4bf4837a3362e76aa6d9d3279bf094f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "fb8c453ed1ad31bb1ceff7a48713095c39d701f0ada47fe6e066e0e7a366e95c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_leveldb.xcframework.zip",
      checksum: "d4448e1c26a2aabeacc5639c1c0e8774ebd9945e21054ec9b46380297cd07145"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_nanopb.xcframework.zip",
      checksum: "f07d8ffb0b27520b78cc237700d28bf57b73fc1a646895afd4fa4079b79b7fb3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_openssl_grpc.xcframework.zip",
      checksum: "a82fe52aaa26a045d88860fff48df4f276dee512b22fb0272896185f42daa0fe"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_Promises.xcframework.zip",
      checksum: "b6a194d1f2cb15832c115b506ea8488ff9bbd54ba9aaff50e179d173fe493b0e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "582daa1db3d0e7d77168d8f53b997b2132a9138e7d7eee7bedb76372f4f2bba9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "17f2bf00d16d14e435cee6be43d5b82084194dbef5d40e9873c979d9f4645ff9"
    )
  ]
)
    