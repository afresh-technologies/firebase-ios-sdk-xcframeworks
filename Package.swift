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
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
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
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
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
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppAuth.xcframework.zip",
      checksum: "f657847e651c71dcc3d73a1fdb2a77811daaa88caa47010a1c103c3584576659"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppCheckCore.xcframework.zip",
      checksum: "ee5601702c458c34007d9028e2fbfca3f690951dc8317a66fe27ee8c0b798f3c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FBLPromises.xcframework.zip",
      checksum: "e835d518b0a284102debbf1ee19e47a4470574f40ed82a048844c49a93cb982e"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a64cd2490f6d4b865b4331329040f78a30ae386810395393d4b060b07c7df93b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "1ac99968c83e21dc5dc96b324c69976d17e52535d2c32b58fc5f49d11477f610"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "c91c967c4b79a70cade914682b8ba94f62cb9939a5b10d2d323feba06790e784"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ff7adc928402a622f78476e69289cef5f6651d7279b9cb6bcd7fc41552a6f940"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9e07af6a273c0d36e82f77a720fc34bdea006a38d20e29d9d967088bf7052ffe"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "1f657ecaeb87765a17fc20575ed6508d61908d811ffef5aaefe997f9163cf784"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "947533ecbfa6a62cffee0cb11279b54a8a1556c67fbc0a1afc82bfd6a5e68aa3"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "be29aac44eb396974bfa5d5f82dbe87b279b2cb23ad9d2fabbd85889975db1d1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCore.xcframework.zip",
      checksum: "2f31e8ef2639b397340f3ab96630f20376493c3cb960d403eb2b4d9e05945050"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "42cac5f6140c4f2573b03a7432a85e76ed3c5178ef11f87408c5ff95993889cc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f75c3d89b03e4537b35a8bd178ce45a2ac1e2e20f900205136b15c3aa8583a1b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "1d3e75ee43dbcb6dd27df0cadde70af0c6de63b21e406a793f665dcebd7374a4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "2daeee6b9b583c84cb11be8e85b26674a5f6f73a596ec9212793a2af7624947b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "dba730cb2752ffd362532f328fa82285ac33dc437dc9eda2b1a6b738d523a573"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d454e5e5a53b833b9462d5843a0559c5a5f9feee859baaaf74d95a67dadcddbb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ef921b2e222f30e15c51a02ae76b1c5006c7753c866d37402eac7c5dcc07824e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "5c9437dd5d482fb3132d5772247087889fa5fb7f631055242a268cd99ea1ab19"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e97a271de4dfba4a335bf86f7e862b3142c296566fe35470dbdba2bcc26c0e8c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "f2d2584a80eef011cfe8edfa1daa3749e07adf74307fcf7fcd03440d6982cf98"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3dcb2815590a2e85f586ddae33df09246f3c764070467b2589326d44cb0729bc"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a6b5bf4a1939db96e93d777f611a08bfa09d2da6c3883c4c2c22d20f39d10a1a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f77565909903313e8eeff89647ef2598c5db0862550a45547800b548b96b952b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "26e65c2534e21ebc6893019caa57c8839b3b402d2152a3aa43feb988358c4778"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "fd2778dac42dbc357e960573afecd5f672e77c3f58c900941bd7fcd2f16c5844"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4313e2d2280bcb525f1d742ed86045f9220480998550a956783d906d423a71fe"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "cb24c0cc2a2bc7bca7a2c3081514df5e3f07239f325fb9c1736f7df46ce7e62f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4aedf5f06148698ee8619eb5d2cbea14a07c02b402645672cadc3888d87b11c1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "6e8ffb73b73372ba5279d023eb2ae3aad57477720a138be38ef362e0725e4620"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "1e2732b62e51e2853c3ac1634d7160bd9cbd3c3e1aa04ec63c172ed48d528e35"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "e9bc69a1a3bab87428a7f4e883f780f8afcbc4754b01912b75b06d7c9fbed98c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "be948c800fd859dce5b0bfc802752dc1ede3887b86a6112fcefc402fa3fbc123"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "975f4fecdc68a4f4d234334d2f492edd34b28776a5f9593be8aaa0ac464330f9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "46353482e1a55a91ba774679a3bf8bcbade7d56120f926de4c4cb387e7f115a5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "79a17162e701f341525ccd015b5c6546faea99e654e32473156faaef381cee4a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ce651402017c34d32695faca09ff03deab55992434a09da98460f6a0698ca95a"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleMobileAds.xcframework.zip",
      checksum: "c1bcee2105845ee94349e5df17d3f4e1cd1fb15ce01b935594d9530230b8e56b"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "4523ac04e3a22b61d51b83ed8c9822d14e6b2d7caaf71a5c0aa978d10e0d4502"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "f31204175cd623644cdc31e4a0bbe2ca0c80c892f21cf17e716bb4fa1b529f0b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_Promises.xcframework.zip",
      checksum: "591d1b24a81808d7d66a812cf69077c10cedbfad3c176975e7b7e7a7233c7b74"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0ac4bcff8f0bde02c6b30ac0d3308c202a13c91af8e00a004593d9fc1a7c6bc9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5edbb7ce0c7b65e3e789557b6078666e19cbf7a1c5841fb68dfe0bd0db9c5d96"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "93eb91ad75bdfe1440ca28c7962f45b4f4064e09930e4d4974a849148706819b"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_absl.xcframework.zip",
      checksum: "2d466867449fe128cdc3aae529ae2a4f56e289f64c57218631e6a514aa674206"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpc.xcframework.zip",
      checksum: "6811a38887469c748508580d549682b28b966594fc22ff8fde48f7cc8e7f07db"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpcpp.xcframework.zip",
      checksum: "bf90ffa54771721914d7b5ac81aa41cd788442abe2cd1b2cd8a73e65ea19a721"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_leveldb.xcframework.zip",
      checksum: "05da2416f33ca789f7e364115784e0430d3971b605bbc91093691e0ecff299b1"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_nanopb.xcframework.zip",
      checksum: "36f80f6e58f6dd054d6bc39657c337747cc7dd01153acd6d55488e8a446ac764"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_openssl_grpc.xcframework.zip",
      checksum: "46a79d386b97e35b5cf3347bc5839406e3e051b82294f0892913e2fe56797c03"
    )
  ]
)
    