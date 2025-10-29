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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_absl.xcframework.zip",
      checksum: "1490979189f824b0c1dda349f2eedf027d54ca87c3fc02a3e4b398bd22086f10"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppAuth.xcframework.zip",
      checksum: "5f6768601cd5082254ff89380472a1ca94654061a6fc67a01d18d55d95bd1749"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppCheckCore.xcframework.zip",
      checksum: "87bdde476d7b990342b56dc44a8c5915b5e141e57c3d82c6cf684f7fe30bd288"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FBLPromises.xcframework.zip",
      checksum: "b4e2202101e2b00a129d201755613f308d20a49ee50f472e91c1d5153d4c4115"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c88f4b238733880ffdf5a445478591040ea52d17620b6092fa3c00eab418bc10"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAILogic.xcframework.zip",
      checksum: "4aaa8c78d79c6f625f1ecc16bd2b571dda8fb6c65837b65676852f4afd45138e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "09099781e80518d01816f10d5e3ddb3fb96bc2b01f27a7be92f65628784eb985"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "2e3dbf2a2b5835cf723e2cdadbb86ab9fdf6b97e2bd1637a9930ced9bc278a2c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2af8d472957432f3802b5c82d4fffe01490ea01aea43c6dc117bd609708d817c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "1b69d6297cdcd8cfd9426d644bffdd510c9f939a3a54fc421bd27e6d56453463"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "aa4326de13064097f5dba5346ade8765a25e6643e37b16f4a1d5fd52328a8115"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bbd9c5fcf1fa1485c21f9b003513d828b4d08896782a17671e5524b7f2298eb9"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCore.xcframework.zip",
      checksum: "1b110517b856224600c7dd8c658dfac48a896a85f500722d23649d37d3691cf9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "37fae2cbe816ec504d9aec27a06d5186c0c51f390238ae68a512437d1d3b0870"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "382cedaeed49d95a1d9293c6e12c5f444529671c9bea759d4c59024bab8d75c1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "12499910b0b2fee15db64652a3db6990c9272492d8b3a90e1dd91efbddc1e5e3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "84a7dd0db6d88a554b08502a68c591130e2cdd52c8f7d3cbedee2fa073fcacb2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a9c06b84c2470715cb73ebd27431aa43b2f801292d4f449d478feac3455ed7dc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "176aef902fa0df1a6d99d77461a70d152141e38a9bd463cf2d8f8a96227cf556"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ed7c3369a90f3c4c64873182f7f0821d2fadd984ad941ed5d1aca12275df1bb7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "19e4000c4d45707d56503c01c372432cdf0d86d1fff1dd5268e57d677d864537"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "2c02e4dcaea373dd3d7d1284cd3fde5e9f27c77e612a1786f9858c166f44f10d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e491920528c9a1b637966e08b8ad42e94caea44dcf8ce8651e75d9fe8bacb4b6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ee06a1c1ca2bba81302f40ddc8d6e73c12199f9e781732b130532b5e81979d35"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0caf124d112e8f24b3f19a7ef72c7133376a4618dc075e2a2a2185828722cc83"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "f2765b81ce026c087e00362c857d47dc63bae91478083f10eb0464aad6979dda"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "54c6543a3218d6ca581bf14c4f6080eeea84c1877e6b362dfeb2300584f7a30c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "72119bd0483e010a31dfb21dc7647e39eab96a7f63b46dc36c28bde8b1bfc3dd"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "c8ffc107e77c1f2f50c0d85f236edee7ff7709fdac6c32c7c95c1a5ce9b9186a"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d4f903b76c1b8e935f39305b83c45e0ea0117d0357a8a1b3fc4470224e353974"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "3c491567bd4af6e804bbe12bd284591f2025befddde2889a0351283c3e625a80"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "1dfac7bc0b3160c0e077d9408ab178266577883204b1f4b0a380aa05630f7de3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "40f4f9509b9dc0104c35799dd44707383c0ac6320d5a90711bad64ba0a0eb7aa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ba94ee5974c3af965386c16ab1fdda213f1183464047a0d200bf0a41a0073a18"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4c03d9119e4a0e58d2d0ebea2c6d1068c7069196020d13e37a67a6997fa819c8"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "b67db8cdb6e8c3397001c97090552bfd8c454bac08ee394ec6afc759e22638d9"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "6cb9dd8a08043453edea189ed221be3815e6a2fa92c22c9f9af25752f54dbf8a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpc.xcframework.zip",
      checksum: "ec7328ffdbe444cd4c2533b4ee9bbf9b27539107b7858bca0407603ce5eec8a0"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpcpp.xcframework.zip",
      checksum: "dc5ea0eb89d164cbcb5f6a4392a7660bad0d3897e0eb22932d0b8ca346099a69"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "3a3b0ce35cc8f623f8437f2342559890a7b18c566b91d9884a2c1919442a601b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0a7dd8da3bab45b52e06e7400c826cf06cc14531d3cd0ea0111c8553da4c58c4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_leveldb.xcframework.zip",
      checksum: "e7222e2c97f02f5ba5354a80d7b0e17fd62fc4d6e6e6be12ba202ffb005396ed"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_nanopb.xcframework.zip",
      checksum: "9e8f0cd73136fed5f2d56e10eb93e845b151f8c6846c7b2365ae7678dab4c1ab"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_openssl_grpc.xcframework.zip",
      checksum: "01bd19473b5597d771e5d9370ac3a61211f507d5771401b0333c60ad8cc70449"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_Promises.xcframework.zip",
      checksum: "1b23e5692e917373b6235f27776c25841e27c8a7d19e7c7ae6e0eefa72a6a684"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "7c863a2b9b60f894de08669ae78367d2a8e80ad750549e9d924c5cdfce474d19"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b458fe1af70b91e63380845879b4f4cfc187d855d56cfaa9e9806d1787a7d758"
    )
  ]
)
    