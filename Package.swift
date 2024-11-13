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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppAuth.xcframework.zip",
      checksum: "5ca9c8cbfd32d8eb7c4f42faaeeb07b264740a915b491542688c00b5ed63cf6f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppCheckCore.xcframework.zip",
      checksum: "b195233dd6a014a62e69592571b1ea626a919eed27b2de21f9300e6094243046"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FBLPromises.xcframework.zip",
      checksum: "c463e894d1247a10e13ecb3b64743e61a6a8a27e41c5c46e87efbb482ddf1fba"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "122a2eda2952632e05f5207a733a11685a73e46059a4e7cf9a55a9b370baa79f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6b3bbc55b162d4688f3b162bce1087742fdd619543d9cb1b617c934ff0cca8d8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b7a331c011612adca915a3365c636aa7decf3b2afe28618888e4b58e4cf1b53b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c391c066ba9755b907991e831e71c585b0c4bcefd999dc029f6fa6a32f796871"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0e74298d81e35934d6826b75cdd3d3e563f2ca97bdd0587fca205e92dd497e24"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "34dfdb9cc2cf7dbb916cd0ada8adf9710a714bb197c1209af84008a8aa7d6aae"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "d5679f9ef22b096ad1cec9595de8fd5c063572b2c5d9dc74d7fff1ed83f1f0b3"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8dbd7cf303b520a6b388e8499158948f6843f5e99653fc0b586db6f353d79ac1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCore.xcframework.zip",
      checksum: "2ddde34d188b1b8549e90dcad62ee017b92c90aa3fd811c8f53e00b080878966"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f317079b23f42a5807e54e86aacc3b2cda2dc38f4c0b36c68271035896213e30"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2b714251d460808c5f89e8c17d9164eea939ea32c4230ff9e2155d97d694656e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3aac8c0f71437340b589c8d1438c54b37e3515cff871cc7e3c12a524b60f426c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "764ceb65bce2e9b1cf441245d830bd2bad7980c89cd1f5dca5a55f8e121fb1b9"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "a3eb47b720766536f69d984d40faec8e781b5cb7544e3dfa3bac776afb98fe7f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "99ec1add3b170c103dc96f77ed51181f3f0d276cc6f010fb18e08a67e3144158"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "fb8054e167b51540e76b954f5f22f3c6d08adf5fde8e7631ce31322e67927c39"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "60b957a80e462357e0afca69ae82c7cdf72c228b8c839fa9cfb6a8dd6d880187"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "7a8c63fd14a67d40d5354c28a83b7e393623e2ede690af2b92dacea3492e8b59"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "303b4f8dd4bfe811fa6605aaf408843e90cdaeddef8361b6385bfdea348a25c6"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f09bb39c184a3ae840f7c56c8daebf3dba6f390db04df03865bac07785d17900"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "892c30e225855547e3766fa17239f7ec754f619cc6240112735b9efc3690fc0b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7eb3cc8377483313d2252a557011ec16a29a120d8e258ef00ba91fbef1d69805"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "d72972282c459c70a66bb4b0a1cad2dd845c4f731065175b81c8a1d1b72ba6bb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8401c0eeaab02855073523838e40b06a74e2f91850552fe55cd3f138426ad675"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4e6fb610c721e26762c923bb3805a3f9f2df4ff061cdef142956912f32e5e09d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "83b03f0486337da6fa5e84f977fa0cf9e24af00c89f2e22d9b118a06f3d2b0a1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f6da101b5b11e4494ae780228b4e79423fca5d64072d390edf2e17ffd4f6b2d9"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "aff979488aac6812f230a5b8b6f9b4aa81588e742ca787952f11ad67f02059ee"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "cd0c95d951b5e63c9eec650800d70475716bbc11be0ab2af865de0e372b554f3"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "a319c1aa2ba5ec3d23950df6b2aab5d16245ece664c689db103ea6ace0f18ae5"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1fb4ff2bc6742581c28d754d3549cb5f6fb9e4ce44c479489e91ef33c12cdd25"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cc958a6a1e0a246f1bf1068c37746aff775f4d67b19b19d7a2359abde5497dae"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d1ff8aaf5c4ecf637311fd97438831cd3628eb176107376b99ed00eb00729c1d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "460f64a7e67b0f4b77ec7c8fec493143b10d49d11d7275741bcde32edd1a2c37"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "2524344d5a681aa95acd572eff0c148aa040fb34a61290f5b23b58a720d24dfe"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3d388034fdfcaa165dc595d437bdf24d90dafe4fe54604ffebc774c29530f1dd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "358450a9c932df42c55c39a141409ecb018dead237a94fef04c324cba0117def"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "3cc00be3801fb8b2c3c9c06adb0d072c174b16d92b339ad85f7ad6f97cdbf696"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_Promises.xcframework.zip",
      checksum: "627d4e4d6e78e77f325df2f59a24ef71f3d49d7377a934a1148971ebae9c6ec5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "04743662da9f4daa61243a9b625d8d8343309459d04fc4151dad3bda661d7de4"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ab60f4068b30640d09094e24a8332153e054ea634b6cee6f272dff76d38e2f10"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "fb4805ace8883c0e3374fe36e422f7b387c3663812f2537d101ba9858be25980"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_absl.xcframework.zip",
      checksum: "c68fcb6880c60089f8669d77397fcba95869c8c406a3e3f7661dc2ae5ef48432"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpc.xcframework.zip",
      checksum: "d973d28bc09122b9c115504383c852b319c35a04783dfa231424cf95b0936b38"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpcpp.xcframework.zip",
      checksum: "e3cd2ef8493a3b2f7c3735787487a7dff3efa07f182d3ffa0cc0e45f92fa3347"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_leveldb.xcframework.zip",
      checksum: "da07b4c7894126ec489ff2473c4e56c9a23ab90059f2fe0fb4fdd469df76c782"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_nanopb.xcframework.zip",
      checksum: "b3677890ca30c68ecfb82afd4a629c982350f082d68539d2b3bd8539752030f1"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_openssl_grpc.xcframework.zip",
      checksum: "8620a72f7524ee5b58176c6f3229e2257f9b398445ccc92538da65eb4b47cb38"
    )
  ]
)
    