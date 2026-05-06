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
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_absl.xcframework.zip",
      checksum: "28ff90e6b2a65d5990e51bbcf944e315680a72256128ed3b895cc5943ac8eef6"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppAuth.xcframework.zip",
      checksum: "85ab53342b1b98a045f7d4817650c2f27dffc751b828358c7ddc7de7584dc4eb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppCheckCore.xcframework.zip",
      checksum: "93e18c41e333bccf95fd1a4d3d19b93ef1a7624e07a82b483a5922ce70c8bcd8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FBLPromises.xcframework.zip",
      checksum: "4c541ff44c5ea9ae8ea506c953703131657400fa4fdf14c120b662eb85773b8b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "78eae9084693ee369b1612ad865f453ab671e632a3a0b7a152bed4ddc80d6659"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAILogic.xcframework.zip",
      checksum: "7050b75ffba05ede4d6c7318a55e6cae340dfc90c513dcc7b47187cb10443d35"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3ce90bd5f72abee81f1063b27ba242fe5a29f8c7d8d73ff8f1718ce70353d0b6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "1ae6fc3b1ab45f1a5eb8779916213e470bb73b7649f18c0a453da9bc582d45c9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5fe845641a339293c8e7e46ccda3b54bf110daea9bba0d4ce8a0c383e59d60cd"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7e9d22d4e11f8c722b7b175d94f8eb8668cdc3b485becf9449603828003a0e68"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "69f882851902ff7ce6c06684734bf5a8f403a77b5300a1fd832a598b3c4c6905"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "0c3624fe78742437def954ed4dc2828b4b14f1f9d968278551f739ee2510226d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCore.xcframework.zip",
      checksum: "4983218a8c0bc19b596ccfc34f60b1323940dc8245fed9ccf348dfc378cd827c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e78d8ab718250f7acd40dabe25f65069a07ea0be6346bdb414aac3e56a98417c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b7c6d7111aa36614e6bd2ecce62f84f96275d44645a8858660e4224f33c5358a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "bb78ed0cfe366200a64708ff7b76828caedc3f4e91fe1255531b56d3ee532f4c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bf80fab121819ec17863fa11910a2d82c7c5c6070e4f91ad73c3d4c0756ace37"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "26ee4b117aaf7f3a4d063fe351afcf487a7973a6037b168452d9f75d41ab4888"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c5ed423d0f44781a21f55cce4f34eb057421839cae84b6a826de56e8f0470f3e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9fc6b0ab177ef9db32f9cb274fdef4d902b47aa07bd16202fe1e76638d2e0a04"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1326303588a99ff8ff8ac13aa430aecb340613219624ccbc0f1f78aae59814d8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "b99ac85cf2ec71347566bf66cfd6eead63680263912d482af35d828f55046ae1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "6785cad33ff01a8dbf1e621f64e2491237ccb3c4745a54e39d9ce0bdb85be83f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "18dc7ca3de2bc4ced92ef7ba16f58eaa9a71780e1ac957f8fdf27e6c6a7871ad"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0ddd76f1dac3bd78a2c3cd70433fbbdd43bdbfe0af77e80fa91562d0af6222a9"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "420c012abdcd8a2592e211436703e03359419c7f636061f868503127a912a5bf"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e01ca9e6107da64faf94c278400a39c23ebd65a57b22319bc471f3153726dd87"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "43a86a9d4c3694d1fe8ccc2c57d1379487946ed2794b618dfe9a70c27eb25aad"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "d5eac28a7f4aa7837ec9b495b8f2e7e0f243d480487b6d04b9503de5b5ba75c4"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "48fb7b587f7943b9383ccddc0ccd454ad67d2fc57e6808866af56ab9248b02fa"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "b5689898df256fb3dbdabf76a9adc26588f8cf234654a012ceccc0c218896e04"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "619f8db9178d0acc59dab0cb8966d74291a1306360b2840370f98caca2609997"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "0eaea227bed729758f4fd6ae9ad6fcd68b9e8240ef92a6ebeaaf8ae870cad4e8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "304c10ec732c3746974bcaa3a2ea69476650305bbfc74ef943018caee00768c2"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "31cf5296bbc4fa82a3ff1f921ea827577e8123cd680e4e24876b97f472cf8297"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "fa427489e003a2cae79af9009813b950a8d14f47cabe2cd4f77ab98523ed0b79"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "6618e22af8fc39f6093f73b077375a299e670b76ed753788eed75ff2c9f596dc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpc.xcframework.zip",
      checksum: "07fbf2822b99ef561e62dbbd61ccac40e16400791c5ef7bae5d7db06167d3b5e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpcpp.xcframework.zip",
      checksum: "8aa3c0a4b41466e18fb2f6e5b8578c74d70c4a2e9f420bb6391a275194ffaa15"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "c4c2ae364ddb2ca2554c1a1ff52ea33053f5a34e075771d231184090fcabf109"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e0f60053cf218ee7583739c1a3634b1ed5c7c6f0da16347b634aca4db54ad205"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_leveldb.xcframework.zip",
      checksum: "2c0cc1446c1fe86bc7223b3adfacf9872f6942f13379f79dac8853a527a176bc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_nanopb.xcframework.zip",
      checksum: "c73ecf81d4842e2bad7cbdfc2795354d2741f364d463c6d9f19156c7dfe0edf6"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_openssl_grpc.xcframework.zip",
      checksum: "cd3f5845d667761bec08b65c9eb7f69481e44f52cc6c3bb1e87b7b5ded28d329"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_Promises.xcframework.zip",
      checksum: "981aeedd0515576443ae9dbcb1b2b30bf432c129fe3cdb19e76dff52e18300ab"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "971fe211f2b25be9f15ecc76766b500317dd60b2cc66768440c68bf7ac6a90eb"
    )
  ]
)
    