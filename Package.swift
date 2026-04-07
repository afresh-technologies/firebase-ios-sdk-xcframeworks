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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_absl.xcframework.zip",
      checksum: "16d59b08b089b0b6b907399be8fa3e7228418fd19eb9dc643df35dbe501e1f33"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppAuth.xcframework.zip",
      checksum: "0aa7c716bb58cd9ec5093c039fa4de41679040d0bcb8fb4ae04cfaa22ced230e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppCheckCore.xcframework.zip",
      checksum: "8c99314db626a100f49efc7631fed9ab34e1f3b86014643cc706a3520fd1246b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FBLPromises.xcframework.zip",
      checksum: "5d4df26d2aefa9068a16022fd49a813261b88c9d1e3017786105bb2af03fd807"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "06dc087b766b24dead22834ba048bbc47380ce016ab652d5fb57e9b218b46ee8"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAILogic.xcframework.zip",
      checksum: "1d9155da6f70487c5a92da451965956b681fed866bffa0cade37d76cf3f53ad4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "dc4700d5f7e0734081f2d652b9a71cdcf46f0c9180c9a2336e451690995e6236"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "473da7df8509c8fa596d4b07e858911d066537a9a83108ea61e4dcd1239eaeb7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "74bfae71ce0196bc5302784a8be78bf6cdeba1e1942ac338db4025684ff92beb"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fa429d5a8eb3dfd432c6437443c9597f4734636e052fa59586fe8e73d5357d2b"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "e75731feab200b68d84e60af925f363208c3f7f8355de74e2e315ad159ebf931"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb2e2fdec5540a282a5d6a2e2a3430fbeaac2bef2fc317143103610d157a8b71"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCore.xcframework.zip",
      checksum: "455b1b7317eebc4bdf5440efd88a32a1c1c227068bcb3964c25b987606e272fe"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "8bb3d2ac80e6ed3f87e1d4fd8b87724e0f2dd81c5d98df0903eed26e33889ddf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c6c9df4bbe4638448f8b95ed3f194da84e2fff59d3abb36230d246a6b251b73f"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "bf8f3ef06a7f867ecfe790319da59f58c3371654c7ebd7e603f10db1d2ff0906"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3abaa90ce783b95bad58b79464cb1b88d50b9e448cdfc76d4745e1d48db2b68e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8b2d09a56b63ccfe0087235fd412a613de4685d4f0e4dcf2970d3be9005aa810"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "3475d557ca446f9dfedd7d63e9d701c8a375c0f1921d95fee8b85544ca430b06"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f71a3ff237be10bcd09a7db2ad99e6a0cd687e111a97300e158fad088bd6879e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c4f681726d83c14bf06bb45eedb767eed6757901be6c79ed816127040daa6a78"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d23e8cc32fe67a9f5410af1a15a62893c3ad9e9c16426a1680404e05ef0b2e80"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7472e1a72e335c509ada4d2c531b7ee60184bead01f9756131cace3e2c9b5395"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "bd24a046076757e3c0105011ec43c68948e36282bf84f30bcbc1645e1361bad1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "7a065eca1238b50122441c64d4a050db7ca08848222266bcf17804b4a0a26af7"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "863ce21a861d6db0557a1471dcdcc506ca2a24634b8d30bbcb3d6d2d97a3dc5e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9407d4999a077fb5d8b87bfec8203aac119109a70b9efd89db25555bd9a43136"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "5145b00c5124e062c7822e1e3cdc120b76d841a09fe65699a088467d314657b2"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "92de2319351bdef00aaf9dbcedbe6d57820992685cf14ccd4462eed90147a0d1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "363ef7c236755f0c46674ec6b1574f9f769cce7401994ea11c4323839ffa93a6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "1da7eafba1620b721c8db91ee7e24ef4c24fcd9a5beeaf07ee1f3962283cb5eb"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f3dbd35df576b8622526730c54faa6f554f0c3911df12eebefac5c719977d350"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "77175acab1390ffe122cf86fae76c8f684abbd63503cd576f6daf77d8d2283ca"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "9217282e33e52dd410a65433cd89c384f748404ac95ec2785edce69be785f798"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f5b770261e7d74807d68a9d354d577f04d3c8714d625baac1eca88b93c19dcce"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "6e705a441e8a2f63a5c5a9ebf594ef224f6c360e0de7ae7899d5cf16744f1693"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "f1fbab029bb149145b2e6ec2d5b7034dbaf7bcd1f8c5d32b805b692ef1299f46"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpc.xcframework.zip",
      checksum: "7663b49f46015f7098b3689585996f840c2f48d7f6ce6ea7f08e1bdf56d0f0a5"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpcpp.xcframework.zip",
      checksum: "65fe542b8a009e4e9a00a5e1cafa63158f1c849895643d1477c1a852b2531533"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "dad9df00e76a6549867e28e57c54e3926f1eb56f52da21251de6807483046ca4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "fe335ad2376fb68edbfe0da65c411d3339d84aa202a7c08c5123ebfe08c48ac7"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_leveldb.xcframework.zip",
      checksum: "a7082725dd448d6c114a5d01a136fe9fb83e036a1ac6f4f07eaad8fe2e6b9a2e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_nanopb.xcframework.zip",
      checksum: "3a8213d0ecdff972b280acea7b137bb09298a0b6927314761cc9f84c7e6e867c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_openssl_grpc.xcframework.zip",
      checksum: "a6bf05833ad67e2680cf39c76669edf6254bd5ccfeb8745c1614c3fa60ea98a7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_Promises.xcframework.zip",
      checksum: "ef978f8b7e6612606dc8f19729a0de646df2d919cf0dd103dbc969c4fa31ec0c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d77ca2bbab810b7bdd62d73aa81617952d4307e26d4982888e0f50e19951ecfe"
    )
  ]
)
    