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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppAuth.xcframework.zip",
      checksum: "0626808fbe463bc50c274a745eb7ad906b16f026dbbb5131be1d6eeb59c7e3a0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppCheckCore.xcframework.zip",
      checksum: "30c7d00d606e80505662f4dd934cbebacd75102a3cba34e1e47761ef04138660"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FBLPromises.xcframework.zip",
      checksum: "6a04a271c511181f48d63bc446c7bc00e390121d18357a6d93d95e3f6a6cf690"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseABTesting.xcframework.zip",
      checksum: "fbc95c4e3098f62abe3b76f713e6104f1822113f9bbdd75ae95a40c2b4c33a31"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "bac0f0302d9f6e7db6c628e99a2f4828d1109edaa4cb06e89613395325119e26"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3e9be57153b276a47052eb04b75ae3bf5cfd4099c2404971a9c99351a05e64e0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5ad1f6bbd8fd432f5ed273d8c3e08e014de85564c6fdb3e6f8d6d7a3dd1eb1a2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "069e9dc6e48468844992c9e687031825ef3329e6b3d2f02829f29a7b768f0e07"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c72e60d59f6b338b8a6f417b7525d3814e794c09aeef227af46de7dad4002e22"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuth.xcframework.zip",
      checksum: "00670839ea555d3a8906d5fb81a346ad01df9ffd7449842b7a9a8f65313f31b1"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "2262ecb86261655671181e4519718c82495af939e6ca19a838c46d7efaafb0ab"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCore.xcframework.zip",
      checksum: "f043abb462f5ebab756b4b2ab4e1923dad91a8c69563783166809bb9f638625e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4ea6abae2640eb2b7876ab2e29eefb3f943028ab845ab46085ecace90260ad1c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3f50311e22978b0b4f315ceadf29baa8badc7129871e5ec5e60400a5a752d5be"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7daaa11a836b4d027e3298aa99484f6ddf17a508dcd68de15aa7d018bfdb25b7"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3453f5eb3ef40bebfa4a1d55d058d25be39a79c2281260f3f96cbefcf54a2ece"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "fa674dd8b840a668b40f4661d4fbd4ac9c8ee7305e32c86137f5d318d15cf158"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestore.xcframework.zip",
      checksum: "0cb0519082e408e2b053d31695d9676a4a2b91f7683931cc748d9512ea8ef440"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "2f3155df20c74a9dca1446b4487ec6719c5b5e4f11874a8289c976721f324925"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ca2a79011af5863c9b40866670040c83e2ae9500632ce5f90045730e094edd95"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "48a260898f324563ba6e83aed61501f920305aa0a89e7d10d7f7ee4b86269a01"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9ece809049ab42b0ba08b84031f6535d197e74b6b25b9105c636923b33e1e027"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a524346ce70ad9393376c42f45871e07b872feab64bdaf84879fe7a05c621f5d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessaging.xcframework.zip",
      checksum: "cfb4b8279e8795a01477cc91263189cb4c05c16f796a10836321089ed9d75420"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "bdb9565624b1ee1b3495bb96d439a2313742a5cc5173c7f17bd1812510f40a68"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebasePerformance.xcframework.zip",
      checksum: "80f6087a9564053bc99156e67aae44d29ce417526982077e4fa2310cf5ce8355"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "cdbd477598caa873970c9a7d661242955ef9078db932ac679017787e69348315"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "493b44826f10edb3249291bb3a128a6c5c3000ceace005ff71ea3418e9a554b6"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSessions.xcframework.zip",
      checksum: "b0dc2c299c0f2504f3b78bd96691bd1973d9e22d26ec604ff6c4485a841953c3"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a9e7c89fe5d7a88caca9af964fed249555cc2cbbdb2c5af7016a6720d053123f"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseStorage.xcframework.zip",
      checksum: "bfa0932893010935f8660e42e7649f856b7956d036c09c8743a3eee16bd0997a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMAppAuth.xcframework.zip",
      checksum: "37f52637f906cacdf1634ef2e7356fc33fca4a7cb76b7ac248e48db458bea0b1"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "dfa3f1a7e5995260fa090a10b7340f25864e7e82529f94a1662b62cc65316c1f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "adf1031838d4d0831c4781e5a49d0f4dc8545e82ab657245293baf7f78591221"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3d593b774a7edd122489a83e64eb84ddca65562b5fe0bdc38a8f5c28c95169ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "bf14056153f790f1624eb476a7ff6522b9c55b2672cc35811469360b87aca16d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8710b5e2d7f378ddcdaee64d463b62a75483ced8b87cecbbb314dd50511c8ae6"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ef18a0385bea0a7a45bc7fc1b3ffb66195fb0e35362d4a9f102282ddca306352"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleSignIn.xcframework.zip",
      checksum: "687a9bbe5dee7cebea9a6eb5a9c59f2b58bca18f1c3948a13772350aefef3cd1"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleUtilities.xcframework.zip",
      checksum: "fb1a7ce67cdbbda4fc66d303ef4299600769bc38aed074322cde8e9495cbc8f4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_Promises.xcframework.zip",
      checksum: "2060d0efe27c3b0818f1aeac2e76a103834586c0ce549959cfce41023a091922"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1092f901b882da4d603cc6b8d91b249be1db1dae37ed57e12bf663baf970a2cd"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_SwiftProtobuf.xcframework.zip",
      checksum: "20718923e8bea3eb8fabc00ae527bc2d02cb224de88f089e43a528942e2279af"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "1b13c9a5f897f76b2a1a2c1361c350cc5d07bff249f57b39ded9bfe84af26ee0"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_absl.xcframework.zip",
      checksum: "7477c9bc024702ea3803187bc9453b2e3a0f9df2d8b95998369156df49605a09"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpc.xcframework.zip",
      checksum: "7867a9cd2b030e422876146fa9c34293c5e63c3f21b84b06009ce6cf98cd7522"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpcpp.xcframework.zip",
      checksum: "9b100645ab86bf3b9c321c1ba52a8a84a658046384c7e9fcd118f426ae357223"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_leveldb.xcframework.zip",
      checksum: "b153946f70b27ef515255194c529c4b39c5644b5db0ec965ba2d0ecbf7210cc2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_nanopb.xcframework.zip",
      checksum: "24666481114fbc0871c2c319c39186a0f0c21557007504a99a1c2c0380851acc"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_openssl_grpc.xcframework.zip",
      checksum: "cf701b71d97f9df635985b5fcb8ba3a6bbc7a47bc16736854a6e315b8d3a957e"
    )
  ]
)
    