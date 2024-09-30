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
      checksum: "7a42328207843c202800039a5e1d6a2046f44504c83e9cf0203277f4ac395675"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppCheckCore.xcframework.zip",
      checksum: "2d7b03f8368623bf4a720ab0d0ff5df9594369b93faecb1a0a6ce167a18203ce"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FBLPromises.xcframework.zip",
      checksum: "c67b168e51e312c9308b51388d125fe474084d3cfe40b80d6a128058bb345cc6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "dd3067452d4d61a69bc167b5ead87ba476a898c3808b1d3c51e66331adf8e258"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b5a696013efda39aba2bb116b78adff4d74c681c642dd673955a0d2b0a028d32"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "489534f735b5ac0eafd87e682c337fc88190ba231253c602c93964ac4a1a9fe0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e946dc8c686bc7df85ed4c49999ac30f7fd5acde792c350b19d35099e824cf4c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b3b9a4c34f8f79e2694855f3585de7f6273781ff1f60177524a4c3b768af773c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b428fc65eeb41041eea41cd532341f00e441cab5efe86e6669b27a3f8d1112b9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "449b8ca33c4853a751f6429b56ff93ec70fed7958e6eb0dcea08ea8abe101115"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4775a115bf2c1d562429760d438df409d06e567784f8914b23e9a0fa67dac998"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCore.xcframework.zip",
      checksum: "5ded1e51245e831e36b58b7508e353f57a597dbf6abad209c4054aa66a65ae29"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0f38127595075e3e1e7ad53c23607241093fb79d8c1edc509be086e9b1ea8c9c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1f317bb429134a626cdfa56ea82dc59aa330ea4e49ffdd093198e9c27fc59288"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "d4f840db9296573f3caa266e82df7c70efb7432c76f38a6c8c5aa8662eb1860a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "91d023d85a383e02023f53f5b2e8ed0781415036acdccd089ccbea44988af180"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "663879e318207a08517b0fb53c2d2a43728bcf9537a78beba4870244454058bb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e4759f9d291f79fe03dfa19066fbaefb6b72d85b0c6fc6de5fc36fc689143b79"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "fd168360a117a58ca8379eabd3dbe5ed156a88af98ac723a4b76ad21636d78bf"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "617bde2ac3575e1f351350cfc1c777afb01aac35941f239e8f7b64444cf23265"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fc1c67e59057fa1512bd5e580f35e30177a2135457549df15f7b5bce4d9f0326"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "548d5cf724659c8d242684876d45dc0aa11e5b9398513fca4e1993b861ade5ed"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "7292f0c15de8aa5c9c764b9b97121a0c3d7fa18b959c7998296bc60871af1d60"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "237e81e3d69091cf57630223f96e0b3a43f05431859bc305fe2a72ac299c6aa0"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "a9a865c8428ef94f809e29862c5cbad17094470e037da21dd76fa7ff475b602e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "072a559ddab70fa88ce23d448fedfdec0ba15a57a05da33052d5ded7c3a8668a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8fe6aa48883aaebe6ba2bac1d637ab6f316a42d181a66da62517788e7cfaa342"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bab88db34206775cac9fe0ee729020e9bdda4d81189476662aeb18d6a09f9980"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "d17d346dc5c9dbcb1e081f0ccb5cf6cf1e0cc1eed3a52766dfda1a57272a049e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2d994a341e9b8e02b89b10ee341e41f261beb441394ca5aa44bd2b0aa286c223"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "138dfbba92bca379e88aa0eb360fef4d95b32f4d308a331091cbb9101f6641dd"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "9d36732a4898a14b3de162c3dd840efbcc87fd825cc8e7e2fdf3e90ec1b99025"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "4f593d5b99134889cd228172c4155f4a9c465553302553b01d72d169f6e44855"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2932aeebec31779caae8af2d3c028f3c84114293d0106859b97a2c4e90b5461d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ac82fc527409b8b33b3714d3c6a31ae6902fadc60f6eb212c39e74301e1ceeae"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0657ec053fbc70e83bb017f39dd87c8452426f2405fc59ad722e25c013b509e4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "1cde7cbb573419cd77e4cd8fb13d297d145f2d7c16582983c54f51ef72a3362e"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "a90a75ce6df926fca1bb4cbe4457bc6a6ec09695a89e9716006829e69c6a4124"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "7f37a777abbccbd6dc41aba89f0754e10437e74550f010678eebb039bfbdfa7e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "8a9f6e9562bb8445f45b2c5a97a26d751d8af8b58188ec96c36076d6be05498d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_Promises.xcframework.zip",
      checksum: "1ca3c68ffe83742e2e1fd18659787442fe898838bc59f3371d7e0f4e70018bd1"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "2234a03e1cf565cee7554bd27842a787d6f9aa28d0b8978785a09538781fd7f2"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0f2de40bddb88ef700e6ecd11b6c2ef170422569c18c8bcde50eaa8f770b2d2d"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "47f06041bdb8c4de25ca98da7f42c5f10898e5a2a61e6f19788838c71d9c1ec4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_absl.xcframework.zip",
      checksum: "0698b7fb524b7be19d0ccbc74b67dc07db1fbc41a073abfacbb73c1af7ac026d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpc.xcframework.zip",
      checksum: "3c09fcf46ff83fa6d7ca63dfface5f208723b73c2c17a6a1f9c84a4e996a5a52"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpcpp.xcframework.zip",
      checksum: "cf35d1589e7b33c809bb79afc066221342d91c2dca2b13504398fa8b79520732"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_leveldb.xcframework.zip",
      checksum: "8d55c13a65bea4ea22bb5f0cc38c941f89a8453c96e89bdeb9343e7a9864558a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_nanopb.xcframework.zip",
      checksum: "3139fac3c20d428080c778adef79b8e2ca2d63e18b5268e6b72ea7d4c23109d8"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_openssl_grpc.xcframework.zip",
      checksum: "ef2664914dadd41fe00ffe933e6fb4ba2703f00dec501a7efc6fc46a6f175dff"
    )
  ]
)
    