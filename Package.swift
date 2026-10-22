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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_absl.xcframework.zip",
      checksum: "ed323a871ddc81785a275abf49c20285f004f19a4a7619de60dc2dd0e13ee284"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_AppCheckCore.xcframework.zip",
      checksum: "520fa56aa90b51aa20fd318268cd12ec8fc51e0ba18e74862f77bafc08be733c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FBLPromises.xcframework.zip",
      checksum: "3a4a77a102502208dcc953a5d3aa6a44b935b9aa8dfcd8f4257e46a7961f11ec"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8db369d3a6f45d8c37461940877fd8d0b971ebcea16ae6498edb2257fac71b57"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAILogic.xcframework.zip",
      checksum: "446845d00d3fc80bdb0ed9d7b03206eaa90f696d2d048c8777a537a36ff1e0a1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7d181911c431b088f1fb55077d6cf08262cdaf6e15a972ec45bec5faa2ca13f0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "a61618a0c22d9def829c323dafd8ae5803768f313ba9aa4d330987b43f2c4a43"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "472bbf89c0e8a64f43ce11591b1c1fbbf75077103e28444e11533d9646969836"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ddb567f290aad199230abaa15f143dad1cab0752a128a54dfbc81660d8234ac9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "11a17f50b856869ad7b0965b0d5baed17750a0e741fb6612e3f4f58767e2c65d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6c13631b39e92b1e7e3962d7bcf392900c8ff27f25b3c6c15b214fa944d86a67"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCore.xcframework.zip",
      checksum: "deb48681a092a4b85cfc7bee5df46b9bcd14654e966f23073f2c9bc28f9f5f09"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "d3cdf7688285b426d27223508eeb44d99f30e856177f84e8be3bb7433286535d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "aa1a7de967fe8af68c031f6d2a8be785049a2ea4c6820b52fbe3fa1b25f7a1a0"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8ad59e47239620205be26b5139830833807b17ffedb00157ff796fc02bd0fc19"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5a04fb053a07c1ac06b3468a0a919d67826eec7c18afe87bac505df48204d2be"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ec942cd23163bc2b8522726efe83dacf4ae19f9f803442277663e2fd8b69f4b0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "27ec64f47aee9e0e584241315bd40a03f3b63bc0c4cf55e848607299b7c39a42"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "aae8e4b07089b884a5a602d414e8d5779fcc6df4067f9ed07ab7a5fc2b85c125"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2f903543d9ce43e0420efd37e4509ac61b363334957c03085082bde6b5dbceba"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "65f49d427c6029552780866cce32c2397cdf73231cad9bfef4f732970827ba37"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "bfe289117aca72d2fcc4893592a46bc36d857b8178d2fa9e9e5f3443f7bd822a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "63d698b2f1e699f1ae7be28ea74cd5287938e1d20d87274f01b7d2aa838bd395"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "1a2ec760f7bf6c3fdecd41331dc234d4f3b1d358a07208bfbe6905ac136e091c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "bc02c569adc35a8a1aff096a5c7973fc9de8ae01d1122f077bb4a4aacbcd9e6d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d061f929a6b6fb4ef132870433413876c276cda735fe82b2130993097613fe36"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "4e6d8e39811a1a9169720f0af9d5adb7409eab5fbda5aeeeece81ece069c27ac"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "14815ef5e9c41704152e9fba93753faf048ba2e0526e3e97afdedff63a273f0f"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "acebfd345fc36125472d27ed76846ccde0a443eeede5b8d751e8ceafe50697d3"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "bff8551b24f0a0f691b14d7233113bbbf601cb9f8932d437735a063e1c14d813"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "52cb3388d4d6b31627ba38eab877017b97a8992b9e16ba996bcfd63722f18167"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a265e5604df1a9f3edf34f10859a4380e5eae698206d016e62fd2ec2ecd4ef49"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a3db9639fff149e5533c2b952d468b3f0e790c698ea085cb1f7efaf85a4e8a74"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "044b649dc06e6e4f5cd307c0593d97f3a882782fe90523bab60fa160fabf809e"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpc.xcframework.zip",
      checksum: "86f9dba58ed1cbfb083ceff9652866e2c9c2b35508d38c77f6ae81d334d17bf5"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpcpp.xcframework.zip",
      checksum: "36ee1984e3d481b7498006ee419eecf4a1bdd07862ef9728167e2833ef7f19b9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ad24a51961acd175422381ef36a0f87f609ea6cd66dcd1278a7f7aa4e6b13d03"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_leveldb.xcframework.zip",
      checksum: "52bf8bfb9681ccad80f81bef78f9307259647944963eae886d414dcc3eba963d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_nanopb.xcframework.zip",
      checksum: "82a32981df068e71ab949a6d6948a1cc1407ed7fd6d30cdf7eafa327b2762cd0"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_openssl_grpc.xcframework.zip",
      checksum: "c75dd893ffd4d1409ca99adf23f44da1c6bd8d102488431d5333482bdbeea775"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3580019d58163778b8795101d662bbade734191869d8c1c811976beac49dd346"
    )
  ]
)
    