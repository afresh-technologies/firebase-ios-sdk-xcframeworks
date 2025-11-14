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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_absl.xcframework.zip",
      checksum: "741b212cb5f5e676456bee19f44013f6912b2bbe3fb2c441739c06a60d30fbde"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppAuth.xcframework.zip",
      checksum: "6416180dceea6eb356319dea094142f5b58a653b2e764917e7dcb5e63075a55f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppCheckCore.xcframework.zip",
      checksum: "111929a08ba7ad09b22766be7583e2bdd8f2eb60734c515ee983011cfaaec400"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FBLPromises.xcframework.zip",
      checksum: "39d0531f15b929a2d30e6e3844d82095e50da91e5359d9021bca087fad3ce1f0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "31de6a181ffbaf089008575788de6c0302dfed8ef24f801506450f8c5e6b5521"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAILogic.xcframework.zip",
      checksum: "80907adc29a08d490dcc5fe702fa0fd3d77f1bb329294f4563071c1cbaf92861"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "85be2e498a09440a79a95d181cb8bfc0a29d61171ea0d2349732bb15466c6610"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ad7d1764a36e68f9d721954870e97939e6d6294fd73d4db3bf71afa4b3cb5898"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "29e22178d3f8641aab845cc58542a35c5a7e5e9c82ae0ff4eba1a6c7abc2f346"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "739856cd86a55270f6fb7a33bd867d673a1c7c2c2df80e85363b4d7299ddf7cd"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "dece0315e67639e664265ce36b1f453831e718cf603ff96e0a8affd171f06117"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4f1bb20c64540b3dbd7e64612320a819bb3e132fa75063e1f4a4fd4e17ee1da2"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCore.xcframework.zip",
      checksum: "1f55915e8c90c775299405a32f0f233ff0b0d7925cbf581e293d77db22489df3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7d4e5dd15b185682478895d7e3f8d5c212f5b614796b35b18e85ef313df42702"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f956160f1ba988ee109b981889dcf395df67dd2211f26e0232c2e9b3eb7e384d"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7999e286cfaef17af369d3838d7d821f328521dca6aae6aa45c4be9777916bba"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "433eaa5c62c43a06f904f284004994055e0e0799f1885c15a07f5808454652cd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "c14c6efce76d075fc76bdbb4178c51846055e345b8870415b454942305836aa7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ccd998fcea104e436ffe3e604e9bf1042b87567da7e125f2ac10a0a7a8b66d13"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "4c157fdac9750ba43d3c1067ca924514d9ae50f0f0f5ad02ac77780b78eb0227"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "d06773f26bf0bad46cf3a773828d7811cd8135d9463d54e4e209d610cc1402c9"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "bfa0956558003b1520562713a93e07b9ec65a1df1ceda24455347b18c29f63b4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "83ed0967fe719d47b36d52b8c9cef77ed2ea0e4640e8da9d78ae9a7d50c7fcfa"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "133eb057df3357d9e19623759b85d7fced7aa7332c9c28131be95973fc4364b9"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8a6b9ad7bfba0d451448445604990fb1c0b8014a4d47424daa38df946f7a1968"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "2bbf7dd85caa4163b0d10ed4aaefb5172d50e3cfc6b174bf74500343aa9c2fab"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "073486ce3843a7293034a6f0370a8324def4be90e5c544e765209982d426e1d7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "79563df8366e9ede90f44b3c4feb84fc73c30093409657b12c18c74293e9f1bb"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "024baf7be04f67f9ae71935ecc3e5875aaa660e35c750e436e13636c865e15af"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e9a989f43a9eebda527eeb9638bf63b9bde66710900285c09dc1a8620748a129"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "40ef9777a06aa4d0745075627732ce0902d2e29aa499ba68734e67d933ad5ffc"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "03e5995250b7803db9bb23e9b93179ab05fe8a0160e051994cf6a3e725c231ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "66ff0449b00b1e63a3ced3110fc63b9ee9de0419baf0a4d8c9b2c61be5de114a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e8a4ec2623a612f5ad56f3a1f7e99a731a264daf1d0a75bafc147be1156f6f01"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f5d3b0f0819bd070fe59f96a7d7d42f2e25ba6c35eaf8fab8fdf05cf3964a0c2"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "bd65db6c5ec2278337be1af5a1f57fe19dad202f265bd753db1b310b8c469920"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "86a7d218ef6152cc4b60e13fef280c3e524fdcc4444cdda454978cdb41e29ced"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpc.xcframework.zip",
      checksum: "f97359f9e4e538193c82774c62635dddd0072780e2e37d9f09ec60a9db00c500"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpcpp.xcframework.zip",
      checksum: "8292682a7bffd33ea4efe44e5473b7983dbf4bc571a803f03e0b1e672ebdad5b"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "db901783ec23c11a2f8ebf8b081f4c5bd0b13302bb855bc289c0b81e14ba985b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "121946e38abfd30be1d301e7b11e3eb59fc783a313ac08edd75133f674cf9d72"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_leveldb.xcframework.zip",
      checksum: "c1890547e0544684cd0d4f2c15399933c21fb4ff11b80952b9a46ebfd2a375e9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_nanopb.xcframework.zip",
      checksum: "34dd38789bbab2fac529365aae3a2014dd05b26e17fc19c7ba72b62fea03529d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_openssl_grpc.xcframework.zip",
      checksum: "4cc22c524cd7929e42db9d47989f72e56edaff4d5ea9b985433c3e7dfddaf3a3"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_Promises.xcframework.zip",
      checksum: "fb8ac112bd5a277f30081f8aab6d6add1a5f87808ebeeb294287ee48178c6bf2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6ccbeab0c5d2457c8e177de38c085163ee365bca918b182402950587942226aa"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "305b55bc8fb207fa21e0e04e6e3cc3e05f5e93ab276a323579273921d6c62824"
    )
  ]
)
    