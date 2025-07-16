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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppAuth.xcframework.zip",
      checksum: "6a13c795db07999dc82a29e4d9cdf5af8929079d79b6faee785826e7305a4774"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppCheckCore.xcframework.zip",
      checksum: "55c2055d75d74bc13c54f4237223331316246117c3f20fdc3f40280d6d122e31"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FBLPromises.xcframework.zip",
      checksum: "bac2cfc5819b63f7d59bc598b9b5dee66d7ce0c7de068fb960cc0fb6ff9cf4ab"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b37cf717864cc7fe5560b19fb9c17fc6cb1086fa85225f2a2909de4beab11c43"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAI.xcframework.zip",
      checksum: "ddef44d7765d659e4f4e8354857883cead780cea931f7f17aa55f35ee961ad80"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ce52d54e0fda1742fdd875ab4e9e918d7f7099e8aa748e9689459904da0287ad"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fe08842761003c6f32c0c8b5c70308adb45721a9534bd06458db292f307b7f3a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f0cadecf6e9d28b65e2365a051c6b4c36d218816159884dccd4e4e5bff00b540"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ac7436556832b9423d0477136eb608f8bac67acd2870e98697f0e412c28c66a9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "bb4ce3c488f7f7e198a2e4a31e477d152b4f8e34c165493863392c5cb189c1d9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "595dffe201a632e500277534a8ca22fe97e19db215f2e2da3858c051a35fea9b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCore.xcframework.zip",
      checksum: "dbcad3161a3b1ede0ee2f2f455b6dd40578c69ea2333a3f2156d6b622d2678fc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "30c01dc44dc9fe6143c23413df7297b5dd9f02c572227566079446d60574a2e4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3ef0561fc847cb188db72b3c46d1efd8f240417e08c299f276071942fd4b8005"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7a2904f3eaf9f226b6b0160d524d76c098fd1a67a40a5b490af250fa99aa5755"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "15ea17fa3127f13d642da74cf40b9226d125f520508707e2994c4275a4e0643f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "087a301c3cb3e3e9c66446943eaf3cbf54befeac8e7b6b0dfe5776154f182177"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "440c06c37b851b0043c8f837bcd54b14425077534d380a4a485e7f67d4600ed6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "5b19c5ced69ce4c2bc26297c5eb2bad6642a95fd13a459bc0aa06fdd8062dc2c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "edc4380731226c95d6ae3f502478f3af2c7958d187984a420637fff92288b299"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "eec05fb2906a4fc3b06a5d55bded72e9877f36c5213af5a9cea1da1916ad54e5"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4219b5234c049c3ea0a560c5ba9bc52a73382a3b0f7bf7c93faca3752c5ee25b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "dd45a4601b41f6580c68be6d718d643ef80dc7d289c0cbab99943816b46d5af4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0ca13f8ad0bcf1f935775f582ce0487e4ef3e483932b1c11d42d5f6ca7619264"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "ecdae29027edfd19c2659eba50c3ac36061e5035036cba63b419c14a397fb316"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "62739cfe598e4155ec6af8fb6b0b87dbbf470bf3e104b379b91bc38b6af6f7de"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "333b0ddbe074f9b24c9d624c04a669a1d702ac75f62a3f2310ba6f6a7e9e3efe"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "0b8a0a96c46adf34cb16b0641eeefaf780177891aebd49936edf7f9e8936e3b4"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "fdc293bf5ac7b5ed35c638f5626568586c1ee81b6449cd1e6cd60d7e7afb72b0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "2e818b89db3292be21744ddb146fce734da6eda7b40b13f3542d81f1fe976ffc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "0bf48ac797d47f2675ecdad395897235e145a7d0e5235fd2e528828540c806f1"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e1386f76a0e2b7d59d99c4efc6ca5cb3bd27a4925806dfc533856697275b40bb"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0d6545c3d99a89f7aa7c7da2a5218dda619543c8a45a6c3c45e938a310f47f50"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "22b8a74d0d1f6975b9e80fa5004da5fb2e32962d2c1ddd8083511bd96728ce04"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "66c7520fe3a66a1d1f91276bb8c051bf59c115b118aa2287393b44ba4b92a6e3"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "1007f74bc0f6d0132fa40b319d02f857da756b73792bd475946ee8fcb3b536e3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "3f955e84184e55f02df605b185af1ecceb5d113e9d5969df0438b7675f3311a7"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "528420f3941553c9573ed62b273b7244bbd1d1ed30edfe7043f26dc7bfbb1910"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_Promises.xcframework.zip",
      checksum: "0148bcb8ba4dbed4fed2276c221151269f9e615f1769dfa3a4319884b31ac485"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1d715d4053d637f94e5c9798c102bfaabf95915b1c3c29c948af2474cfa104ef"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d33e55bcc594d18a9f0a07b0e69f1ce236f0f7f5e96d81a6013c3e40a9c82ad8"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_absl.xcframework.zip",
      checksum: "525a87f0c965c33075f4ba1838c68ac407dc49f86e83c5d1ef6b840930f2a242"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpc.xcframework.zip",
      checksum: "648e57e1e2068809b7ad84d1acff07167fec373f3606abe61222e27c38cca9d5"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpcpp.xcframework.zip",
      checksum: "82ea93a087b074a0794f8ae7f83f53d6e15a1c842793d0f461d13840be2c6107"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_leveldb.xcframework.zip",
      checksum: "3635881484cefb5c992cbb07e7724bbae29035d5f43d95de862f174b4572c02d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_nanopb.xcframework.zip",
      checksum: "801b6c08520d7f16dd5371b08eb8babc4105e89e34a213f1f06ef33daa0b4866"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_openssl_grpc.xcframework.zip",
      checksum: "b73b043c68f99e53039a74ef19968e0b638faa1d586f6313dfa4ec563e3f9bb9"
    )
  ]
)
    