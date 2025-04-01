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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppAuth.xcframework.zip",
      checksum: "49f1bdd4aa4556d61c2442ffabe95011baf6bcf4e41dbf5c8cc0326ef4b7f0d0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppCheckCore.xcframework.zip",
      checksum: "cc4f4a8574850d3eabd049496dfb7b9899f76c1edec7a9ef26d4f62eba34a0e9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FBLPromises.xcframework.zip",
      checksum: "57553a0370fdb41860ca062d9adb8a9a9635338d874b183cf92b2199a5e9abfe"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0a8e14d4fe13a691de1d885721c2d82538de4f139b9874ee51af09fcb67c8370"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a6eee24ee714ca2207af9f6006c90ab7d98712d627448cda492db85ad25d8146"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "52bb8513a5aabaf68f974d9608c13621f301633767123bfbe792712ba805f123"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e060c8f2477f574fc68423582ba4af0c6a66277334075795051c50fd3946f488"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "be14c2ff31c92fd20eda9359306074bc8bd470107c51c6f8482fce6ddf3e683f"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d4dcd7e8944cba2785aed66f077b32c5e732a832d79d75435999ee48185ba1ca"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "deaeffe826627654b30ae81c1bafbb99b8886d7e8c01cb8ab053d6bcd632d157"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "27ba45698a47c0a5557813fdf6f1018602c5d3dd89be67b9dd361063ef83b768"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCore.xcframework.zip",
      checksum: "2479b72f9020569c75b3c941cd17075d587add4dd631ddc3c46a009566cdf5fa"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5ebf0e2187a595d4606967db9eb2b2541c9e10c5c3ce92ca8a5bd4d0289e569d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9d3469b3306031ff933e4e256f76aac9c70a6ce310e357115e3add31ead8121a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5b141cf3e98b9fd36198dcb38e0d2ef7a0427380b70c426bcb9d588dffe39627"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8c9b6806d0f7988a017c97b1b65076ca6c357e430af055505b608ad432538e03"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "3e146d511ad6c14e17e2b32f0dafcb687c9cfb90d542931c7da1f19e1e6131bc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "60c9c80a4e626bb43f80483fb14471c4881fcb1c7f6390820694d6363cd895ec"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "cbca87b9dc6343e13e7a72421742b9f3d8430387473baaf0cf41dd75ead04721"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "93b879d9ffe9056e487774392226456ecbdac0d44eb8c2503929c7f39403b80b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a70479ca4befb5c2d30a975240a8a901a250fb28f06c196af93ab39fc5ba2a8e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1626e70d6d592ad8ebefd0dcdc06f329179b0644f691b465a79374243b6d0557"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "7cdcac015f6a4ce207aa23a48b08dd8987dc245c39e3063a2f307c1decef37f9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c0021c1991557e0ef3475b2581d5e864e521092b3362457c6f243395865f1a3e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "258dd4f1cf5382524693d6d9f4b3254d6f122f7080bbd732843b2530ab1ce12e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "d5457c8f493406b17a181f1ec10bd46c0e299111f6236629140a214db11b027c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "144ad444a05ca82405b97e14bf92ba36f27395b018a38995175cb57a71ed9629"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "e7e24e2179c3a5ed1a1aa6ed10b6ef12bdd2d37b1e57076b3446993c94b0ab84"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "9d0d7cae4f06fed39cf5c15dda1e8cfee4655adecb09e6734ee02eccb2a16ab4"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5e3c01d8de7aa969855e7c00de47a8a48e651f0b6bd1d6fd64cde1cd988a3434"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "7b8735aabd98ea320ebbf9327d5598efc798301e3e8ff4a8ae88819d380fce1e"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "cdbb6ef6a4789c18f37a39082724eae78be8e5534e55deeabe0499ec73f037cc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "828c964b2a2dd332ed108f192459ad21eb199a5e6a1306e6561e1179aae1a61e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f4beec89c7ddb2ccef95465006abcc9d2a3729303b2411a4b1e22ef50ca955f0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5db3480053db96048d045fddaa695f34cc12b6e1a074219f29c6927d2c916e07"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "bef298ddf3e2892618d5b3cee35676bacbdbec0aab4b4c56f8caee4457df2bd0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f35ba673e6600ac5d750465a7add29672ac52619f9e8638d08f2f552a33ccb89"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0a9a77a8ffa089f4c50627a39fe98b32edbcc262af48946dea65d3b37a66e000"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleMobileAds.xcframework.zip",
      checksum: "27c0bb703c7fc62074ec81bb9f39922fe74c3e9db3ba51099f1523702806e46a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "2d5b4bc5062d560bc64eaef17b95a5aabfe738fe954b9e860cbd5161b737abbe"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "82842cacfa97724db7d8d2c59da12ff0e8000296f78b84b0c7cc36f5ace31587"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_Promises.xcframework.zip",
      checksum: "80694537ac6d76575dfc717c2a4048a1b9b2ff2cbd3f617332cf505a0aa3850f"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a7526d1b742eff1d2bf48d5d4d008b571c7fb2163165b9793c2ac580fda79079"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_SwiftProtobuf.xcframework.zip",
      checksum: "3d8b353aa64e0bb2b1ff43565db20daad5a4736e4a3b2d1adf9fca4e0087b98f"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8ac229dd2e4c6f9043faa3d64591afa33e4509037f9d5c9f1f73c789883b80a4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_absl.xcframework.zip",
      checksum: "39e88aa6b38396a16e46ae833fe1e97c7b485724c70702ccd82b5280af23c4b8"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpc.xcframework.zip",
      checksum: "214e26bb96d9f00387553a94f1aa07b799e8baf84fad5dac80ad86dfa815064e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpcpp.xcframework.zip",
      checksum: "ac72a6e2f1c0d194d41faf536f199faa4eb2db88130bd6f90b08d49dc7766422"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_leveldb.xcframework.zip",
      checksum: "1f02b9ac08a359738edb82895489d9aa7710ff383f621aa571145c1a41f13d11"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_nanopb.xcframework.zip",
      checksum: "64dc240c356af30667d6656c5a892d6a483c4fc8dc231b0a0f43e3509bcd0926"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_openssl_grpc.xcframework.zip",
      checksum: "c8b48ebc14beea0b943dd7a7b137680787ce8f30491b37536979781499c69931"
    )
  ]
)
    