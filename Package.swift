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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_absl.xcframework.zip",
      checksum: "05e0b1487717ca7033018bd5177eed2ebfa0c270fadd597594cd59304245304c"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppAuth.xcframework.zip",
      checksum: "f7285cfcd792245807d64d2af20791bbd9dd83ce6c02c8eae49c5d1db28c7188"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppCheckCore.xcframework.zip",
      checksum: "509f0438df742eb4927983036604bc593173c431d1e8130ea0e59ff84f304546"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FBLPromises.xcframework.zip",
      checksum: "e6a5980af31c843c3ce318023b03e2182df4e92bcc8c70f378920b22c46fb55e"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0283b2f236d771f7dfc2014b72f5e8773e82cf9b9eb4dde9f982da624359c26d"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAILogic.xcframework.zip",
      checksum: "5a491b9fd84ae162441c93a0922d5a5ce7825ee1d14f889c59f1c5b53afe1e8f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "79d35cf8631d35c71b34160a7c15bd408e65986823109b8531ca3b1ba0ebd838"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0855b3987b286bee38b3b15573a39a00b030c323dda34b7aa389f524b77d830d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a3315de53ab7d42c107c80ed71149fda8685268da9f665f286327792ed7f218b"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "005631ed41758f79ebef7c2644731a7e9621f1ed75d0c2de1c10b899e45c9520"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "922018ed3772fccb6a5498d1c5c9264f1cf946f8238aadf875dc85ac921aed1d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "118abe2b0e208e96e2712032e35402bf04e4336f439600d321aa29f8bd2b8223"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCore.xcframework.zip",
      checksum: "2fd24ffdce6ca1d34c96fcf9f95a1e3668880e899349968d69b45c31af5da94d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ae57a619d96ab8a47951ab0958c97a2c9136936010ccafee3362ae3c58951393"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7a2ad6226fa00e865d9654708f678855e5d63cd884dc53e02430c08280fd8086"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5faa736adb735747f9af5903bb79cf4eedd20b8f7fde76b46c8bd0078b36e4d4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "13856fa513f541c0814e30e80790098cb122bb6a07b3d7db0f6641990b6bb627"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3d1b0f712f9be0fb5fcdb014d1c2bc9ce7f8aad8f9b6c4d35d0cf7f3bff39275"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "24016678340da4882f4e87433bdd84211ef8df66b89f4fc21470318b540cf920"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0b22505de4c2b2b16b4752378fa6720eff651473e25ef343b4d347a2c65683cf"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4c83d083b234f9158e3b310bc354c0813a1f7ee2ee09e80f066a762a32c54222"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "7bc12d679dd6c61c6c43e51df79d12881b779369bf72914b37384f0d6ca6db79"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "97788f8fc16c514a3099efaf41b4d023b876d037a924fd9a3e0b6f79b975ba87"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ea9d3990a82d69ea4b5c2fcaf30a12366fd396bb4d60b654bfafb38a6074213b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0b9607bed34307ad4a6f73fa09bdad084cd034a17687fc51c609a28cac4f1721"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "1e5b62dde4d770263dfaac35501427f60886fc24541d3d70a21098ce2442cf3a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b00e9a5bbb0830a92077c6d59676a01df3e0879ad19bb219e727fee109131cc1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1fa1f9ec1adfda0cb6286d7e48cc30cf48e257396193d8dd9c9cfbe94cf67944"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "a666cc84edf75359bb5d471994ec81822074b0cc67b1679f0ffeaa95945d0479"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a239c37d448ec1cf89b86da3b1250ac81be3e018746b609caa547ec71486ebc8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "7e91e60732c56301de7a92b272a4c519d68e2c7cf2c10bb4ab2ce3f5b0e642f6"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f32b2f063de63e50cc4ed360a56c223d75bdd64b38309450c77b254d74370315"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "53a5dca311f329f759be27160e9d87b416d5d8824843c19acafd41276205b19b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2abec657229eff8e36c9e2e99b651077179de9ddcb0065fdeebfa19a2c388715"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3764a6b7357c18a4944c6ab775c34d70560d68d2a51a0d655e98d4c2df1351e0"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "da644fbb5949572137e56947227c78d59b89976599b5a2841e797dbaa679ae4a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "adc7448878e34feacefa0171eabbc518baddde530596a57837cf1150ad6f946a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpc.xcframework.zip",
      checksum: "37b1c9cc8801c849620fad1b86f22ced4a08bda33582a2727b261b93adee38aa"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpcpp.xcframework.zip",
      checksum: "37619d2d96d33f41ebda0a4402ed327b79a180b0f9e620994ce89700543b5fb0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "7902ab1567d8073cd95b2d277b615289cbb02fbfd9e2bbc497ff05953a4b825e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8460f290283f6a0c4bbbbddf98f066db3bdacf6003a107af507fe7448c7e5d96"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_leveldb.xcframework.zip",
      checksum: "d571ef7dbe91b72407a5f74612765861f8fa47604045be1d80ca02f927b78309"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_nanopb.xcframework.zip",
      checksum: "9ef69ab773f710e1397dbd7a14f5de0b71c69194fa811cf543fcfa857793d1c9"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_openssl_grpc.xcframework.zip",
      checksum: "55e782cbb0c1bd783e83b5fb86a6f649e17c4b01c6ee257c8e96c284bc20b3fb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_Promises.xcframework.zip",
      checksum: "c7da43f391401ff49e029454e2ac97e73ccecf17baab52ed225ebfa5770cae95"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "2c14de448990bc6930c6c787cbd7998e8cfdc8690ca24a695f91606cc5729b41"
    )
  ]
)
    