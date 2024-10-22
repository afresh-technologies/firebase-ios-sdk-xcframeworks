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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppAuth.xcframework.zip",
      checksum: "50aea69322d2354dc92acb76f529d6f508b31e02a41bf4f3a610cefde8c13208"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppCheckCore.xcframework.zip",
      checksum: "41b908223f57daad00a2091b76ad19050fcb3b44d0c8bf561e5b46db18507a44"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FBLPromises.xcframework.zip",
      checksum: "cf046ce7c81f374b02531b90eeb6b4c64a022756dc83a0628e7766caec6eeb4a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c562943169974edf13931b97f6d69e0e598060156396546ea7eeb687cfc8f51d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d1ef9dcbed52b6d0bbf78063ac8221a9eac5487e6e60b25fcea62eceddd9c99c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e0c9ef4a08842275284f4233913790c89e204f7adb1bbde04b9b0651daedd0e1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "11787d3433072ca6f2e03df88b1f22c40fa676cb426513d80108709815c76764"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8683508de665598300b3f1be5068b6dab9403bfc6144e4565efc2abaec7e5464"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "46e87dd9ed5dd0f3bddf99cc88a23737c9ab53227a52e469cf0b6b52c182d5e6"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "8a028bbd28e77f145f89195cfcfbe079477163d532dceef9d7204a4820dcee44"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b4d75be7405217516ec5d0897e07730de049ce6445c02859a8b22c9fc2ca80fb"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCore.xcframework.zip",
      checksum: "b82f04890dac18d2ad3c350cb5d45ff0bd979482cdb13baaab2b185bcc282670"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "54970b329a0ca5e27d588a4414a14ff6f447800402749a2069025c13bcb47f01"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "18aab6738e9c585136eb0867112152da053a71f6b960de9d6df511b6fa4edbf6"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a74e5e68ac3bdd656272850075b239ff0c33dc603934d69fcc34d81d33e7215d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "1a54c01d550cd1727c841b38eb4d397ba0f79c63384e27ea89156624b45e6497"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "bccaaa4655d4d2b6244e86b8ace1684ad8c04c72121ac492e235552a733926d2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "cb7e268e3c64be918e1686f0329474b2b72f338bde97c075e12a2e403df47469"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "0afa255aa1d21a342e2249b0a653672d96cc046d43586116fcd4cc3c9349cf55"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e1d47d8000753dbb1d48ce120f36ecd45401c34b888426ce350314d8d7ad5bda"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "bd02b53d7386625746bef9cf254752dda3c0350168b108f30b87552c11549e6e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "cd8c4b3f825fd127c13d9f925f0b8470ccc6ef7b2cf39b33ae08a101e0b2dbbd"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c1482d8def407446809628047c9a200050024afd6ec80c903e6410d9c8f69afe"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a3fe1d98a3cc4aa0a3b37cbe8cc6f1141344d2660953f8eaa25b77a8902b720b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "27a460cb66861bce42f22411dea11f38bc652c0b963f4d28b4f0c98403006d7b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "40035242cdf34d1508decdac27328619532c7e4ac48a430446e209862be2224d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "92b6ce783c7b5357506c2d4a73ef6d39094891cbe2b859b8edef9ceea7f167e2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "9701e34832ba104f8ed746d4bd32ce1d94ba866dae5df8beb5a0353e62e8cec7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "c5e05179aaedbb5dcd7ff62c8e5d387af4f628255d9520086e8bbd89f604907c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e8782288a33ad37dec52c3db89e7c03ee710454c537e36dee21c206328f4ea4c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "32e07e6a0e869a0f4de3a8239263839f7fcdf35282b71b2f2baff8a9042b5db1"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "b94639a243890e7324ff1ae4bcd316e204e7759401be5d2241a2eddbcc8f5b26"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "424162397d0b252b8e650376cdf8452f9c3eb732a5fafb08797751bedc4299cd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cab2d309f03cff1e705955fccf83dd1bc1e7b266ca3f767532baaf6ad17a5225"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "88d252312302b934a10c99219abf8b3c83f4b6db1fec5a3c23e08fbd3f08b003"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "85efdc50573de5bd0daee4c6335862ccf1b9c1b8309c07000610cadef1de48fa"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "453ec37dca3a00fd55d4470da2992629850514690aaf4db6462202da060d349c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleMobileAds.xcframework.zip",
      checksum: "409b27fd5a5b27d7e1d603d78ecc0d4f0b9ac061a4d4bbafcff224d6bc9f373e"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "5ad4203cc0d28b75e41fcaf5fff4eacd2f609a3135332f46d09735b37d3301a5"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "1422bde62c769eaba688059ccd42afa527ae3b5475952f539bb83304745caa9a"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_Promises.xcframework.zip",
      checksum: "5b4f53fed03d3e08baf5578dc24d6635411024cf33123527531a7da5eb37ed92"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "4e09eee2a593d1a1cf46228455013b5b62d8f218e15954400a12cbfd8f2cf3a2"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e8f1190e38fabe851d7838dfd2eaf33e5acf47b0c0d3075aeccf8c8157b59758"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f7225b2b458795265ba12e681626b535d7a0f740a9b51e9833c64f1c8831566c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_absl.xcframework.zip",
      checksum: "c379a17f400c47e1631994c3ac1d580a6c3aa55e552d2bb72b20496d5459922b"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpc.xcframework.zip",
      checksum: "0c5257f63c4c0f38267061d626638899b79279a4145215894e1aca3eb17bf2c3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpcpp.xcframework.zip",
      checksum: "6d62be2d261ee8856e61209c118c1063d9d7121748076747382e3c7e51f49122"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_leveldb.xcframework.zip",
      checksum: "0f48e66c91bea1ddd2f6f11b681d6295eaa2488690d629cc13ba5c50a157a0f2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_nanopb.xcframework.zip",
      checksum: "3debcdb60503ee92250905f927abcad067e4b20d505b2e55becfc277072bac60"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_openssl_grpc.xcframework.zip",
      checksum: "1fda1fb6b21654898452e8b7b22e8499fb25e61b53220cd03de6221f01910848"
    )
  ]
)
    