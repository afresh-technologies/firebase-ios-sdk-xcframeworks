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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_absl.xcframework.zip",
      checksum: "df5a9cfbac291ea43b7f1eb599d320bb849bb0546e90f9321818dabe3ad8f48c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_AppCheckCore.xcframework.zip",
      checksum: "f45f79bad68ff902b147b9e8000317db21a45e3edbcd71c6f66ce542dffb002f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FBLPromises.xcframework.zip",
      checksum: "3c3e731e442f2e2f4242850a3ab04bf2bc3d24fd9812e27d38171d8f288ac5de"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseABTesting.xcframework.zip",
      checksum: "4a816f3f7f89c4aa638c94608bc7791fed839f0e6811e1cd3a882d5ca4f29f00"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAILogic.xcframework.zip",
      checksum: "11b03eacf72c25f4daee4ea427a9dbe39f6715f068b6fb1a1b7eabd21198517c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "af20e3aa3a6584bbfc73c9648a15eff1a3f429bfed6a721c7989d178e9a14b5b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "d509b094d029baa9d9380be05e5b307573eac10015ed1b1c424a9f109d5c01a0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8ab5be42fbf2f39390f7e7bdcacfff63e854ba20a2c86a985ebb2bb34a32f55c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "e949d21e4b64d42f5936c1ea67f59bfa4ad3a3c90968c93bf64d5077432a3afa"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuth.xcframework.zip",
      checksum: "eb337a0540d7b941eba239d524acdd52c9f906360e63d791fbc07824155f72f4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "a697c37a9bc06204fe3892beaf9ba2a5839e0f5d6e4825906c87a952e5f6c18c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCore.xcframework.zip",
      checksum: "cd6fbb1c4b04c9ff2f722f41d1dc6b4a38a606fef5a38fe748b51c42e49ebe2e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a539b43642900b181063f62f3faf16d62fd717b4f443052c9f6a412b5e0f01ad"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "e6ed6357cca1e50356c81481f8bb072f511ce1ba1f2ac407da191299ee05c3f8"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3eb4eab5717330e00c01bad476ff386a5c1d6b6c971dbac017926f1e892cadcd"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseDatabase.xcframework.zip",
      checksum: "72c6f3abc0b10c0fcb87f24278af9e52b57b76e17b8ae2f66427dfe41103d699"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestore.xcframework.zip",
      checksum: "6ef421ee4eb342266783572227755a4d3b0399e46e326c04267dfbfe8fd055d5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "fa9324110889a5b60cdb7a38ab52fe94702f043e48b91143bab846d5dacee95d"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFunctions.xcframework.zip",
      checksum: "04874e3b581e517649a8425c0c44471235ea9ef2bae6b9f470f59d376222613a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "be80ae55746567e0a565533b1403a3e3e37a9d152734e00a9f0d46249c859b97"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInstallations.xcframework.zip",
      checksum: "41ecf32e06caf0d270191d21d9bd52f04a1bf84847d593f5056cdb4016eed0b0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessaging.xcframework.zip",
      checksum: "aa4772b1b650260e950141cf7bd9a538bbd26b6e16a504c12034a9921ccf6a93"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7593670c4bfefba13ae6eecb024dac4a4b31586adf0179dc07841d8fcd81f5e8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebasePerformance.xcframework.zip",
      checksum: "5fff2356abba5455c7a4dc8bc93ef70cb8a3c09ff9983333343cde47c04c5497"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "41f430ca26e055c0208763394269411c11110197ee2223a54159e331fe0c189d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bbd39a00109655fdeb0b607ec7b029900937f614cbd70f29a0b4162b6792f8a2"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSessions.xcframework.zip",
      checksum: "091d7452142f51a0e1c0bec787b96205aafe5d1b130820e7c03088fc89f6e20e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2582b03f2926c8bcbec251005f1a3d19b32d54f5077e00b8805cc1c2e9d31111"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseStorage.xcframework.zip",
      checksum: "7f666508f33ab11e8f97d789f12f57b7008abf63d118a2c3ff00f87bd8015a2b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "70f013777ffcb9591b0d66a4cefddf6c9682717374cb504beb39a62b3ecc986e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "96753dc68a54432ac69a33d1a2d209b54e59942a74b2c52ee0c1e9a06265d000"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5319a4a5682153d82559a45fe0acc317593ee4e5308308be8a064110ac52ef52"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleDataTransport.xcframework.zip",
      checksum: "a4cf453057bd178e142805dce34f9c438ee48502c4f64f4410329cdc7957149d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleUtilities.xcframework.zip",
      checksum: "cb37c1148e874d94e2af2a3c850d91902007d66e17f181e011951c5c1f949123"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpc.xcframework.zip",
      checksum: "af111e184868537ad0ebffd7bb7675ff9b0eb76818db2d48d2975121c8a12d1f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpcpp.xcframework.zip",
      checksum: "65f61c3ff527f6c8e3cb48d1e39ec4e0aa8651c269755efd62f61074eef0f09f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "19e96cb26521a5e3d8101349c04315e8889e2da846509cbcfeedd84d3666b7b4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_leveldb.xcframework.zip",
      checksum: "c53d816275274f0e2d09ff19e7f390106ad7ed99a0d5b56e2d5934a48ca8d7e9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_nanopb.xcframework.zip",
      checksum: "5b43b66852c3a8eefa0e00fdb7cb7499a974632590d74110ce98b3f560a1a224"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_openssl_grpc.xcframework.zip",
      checksum: "529bdf33e4f55bf60025780dde326e92c30d58256a2601dc8d1c47cae0c2191e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_RecaptchaInterop.xcframework.zip",
      checksum: "579488db330479ef8296e1c666dbe60e5c6440576f6ff205a471245d82521d72"
    )
  ]
)
    