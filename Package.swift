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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppAuth.xcframework.zip",
      checksum: "d69f44d40a81ab097b351b56283e9993c7d4f89ca1a2b172142ce0d7c7224377"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppCheckCore.xcframework.zip",
      checksum: "32a6082330442b0f321aa509d9b7274a97641cc41406793c3a382f18eb7c3c52"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FBLPromises.xcframework.zip",
      checksum: "aeb0901ba9a890bbe2a0e093ec52e787c03080c51d579cef44f48708634a7ca4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "fed68b2abd6b95c896b17ac046f00c9ed227d0bf12c01762dc9c5814075e1bf5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "715bebe8cda4253a45ffc0087bd3eae3bd2bb01a81dde5c602a9ba190111fd19"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0ac74734b98996b54845040dd0652450519c5d5772224ea4bc1ad800ae4eb056"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "d8b8a24e8a5e9e9cdf45ad0d4993e27e023234c8dc66e5e2a24f195617c59629"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "586af76c995f7c39375efe422f8c2b7b66dc582a3c0e9b653e687c13caf34438"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "05ca182f9f35b01b33e54d176cb5b57e3bde24ae04f601964d81d04fd1194086"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "b5ed3a1310877b7d8d0e7aa115b272176d87e834176b93425269341b40da2a50"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "10dcd2893a531d5496b7bb18d159ab048ede029eb292665e47bd601c77464f04"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCore.xcframework.zip",
      checksum: "eeaefd532feb559f6c069f01b2640b679b7b52d2ac83ed945ff9466709e4950c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "757ef291eb0cbc419b10b44082c3eeb0ff20c0f498ea327bc7868b440e7be7e5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "426c0efaf6cf1e9d639c1365476305c4f8e7985f6a6488e24b2710b6ace8701b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7c7a7aace1ee848801f013a1e60072b9e82764fc3fc99fc55f58023b5f48f5ee"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5988f72e64f3e1688a8474fdb4b5bbcc90bd47fe02e5e2b47b59f804a0918c70"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "cb76dbbb369de519594f9f2a3d795105d1e8dd25b5fe1262bf738a93f8b5ab94"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "cb4e1ab716b1355222c0167f579623ae011636e35e7e5b19540bf2e57a1327e3"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ef9a23306fce740580fc971fb3286ce86c9ea9de26599410847bba0ceb856bd7"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d38cd00160be704634a03a1250d9a95ff5a9673ff15d877b82b216de594c4f63"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1d71bcb85fbd459de9a70a9a824ad4b5af5934f2d9cf8275dcb408d6ac49b3e7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1dc36a35c8ca1c1781a2d00d77b75cedefd4a695cf1de737ca0cea25fa8b457a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "7d15ba7b4e09b25dd2f7745f56df4be727862bfc6001126d6ded6816e9254485"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "cb6629d7f53df71bb450e5d1b3d0a880d9fd719013a162c4a5babd60d310447f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "12e6f04fc9fdc1300b05bc604cf2c49bca13d1d7ec513732e8e0d3e895f64d83"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "12bc3db0bc506c3ad5d404e5ea3fd0f590383e4e8ab6de25cb5eacc3164a29f4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4f34f309c04903825e11db14374e626f36342e48e0f4a8b5dd80552836402cb1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "55ec602fd3a2b307740f040dd441d68711ffb3cf9fa6f5573dbb5539c894c05c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "83b3b2834a97461fafef8db334e1af8db2993335423feee33a0057e9be372e4d"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "bd39c286e2b5e91b713412709b39ee3f5120e86c35921bbadbb6552147b36227"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "840cb8949e4c76469d30bad0c793c3d6c8b3f268fdf402e58f126872f41fd6dc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "f6168940d4384b09a0e95b4c2969ade7c7941316fd528504e94ec1e6b403c0e9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3dc6bd4c19fc9b68f5cb1d5b5a7cb351902e37c29ab7f4668abec68c43d890a4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "159d119fb0a98cbf2bf1fdd278eb114c56f854620d6d7d4a41e2feb2a0ce2a0c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "cdfe13ad80fe11a15bc579d882cee4846be71c7647aba8b5eb7a497136a1955b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "588890cbd5ce0b1aa08287e9e9844f24fc5c56289777886eb3b76a4da94ed52d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "cf3606292509758d25c4fd5a0b7bc4b203380ccc6401094187cbd2ebe1ef6780"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleMobileAds.xcframework.zip",
      checksum: "29cc347f4742d39706fa4f89660ee6c6695a4841f6792f0ae1b80f0bbb8a88b3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "8239f2b33ba3d32a3ccbdd18e69bb79f49c0144af9d255ffe54613091aece596"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "f0a635ad335629ee5f5fc896eabcab959a467c2160c4fb1a2a0502565dc3fa92"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_Promises.xcframework.zip",
      checksum: "f25c13e74b9c18c4b4b4d082d70e5d71d69981db9afacdaa4b759c62aa57db12"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "06f9939cc93a6c77ffeaa96181da9ffebcbaf054228f7f61c585436622d644ae"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0a7f74f2011ed143f33d494cde67b30cc343d346d0463ed903cdd55c75eb2c76"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "efb0329ee77e990e33fa84399f7c355be37f5593250f2608c14c3d316bdeb2e1"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_absl.xcframework.zip",
      checksum: "69763b80c632f074c4adb46c9ce629b1e49a1b8a8a6baacacf166e6a62cbb9ac"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpc.xcframework.zip",
      checksum: "8520186e4251b413cadf394984811de443b6c8b7b7122062e7777197e77639ac"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpcpp.xcframework.zip",
      checksum: "c40c966c2a2f9a57429ff521cba19c9bc7970764f921ee7761c71cac53466a2b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_leveldb.xcframework.zip",
      checksum: "809daaa6e2388dd28e995820e772e4ba23705ee2a29d1712985b6b1bf3e68642"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_nanopb.xcframework.zip",
      checksum: "ba7079769222a5129f810b41b7ddde2a39bb35f1595e9c14e88891f5f5ceb4f2"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_openssl_grpc.xcframework.zip",
      checksum: "2206c0a52cb9873d2528def2022a5ad9bd255959b35b3c551c39dbd65633e796"
    )
  ]
)
    