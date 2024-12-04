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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppAuth.xcframework.zip",
      checksum: "7846d07dc8d0fdd4501beb6271a55afaf8bffe41fc975e825abb2dbb7ec9faf9"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "471f7808a78faf0bb40bde001fb91fccae2fa65676cef0032805ff19f100c438"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "0e75c6b3422ede21d501f331a079ee5ed60399b27191e75fa1122f43ff105dfc"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "02f22776dbd833b6e519247fbc434b45b2428f0232838e73d655d8b76c17dd5d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "cdfbf6e23a4d6ab626eb66721188e736db2baf170441e6e62fb8bc6e24d7f73a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "6a2a417ad91934afe72654704538b70e60fe4fd8cd664028f7e0554a7dec2672"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9f9157c5fd8f6576c94bb6c06906ddc7c9f9d0f3f88676041b67a775736d2513"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "bfb4ade2de81b7ed7ad5c10a1f7c50685681f0aa499c228ba25f836113fd2eea"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5c55a1b830cd667bdc6f29f97135b377424a1ffad852fccea0d038a927abbf14"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "1e5a00d827d7fb140c6de533e24fa7dc6f5b0e072119357b3eb072531754a5fc"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "976b75ba923f6a8aeb07d7e36bed25c9f4458f9a925be419e1634efff44a15b0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "d792a1c2734d1736e8b799917c05d1ecb38fbe1dd2ecf8c1202a200d3969f7e3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "9f4e3a1e96e1cf273d00457690b56d5a41e4ab63e1c547c0e23f64457ee53dbb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "187aa9e0cbff25e1a81402305dff630fa477dd1d20687fc36b177285119e62a7"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5d0eb21a8788a0f3e66a0e41bf9626252ed9b961375ebc7aa5f0a686a6f3d765"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e7544fe4a042bbb5250e7159957b646cf52151919428d36a9017e74264c10841"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "a273c134d01fea38fba28639df1829e70cc9a12e0d8039931f78d6dfcb9cfd9b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "55b10bd3e5599ffcb62ffb257ed586ef54b446ac1a836846d117cee6156b1c1f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "5ba3aa91c96755df03b9a825e6b70f7c842e7680102f7b1bdfb0db9b5090dd06"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f0eea6da00e2002f6d6073c13d4a089969c37cbfe7c99d457932489ce07342b2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4a9841940959498f1c06388f6b01bbbd1bb784a6ca71d9ab5a01588c39c1ba47"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "b7beb4a4b1581761ccc58a80a65f693166a306bd0dcbca96542da7f056795deb"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "aedfe61c3f94fcfa8313bb0ae1bf153ea49a6d1277d187218bb73d8b5b6f2b28"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "10bfc49c30e58556f9ec75aef29eaf3de02d142583fc7e64ebfe2ee81b66da4d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "375c069213f4f1f89e928937c2e91bafd4f338adfe09a3207e04da7c6f37f0c2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "945c1e7ee2933f0d9c69a1ad0404797aae3182be206f9bbc2bc0e16437a31848"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "217b18d111d1e1e82294bb71a793ed5998df689c85f094e7e990329ea96c9c82"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "0a86b88585508d1039f5081d604401670f924b7008d1bb9d31846d3a672d4bed"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "2adf6a7c02cc1b1de0bb9e0ead487e45c7ff29c208557f315fb3b61bfb1fb72e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f3f5e0890fe762caca3224d1700f77701f180aee9a878a95d9c78020edb29ab8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "1280d9a347587a73ba98367b9e56fb295b2597ade48d54133be3f2083f32aaf9"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "626cfa3e6b9d849cadc575fb8878d95a9a0943aa32b9d732c6ad9a66436e48c9"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "6b67ab30e24360cae4727355f136f35bf631f0abea50459c67a1223ff608418e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1ff3781a5934cc29cd6ee73a287cbe307860c76cb91b0738ec8f9264e7a0cddd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "200b126e599e6aa580209d6982a4478e87bae73a4cc36029199607375742783e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0123247d2aeb1f58eb84b08901436ac5f3f799ad74a2182cb6e6fd85a1d1c809"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "697d73ad236d2f620ced621be9dce8452746f929c2c665bbd36dab46447e6e4d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bac4f53306d82326ff6a30d5e86c25ee9b1859bab39f29d66f0669c3727e8c9a"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "5a43ce8d69ab37c77d8a3bc06fb55a10af2df58f43efa635cd33d4c036e73226"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "d418b327456674f60fc828be61db2fd7c14e621e8f1331542ab24c0b1daa72d3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "8963a00761c9002e531aa529194d412d23dc514562841056e4e327fd75bf214d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "4c684a713d026e7272124553943c6ffc552c1d16a21feb8bd2a441fe655ff3d7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c8150e15843619b343c76b8277dc2a914b11d5c6b5c28de7256f7b2ad871071f"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e2adff5e0bb9277a637b65378a4f2bc1cd1b2c8098f6b8b708d47120e368c704"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b9d9e56187eb75238a73e7d9e0ad7e33966dca95cf3095cb92e88abba9de8b9c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "caa9a697954dfcca96b18c3ef6303674de515923ede8fe1bfc51ceeaabc1271a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "3764848b8fabe62c168e8fadc1148a9cb53b30214253e32fb02ea1252a51b5bc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "3a5ccc4c4955ea5e245a903800178ca10b46f99ee13a07008e6319b39ecf9139"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "4cb4aedc7fdd446250400383d46edf8e202ddfad67eeb3fcd0a9d12972b79ea9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "c5d731eb86ab3e3c0f3988330f59b3caf0aae4b66b1de5836930e0179732f661"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "694c661e86d3e36c8f93b98170942dab7e55ba45faeb0d6231a855d3d5c97690"
    )
  ]
)
    