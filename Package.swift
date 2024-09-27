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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppAuth.xcframework.zip",
      checksum: "23b3fe0c27ce6ec9c39ee6d72ef8329b5bd20eb1aa66d6e5fac937c582c5fa11"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppCheckCore.xcframework.zip",
      checksum: "f91ae33d60bbe13a27541241def24c4ed8f73fb84da5e197f099e871f95039f4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FBLPromises.xcframework.zip",
      checksum: "c497c8f92bbb80b7dc9f4b4f7274033a6bfae77c13cd6361d4df50a0f7afc595"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "990355a7ed37559621a86d41c96b0d5cb76120d43607eae5fa06d623fc424beb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c25d4777d7dfff48e60e77b2cef1a7ff6a57b75be9d5e8774ace5586b151a04a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "fe7883140cac5c3acc40c0100e7026a87a3c5301bfb4d613d5ff4d2d86e660ac"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0367b5c2e870b8233a1e0a1f981918d8a75eba6795d3d097e4cabe043844ec29"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ea044a481db79cc22fba7443ab8616a1ae1945bf0eba27f78053f511b1359547"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "76bacc3578c4d95420e608a9d627f7a1e42f16ee3972281d7c27ebdbd8006ad5"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "147443fbd7310f27e6ef8b9fbe19911bcd4c675bd3a231034eb61768ab351c6b"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6d0b0d96e6506f714388f364c1d08044386b96b6d49652c6a8e87b662037b918"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCore.xcframework.zip",
      checksum: "ef671248e9eeb82fb1b0d2fd9623d440582fa906147b5c52eff5a6d97e903c93"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "3aed82f8776d449c425386b6f1394ed8f8479faacf47e44181b6cdc037522870"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f56a0d1f8b5154ebcff66fe965becd16a5e436af492c818750711ec3bccf1f41"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "9dd3abf1e96f088c93892fb2a3e729c46a35a83c18d2de6c9b0da83ab3a2fdf1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c7c95bc276a1e63d0c0fefd9c24d1391ecf393f7a3610c463f6e6dc83ccabf1d"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "2390ec0f2a5c105921864b759a8fba0d53113f633fdf2cf96c11fadd3956ae20"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "843da1b3263b7665182dd1a56ca7dd427db62a0ce20d10688f86681d212e21d8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e41ab6bd79760476dfc42e3df709d358f8044a39bdff40ee70d3f05d164b37df"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2bece5b6506bfbfcc3d07f7bc6ae736d1495b7422e1b3ba3e64707b71ab6d652"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e02ee9e3ca48a59451e33c169d712ec5b4e7ea03e3ce0f7b99a81ff4441d9ed4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "cfb0d5fe58be80b258b1db818e9ccaff450cffc325c5da6206703989d17fe21f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "27c3c72f717014795cb6f8191759fc7c83ea74ef430bcad0ff867e4928313fef"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "958cb3cae2807a62fd8f1ccddf5f0aa2ab020f31f762b7a4ce5b0e267182947b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "9d8cdd2ef09d615f97e49d7f6687f19e6920c1a879d7d16863086a9ae01dfad4"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "2a6cdaf59cb86178b1897ea95b57d8ab48b128b7d29b0666a4a6cc4ae6dd5597"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4e04b45952191123fa6ef5ed7388a28ea0809d2608151bc5c7b8eeeb364fa739"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4346a43d25a37e384b9ab0b4bd3719b62f14e2eda523da0c96f8750184b479ec"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "efbf389c662de9789f57ff01cace4abb52e9249c7428c48dfb1433a273ee76bb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "520643be4151aa6b62580148c854464937c1f238cdfbe49b292ca7f5fa0ac887"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "1de758a13b503dc285ec49e50539966f50c271bc1d6e9e22ce4936896f9e7604"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "a78ab6d83625d9a9eea1cf7be32aee58334b493c99d2ee1780e8887bf4916afa"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ffdf970cac7430949a451608c614f87937ab1c43f6a87e6dfb0ea0bf5f19191f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b072db3b2b5236da51c0d4dde15c58bff1b5d38b58891b2de3d6ecd2f3749aff"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "16c4aceed53967fb6b4f40b06bb234d76234c5c35bfec4f63761799a2b239e5f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0657ec053fbc70e83bb017f39dd87c8452426f2405fc59ad722e25c013b509e4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "1090e858176b95b478ad901f901e1829eecae1129a77476afebdd5f00015567b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "a90a75ce6df926fca1bb4cbe4457bc6a6ec09695a89e9716006829e69c6a4124"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "406563ca919570c6e458c57ad3cce8a70ca4b0b61dbe6173af7d0dfd6b73bf64"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "d6d3cc07ee6f0b9eb1cbc24acaa285b5e381611ac0b187ffdadcf088c01ea831"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_Promises.xcframework.zip",
      checksum: "374d743fc6ee762d9a78be5e77a7a85813b72a87484ff3d4cd61d937c13da7ab"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "356fce47a08b25ca0e4e70fe620de494e60f6f9f1e3524708f9c3275d722743a"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e996aa41e86f7067850f7bc454c8c33af9dd0cf95f20639c352ff27a85a9d7c8"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "47f06041bdb8c4de25ca98da7f42c5f10898e5a2a61e6f19788838c71d9c1ec4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_absl.xcframework.zip",
      checksum: "bc1829de8de836e4889a4dcd463c3d2d247c9555b2e59516be69e60d80e5f25a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpc.xcframework.zip",
      checksum: "24ae42e295199cf4d495f215cb8c53c582e5805bcb8d03c30183071b4ac55fda"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpcpp.xcframework.zip",
      checksum: "d6b87fc488b1f3773878603d30a84523199de80e6a15be66f4b158957a016815"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_leveldb.xcframework.zip",
      checksum: "0e9e391db3291443c396602ed63ba09a135ba9b2a762dfc875c518d6b67bff64"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_nanopb.xcframework.zip",
      checksum: "508297824ec1ef29c05ec5cde7e919938d3b94a41fa32d94d954e9bed1df79f2"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_openssl_grpc.xcframework.zip",
      checksum: "578491c8a8e2453b3f19b184c2b411d929be64412ab702cdcb747cd0ee71f33c"
    )
  ]
)
    