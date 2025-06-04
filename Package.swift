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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppAuth.xcframework.zip",
      checksum: "69d7bd94984a543bb1dc4d25885a51744c55bbfba420c5a47a08385af7f84e3e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppCheckCore.xcframework.zip",
      checksum: "f7505541dc3a4b49feef57cbafc32e33b1b9e52b5eeaeaa651eb007a2a4875b9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FBLPromises.xcframework.zip",
      checksum: "ddbea41bdfaf38244852267be2d5c5893713ca06c844ec5787d8f69c2e421eea"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ead594b0f1d435b1891b048963dfeca97d9ada69341ca17b8ff127bdabf1efb9"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAI.xcframework.zip",
      checksum: "2deae22fd20d4542c379ce9439ee1fc7d0916feecb615a5d18ac486ca4e811bb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "0411e41d5670fff3079260be5c1042ca76406a6caecf72866325271cfdf4c3e5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e54088a247f90dd8b909e91fbcf3fcf07b865d082619a3eac6ced6a6a910cb1c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "422e6593cc0d50a75195367c6ba5ffc85657c830e7c3cb23f8815e9f57691eac"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "48d27264e14158c340d5b606cf1a27172be3ba2d9fece01cdc76de0856f3e2d5"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a2bfb8b9d8c227105636da79be8875efefc9bf85d4131fca37a380cc900f5acc"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "c54d08c887a70d7e9a93750ed5230ab5e17849418e26fff51877a66a7ee3b2cf"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "47bebf9cc9639921ded96959bf19d7b22aa1994508defe0ffa493017e4ff26d3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCore.xcframework.zip",
      checksum: "fef120636fcde8585e35aec7d104e263319cf257f3b67bafc05f7dd4352fc41b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b4b1953fe741e6cbe048c009d1328cbb591bf02d8ca61c86002b4d8a13aa111f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8676326b4436514a2341eccaff17542d9ae5658a3b929850c7acf3482bfd6b66"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c83fb9f6d448f147a4c6470c52a8d043283665a8be27cedb30afdbb4e88db3b3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "ba7abcee45e86dd4d5e3c6b992b7a03a87f8b35ce6a2b0f9688f8b88800f9772"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "606236809979cd728bbfd387756a289a39f20bb092557bdb7ab39a6791f74a10"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "645c720810d1b69fdafbf71a9568bfd99ac2c33d515bf00895d7e818fc2165d6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "5f48956e0c0cc5712d6939d78e8a445eaabcd20d4ad01e03d079e3459c40dfb8"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "7fb2c8881a2f083668d1a4dcb7ca964f191fa8fd38adbcfeac488b2a53660edd"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "7c2db5dde904d954b0dc6358f1cf47862562e0b0d76aac1b662a9805479c1ac1"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ce27114648a4801fd819456b6e40f09719468fe9c35403617ef3a5ca7e6ef53b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e08309a47a658e3e5a91eb32f23a4c12ca21650fa843afb48b8ad29187051bef"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "455517d62107afb3530c3f183139d0308f8dc9fbb37d4afe6934d59375147916"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "83eccd12f133abbf25a312ce7df9a72dd2bb00edb21896596fba5194a144690e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "2e9628ef00eb2f6be5669cc627c74ed0e1c8afbc35dfa5c6baf2e43891348bb3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "506eed8aa144c38d3e808988e494523d12d4f05af85150b43bfae74d459614a4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2968d24609e24d6ab7d8ad0d40f2bc66ebc89a5e11977f7e454750f18a32c27e"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "8ab89576439a9e56a40e7dae3341d119fb3c450d44ec137e8bc5d8bdae4c1bbf"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "eb462d93e25c6c2fc51f56b165e25bdbd2791cc3352b837b8dd5d6a8271a1036"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "794ab8834374ed230a73d7f858109ad4f0fd5d3b2135ccdb93fdaa9a6014673a"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "8993e57d1613403f04d75ff283c6a6b5a53c6ef8f66e098ab1f84722a5b5406a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "6ead06abc71768f0a96946364642092e6e9601b7585ede66d6cb31439dccaee0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "34bbb77dafcec7fe454be900eeff35a2e6130ca083817a296885815bd4d40fe4"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "4b89eefd4502a5e9d735f010530815b88f565301a2871a4850749fd4950a65e4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "58e86a449a44a29bdd0c9cedac213be01841d9474a45e53060cbd1be6be31796"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "238fbaad4e960410dd0e0cd37d8ab689526553c73a8f06cdf9c3eed8393b239b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f220885cc2005477d9610233b45eb8f53cca976f8bd7095e75039eab58ff04dd"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4ec99019cb0a9fbfd577cd7aa2bd1c1fc20f7c36b90e188ee989f211658740d6"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cce96eea650a223c6a094a5a8a02ef028b246ee29b687b58ccf9e384b108019"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "c4a3ac9800b9f5e845c5a229569ac1dfa8b7de90e7abbb73f0bd69b6a389807b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "37fd4220776d8c5668812a708b9c664862d9046ca9b9268fda0aae0d8e2ef1fb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_Promises.xcframework.zip",
      checksum: "a28480bbf533c10573e2346ecf589fe573fe3985c18b3bc360a5a0c827f2eaf4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8dabd1ae3638c9aed9e9628e9c0949a0bee23fae6db71890137ffd98355f8bc4"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_SwiftProtobuf.xcframework.zip",
      checksum: "850b3f6b66da9afda52f19ba80e75a330a2c1132631020d49f958819c46d6e38"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "d6db0f82ba96022250f6381d71be79905bfd0ceaef3240761580beba15acc189"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_absl.xcframework.zip",
      checksum: "84c58a68910f8211d24054b7c333842c3dcf9044e7c91194158fdd2b6f1a1f45"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpc.xcframework.zip",
      checksum: "fa1b73897ed6d6e7dd60ceb1bf2baddb5cb53d765ca3896a1052ec8fc80417a9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpcpp.xcframework.zip",
      checksum: "570161ab66bfaa26857231c73357f764c898e947e07d15c667d4120ee89c8431"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_leveldb.xcframework.zip",
      checksum: "bc6aee3bbe9ec34d8c4e354cc7ef643fa59749a9e7211a1eb52357aa0baf13d0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_nanopb.xcframework.zip",
      checksum: "53f3c299642d424a7791c464402cba3bcb99274e0684c6d0395b16552aeb2047"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_openssl_grpc.xcframework.zip",
      checksum: "868144903550ca20f3cb31d125f8c3f972989f117eb3c5389a466a672fd3e516"
    )
  ]
)
    