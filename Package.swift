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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_absl.xcframework.zip",
      checksum: "73fbf1ea07abac3a27d54eada3f82e1f56f64092a61fc17d0d48084ffd8d4203"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_AppCheckCore.xcframework.zip",
      checksum: "077b2b30d8cd9ea27472ce5ca25ff638ca62b0b901985757535c7eb874e0ce75"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FBLPromises.xcframework.zip",
      checksum: "0ab58ab9e754995bcfeafb3e13bfc417a8f300c1f34f45730d21ea4806665c44"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseABTesting.xcframework.zip",
      checksum: "0ebe28045fbbf71fec44cde9bdd6e375aba6714f2a48c48c751ec7b3298a15e5"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAILogic.xcframework.zip",
      checksum: "a82eaaa36fba19d7dadf6b2b096079ee7154bab4bf875d7ad95065c29e8af39a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "a0e743319be1fae37675d73571efd4186fda57298cfd1cfb6b73d62d6c7fb5c5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "6b74e6270d627065b39e737068c264036e8a4e31b97c7203de88c0b59a07300d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6669ee9b596e1edbb7d4092e0abbec3c7d38c6449a1400fdc727039fb5b02fc4"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "1dc9233dfc2156d8cce98b960e83450cb81279628e0546aee3557aa6ba09f3b8"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAuth.xcframework.zip",
      checksum: "0a5ec84ae35f77efc24ec396d5fdf5d2a51f334b2313c902911294d35c863053"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e7b505e0a0bd969c17955f221b11c5d208aa7c7d391cd3982c4a676ae4b20dea"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseCore.xcframework.zip",
      checksum: "c48a0d07d5a0e8f1cabf8056779c7794fcdcf78d2f66d9cdfc22a0c5f41b5f51"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "33fd60ec190af5fe2db57a080d7727c22f8d2e0736539564063b2d1d9dad3356"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "ad3033642723623d693244d686ee534a0d324b04b1ff4e8a37fe1daf4de016d2"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c9d470859b1a88be9e14c954bd83f8e7f50fceccb7cec0447d3481c7be48f39a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseDatabase.xcframework.zip",
      checksum: "d3a6385d4369286cb895ce1b64d37b41067f868c160590d95f8b37a4d33f8ae5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseFirestore.xcframework.zip",
      checksum: "187c71411b59c64b3b80b3fad6ad75b85e6ffb4f9363484525dd630d5eddc259"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8a93bf32a52ce3b22f5a61f96d59b98bfec76a23140e25e627b1736887c7b4e2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseFunctions.xcframework.zip",
      checksum: "cd2eaa41f37dcb40c3d35f4fda4f3f50ba1a204522ab61cc8258d9086194df14"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "d4ae6d1b778e393b9190856fbca2989cbf361652a01df61c5154e63108932258"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseInstallations.xcframework.zip",
      checksum: "4cda2a7f16d9b3bfeffbc62956d34c82d6d68abb6e5346649c9b7a902766831b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseMessaging.xcframework.zip",
      checksum: "dc498c7f40f75c3e8da8a2ffb4630ae5886657b24a01eb252003c4315e7c316c"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "124e747a798e86793e0a72127506f78c7328fa4c77e220105f5abae5c570ef70"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebasePerformance.xcframework.zip",
      checksum: "66d23d05180d5475507f8c2865a59ac6483fa513e8100234a3d99ce8cc941ec0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9e3322748058c0ade2bddc98f983414f200dbde3f6ab9b3d1accf9b91ec9dcd6"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "635357aa8301edc9b2314c2608203c78662f10478fec9433def1bf3c3b4f4edd"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseSessions.xcframework.zip",
      checksum: "d4591617dd957644691a6c0eb56e9b13b9e651296934899b72a631cd6641e27f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "990810d934b704a321b4e6787e3d80d3bee4e44eb1dfc0b75548742c65321b71"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_FirebaseStorage.xcframework.zip",
      checksum: "2d9bad7309bc2f091c9b6454f3f0dd2bc28b3755593f9210baecbdde8ab55fab"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "942034a316495d767694bffe60fbbe745169165c3f33ee30d40b13de8906ed97"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "580acef562c424237a139050e9613ddb6b322a28b9b8f2fe3b16cfa38a6eeb3d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a8c7569663fc37e650e122dae26417a52b5329d65978ae7ee54bda2e42361dbd"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GoogleDataTransport.xcframework.zip",
      checksum: "64d41a345741da863c8370fc6b3ecdb0faece73a1a313a5a14e5079d927d3c45"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GoogleUtilities.xcframework.zip",
      checksum: "374b79b7c0cf0f84e981b7d00c2ed000e0cf50d4018af7d4deb1cd085545e3fb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_grpc.xcframework.zip",
      checksum: "85b4cbd5f447793d0d259cf99490dc5c4261feb067826eceeaa0df8229efb6ec"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_grpcpp.xcframework.zip",
      checksum: "4fc78748bf99cb736d86d12352ca2c192a305aeb338d1732080c4934c3f9cfce"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "17725ea061f362b08205be4f8d7cdd84375f99981ed8230eba8a27b09524a14b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_leveldb.xcframework.zip",
      checksum: "56341ee3315a6a36340a73d2f81b74167552f101978b804e7384acddc5517dcf"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_nanopb.xcframework.zip",
      checksum: "94c8606b881e20aa39045ac4632359cac3e2e17560d571a79a6acf9fee8eb0e3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_openssl_grpc.xcframework.zip",
      checksum: "816b64565022d8126577ebf1fb666930df3db7d96a0f47200236a9beaf556f9d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.1.1/_RecaptchaInterop.xcframework.zip",
      checksum: "7c7a6841d8b8b4b54ac357a0a65ad884e0beaf1331470f71f6319db60f967a13"
    )
  ]
)
    