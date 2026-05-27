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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_absl.xcframework.zip",
      checksum: "aed70f90834d40b597d750f094e820f5098f45d1cf411906609abd4f6a1a7c64"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppAuth.xcframework.zip",
      checksum: "bb8cb6cd82ab5da033d7e7977831acb095f4f609c4c8e0777389e47303318343"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppCheckCore.xcframework.zip",
      checksum: "58e25ce69eb05c4fe589768c13e3bfa7567e8c77ff718113fa8e738d55b736fb"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FBLPromises.xcframework.zip",
      checksum: "6fe60b6f8c443da42f88a85fd94004145723ab6329f1ae99667902af2e3bfc93"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "62e2325c459f019a8698bdee17c6eddb23d7a5121b5df9e256a7ba667bba62f2"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAILogic.xcframework.zip",
      checksum: "75196c45c04ca3b55d71912d071c67de2c92466f245e90a21fa7fd4e5a6b35d2"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7d40bca0449f22af0d0ffebdc8a915a6d26bfaf5cd42a6849734bb0ba2c119c5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9d71aec7e157cd648cd764d680694d66408c0a087674d45f28928ecd479c961c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "adffbc75b09c00801ff23cdce7aae4cd85ec70c2f668184efd72c72e9505441f"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ae4b144edda4e77ef96c668496ac722f6f5be736188567e4ec39c6a7799cfb05"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "ece8dbf562ebd134fbbd6a43ad7a3fdd1e38043cba06555bfcefeb9edd13e213"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d47185e26b833b04b846ea1c2a48ab8746a33e38ff28500163bd33bfbb0a9a1a"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCore.xcframework.zip",
      checksum: "49e7a3c7cf2dd92bad9ed9bb0256f061e94af89b10ea7eb5b5b8a45748ed3b30"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "9e6c77b528a37a03d85f3172c80bd40ce7dd9c4f7bd099144e6c9908126cac8c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d0fd45dd5999dbff0d514d53260e7b0ffc820448985e867c6d1055d46c3c54b7"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a436f88b44c2e0d8dc2b5467f1365f95b6d86cc58a129d13efb4ec822c1d1b97"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "99c1bf86d2d780418bc3f217ff3410000b3c7362cde59abf77e3e10e9c0b2211"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "c8a0c41eeaccee94fc71ca800383ce8a87951694ee032c05e837b7c3a23bde74"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a53aa00f909a8e4c67fd51ff7060c2515d5d191039f7b6e1d04a338b98dee2bb"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "921209121f61393d6206e4d9ccf0bce5021c9936a1b8ae21893a23509cb25741"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "3e547f07dbf5813c82c056102d2a78324c23f89e791749dcd7035640f0bbae8b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6f1b8cde99b8fcd998639599d256b8c548880da5b117287748b2f38a1d2723eb"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "dc2e49a1e16635dbf815d8523bb0b3c272d3f000fbb7615c2fe1ea985c84b751"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0068d11edebb2f92a7d3674c46d617543a52db4cee0554b15836fda4d81050ea"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "abde304de3fc4b13fb4c50eb50580b0a1ea4bb88b3de7740b4ba64f33babcf2e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "7c2797883f9dce8547cbb67ae3cfe8f06c733ee2a7574f825a3146c41810dd6d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7ee13d80eaddb49184a4a3d0b9fb5b44e2b719e9292de26d06992f77c71e696a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b3a662b44e6c32ad6c574ef836fd8cb67469ed6b64ad3e08a16fbd6cdcdb31aa"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "dafa2de5be7d518ae605e403b9bb6f7e993d2a7fc321e7d62761024f6c05d58e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "906140218aceb3ae9049232be4f13039d089bc2fa9346a2630f9cb8898234fc1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "adb73ded851840ae46fc8249c66a7adb56f3c361dd4ac1305d9c29c4ce425729"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "7517b650021b8527228746a55f7c41c5dfaa8df50db5e1a3bd9aec09246239e2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8a681a4b1c3bedbe621396b2926cf2ae2cfffa81912cac408e4a2368cd4b0a34"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "25c17c139fc2a9fcfeda394d8ec31739cc7e4c28ed15f3588ee8573093cc9cb2"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7ab53cfe1fd4ce4502782b81074b51c377c31e5b5ef9adcb31fd70e0ce861c3b"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "59a131bfd776639b25ae7eb391bd9aafca01ee7439e2dd096608e3443622a642"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "247740777b6e69ba8591f7296796106b88bb834a4b3193d04589d3496d7cd985"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpc.xcframework.zip",
      checksum: "ad1084f529df7277633a948516ee1489cf7e2f62eaa05d1c4eda9bbecbfa2451"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpcpp.xcframework.zip",
      checksum: "5f0ac02c8a292783a167c89ef8f10234176efda7598ea521b8b30f0057930d00"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "d4fcbe274259a88db58e72beef53fb6e825306c6a5e82749bc44afa252128026"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "87d020c96a76e114f029e1c47c68577ae36c6fd128d1a4bc72cbc863cb89f776"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_leveldb.xcframework.zip",
      checksum: "59482c47c3457316cae172dadb77d894a89f3bbb57f4bab029cc9a22cf7d3bf4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_nanopb.xcframework.zip",
      checksum: "2a9f1b45e7bad2f7b27850cd67d598739e884e8c3af27044ee9d6003405fe2c7"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_openssl_grpc.xcframework.zip",
      checksum: "ff272f108ebde51b7d9a0691585c2a197a859d9b46bca4c14b219bed40823b81"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_Promises.xcframework.zip",
      checksum: "1e1d18eefc4771395960ff5e5e6ba88cfa928bcae4f56adfe25e59763d522e67"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "7d2e1e40f529749946e90d8fae743320c5dbfdbf3ba9c2516c0732513ec6754f"
    )
  ]
)
    