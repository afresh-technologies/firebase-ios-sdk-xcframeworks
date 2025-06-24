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
        "_FirebaseAI",
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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppAuth.xcframework.zip",
      checksum: "6b6b4dcb0dba011b75afd7f31c00f3b15cdd909f61edbe7c61cd94e5534809db"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppCheckCore.xcframework.zip",
      checksum: "15ba9ec9cc181e2555c6456c1fc5657504594bbce30c9dcf8b132a46fb1d182e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FBLPromises.xcframework.zip",
      checksum: "9738dab91b076323dcd2663ca2e7f5db3e46e479f5dcb14c2cb4e79ed82a4934"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2f14dbbb671aea8e537c08dad8110ca501fa698830916a5cfe85dcf4dfcf6e9b"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAI.xcframework.zip",
      checksum: "bee40f69fba985b0ce91a31e4f50841d7624deb5739b54f9c670e59a8eb4512c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5ac70104b57f073c71d8483d2907e9b41be26faa35a730b435413e08ca7bc60b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "2b80c18a7ce926f137c5f9f32b7c3d9aa5143fc11b0d1574b8d67db04e1d830d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "a249e86d0166b6b2f368a6fd7bfc280d350c8cbf5f29c459ddfe948010b9808b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "00658bd268e256543f4be0c5220f99276e01869d176db598222c865b8d527f66"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "77db06eb9efee98e27416dba885faab1ce1155b85ce3542154360afc091ca1dc"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "6f8de22d45a4ea79e040a951e4d6f9ec99d603210cc22333682ff5f69ba71f4f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "858438c16fc92e853f4288dcfd6d324943216064e72638ae235a7409535f37c0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCore.xcframework.zip",
      checksum: "b88bd08637139eaf4d461ff9b647a0ffef4b84bcb673d6460c1fe01dc2103b01"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7368b29f48609c5e898716ff006acf6ab217efedc0ef32bed3d79c492adaa48e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8c02adc2c93b559e7ecaa3054f06c205721111163ea08425f19a9a6fefab8974"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5c3013910a0fca18131b3d945c5cdaf168f3ba0d4beb68fbedcda02d4c450c7f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "21d89c5414b2c08463c21bbd7c56c908bf6ed585d4e47c0ff9818bfe38da65e0"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "0050d847761405d7538ed15f7a9b7314e77ed6f92bbddcc1f02bfe28baaf04bb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "63690fc8521e6737da9073fee2242e10b846f68752c8af4b11e69f4277f50cc5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "9fa1969483de73a481e04dbd3a2b67df5e64332c9774edce5971df93e0eee91f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e31d992918a3a54f28bb7f834f9633030d9d6a8cf268ba5f0d43ee33e9d7865a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4cde0d8268057ea41a7bbdaad298df0a05ed8673e6cecb1977f6bf573e721845"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e4c49134ff930c04e1b7f4c237b8d60893899ba39db36ddaa911c5da9b225083"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3407d084ea6b1ec1445d1de46dbd2e8bcd43cd64f9ebc35212441d4e4b2bf2b7"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "dd0293139a0eefbe377ec985f7794fd8b439740c5dfaa26e1666cd74e5dd633d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7038c061e75e3a4fbfb92ed02e020a6b86a98afe86985654a2b5ffb2ca6fb048"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "f6c8e978c2ef9d0805dd39cb487e2e6728d7d474ede5cbcdf5f61c2c78c43d6e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7f9a10e0b624f9b4c6eba1b723a077b41a1432b76775825ac8821368ff4c6ade"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "62e6174e43a7f107327c3a55323426e6fd8105e55f0e6481c05a5466b27d8ff5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "80d081f2f016d7d89dde963f99f7f7ab21b92ece7b07f82e2e9d3c0e6ad7fd64"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9735f141e435349cf23c6337628411ffc9cb8ce9504842c9a49ee84a409fc498"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "e3e1e6a5e7faf3df202198f7bc0d2d0c8d8498365364dbeb821b9601615e80b2"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "896ec7a6b931ace46edaf83b1e9e2fc01e2fe825db800d55f22637073a3a5710"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "0112afc527664df462c84099dda29875c680e87ed81591a140ebb49b2ef46f1b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "24bcbdd32ee19cdbb540e80c5c8c46fdbee98a22a83afbd4cf14a32a661b4b20"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "8d57c1fadc6799394c5b3f9d7cf1590c8810f794272cd7dd4b1bc5ed2d4b26b5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d007b50e53d48b79f3c9ea00b674e2bea38b90c632ac5df2c76ad8806bdb48fe"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d1bbcd4dbc40d1c0b39f5b752350d924f397120c7293bcb41b6aa386413c1757"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "59c792e7a62e243bafbc03e5bc26450e6bb7ef5935de50d388256094cc1ab585"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "89270bf20bc77a3f4bb9001975ffeab00b482c10c5366c63fbea9909162985ce"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleMobileAds.xcframework.zip",
      checksum: "079612c5a56322d1554a84d03feb32b3f7c7b6f9f217ab9e8a417a44b5a2a740"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "ddf751f442cadccacd322f1adfb18ab2ee316c4b122643692979fd00bdbb2eb3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "6c636cb0610583c184ad986f5cf8e6d00242ba93c0b6c3ba2360b8e73d1dd39e"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_Promises.xcframework.zip",
      checksum: "90d4b56b179a5ac14eb263be865764be744d0736fc6aef46ceb42196dcd92c7c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c673a88471612d594b70d824b2f6700e8b7279137ee239815c2ba07a19898e6b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_SwiftProtobuf.xcframework.zip",
      checksum: "4bd399fb34d5342e8e0d83ef0d1fc313eb842dc33f2e2d852c59e5f4c7428267"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "5b223925d5b93efee3f9645c9e3eb93edccf2d2d32561f1bbce82bc156258413"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_absl.xcframework.zip",
      checksum: "5f7c5f2a52a4fa897b2bb2fa4579efffcc3c83fdbbd7d4e84a8f5a6a5b8bfa68"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpc.xcframework.zip",
      checksum: "689e855893829557cdb36321ad6eca7565bd6289de94120a4a8c69dbbc9b4ac0"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpcpp.xcframework.zip",
      checksum: "c9c7c63bee8d0ef1fb9eac7e4b5d4079a0164f62d34c659be6c1fe20e3045735"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_leveldb.xcframework.zip",
      checksum: "217e9cba653aec0b1305a24d98f082d5b8eeada2a3499d9d9ed63c0a9d48b1dc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_nanopb.xcframework.zip",
      checksum: "2db938a1308be5b9c71bc60b52b2fd26e15d1412b208361ea4297baa25ad0ae7"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_openssl_grpc.xcframework.zip",
      checksum: "7e8e641c0e714df0658cc91c34cc2c93224e12b83922d98bb1b2a4efb7bb7358"
    )
  ]
)
    