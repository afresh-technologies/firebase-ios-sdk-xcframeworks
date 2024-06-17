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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppAuth.xcframework.zip",
      checksum: "31d8a0e7946a36e5876d0d504062a74c5bf25e0996f80b8aad3042122350f73e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppCheckCore.xcframework.zip",
      checksum: "fa859449756c7a3b921620ee04df9bd12e2409fd7577781d295e976ffdc8bc8d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FBLPromises.xcframework.zip",
      checksum: "77457967650414ee134163a65f9012af113e0d8a8f952b381c8b82ad62d77133"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseABTesting.xcframework.zip",
      checksum: "6649950805a8c4a5cc47461954cdc429d210c4f3d27df922b7b358048ac692af"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2666ba8da0b71d22dc75696ee6b41fcb6b1f6e0c7950cfbc73039ea5aa48bce3"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3bbceea3ee2a2b4cb3ea07ac4610e2076aef69a35431ebdcea6ef3f1876d1e2d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "64afe060c0846c65d6e61b6fe10c406796a7b292c6f60adc5d557d509e98a577"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ee44767379b3957761acca7e118e90a26767f831832b4d4a40d07dbd578b206a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3730d8d200e92814ad9f6b33dc3a1d176342b766773b78d16d0a861df400865d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuth.xcframework.zip",
      checksum: "43eec49ef500536b1a3f4c81effc2b3cdc441f10c7b264488e8b4342425651c8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb871d38142dad4bc41929f4332e595b748dca5f13ab5c12fc4bba6db3f600f1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCore.xcframework.zip",
      checksum: "ae2abfc293c43841aabc88339c2bf56a7353f0907329928c864ec9f2afe7788b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "500b18a45bbb04f6138da646bc258370359429ba5c714826f146e3195d7f59cf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "762dafacffe21903ee625b1c7877b7a5667b1a3407f17bd9c9e13e37f827b4de"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "81d07ba7caf7ca4b2ea0c5d9050801d5717b62e60156502a8a51765788957b6e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c09d79b5928498fb7e9f3720d6401dd4428a0d4ba24dfd1d85598651eec6ce45"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "962f5e95f75ba57a3359173a567ce604c72c1a9faaf1cf47bf72681ba1f9431d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestore.xcframework.zip",
      checksum: "19eaa7b815f4c2aa3edf3683466611f14a86b4a6619f2f60f869e2a872e45ced"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "365effbb4545ca38a315d2f3683154e22f3ddf37179ed15a930380d6bbcaae4e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9a949f60bf1e1e9dc9eca93be190d0e086ba9b015eceb8c9d2d90d28f793a9d6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fa07dfa115fe6b5d4585e9d86396bbbe10ec4fc93938a2add43df56e47962541"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInstallations.xcframework.zip",
      checksum: "cf1b98f4e261e9680fa21669d9e8db7ecb12428099210d8f2023f2452a5f2923"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "dfaea05f92694543aa8663b7f450cbbf9a5adad35e85efb970f4d2207e80216f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessaging.xcframework.zip",
      checksum: "023cbe003629533f21e54f4220af01069a102b62933b342ee46720a29b7d3acf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ee848723843e13347547bec3aad2ba92763e17b9289234f784993e57439f01a5"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebasePerformance.xcframework.zip",
      checksum: "57292a7c780cde499c55720c1626ddd9ac5ae2743027ba6488919e7901042012"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b88739856632d08c8db67e5771600b20ce9f520ecd4fb5354b2220f1850b4076"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "11f4f133df4d5355e36f30b106374000b7c5d5818e655cc576d65df337f18ce1"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSessions.xcframework.zip",
      checksum: "8d8948b59349b80a27eec1f50573ce762ccf4bd070782ec6d172c04d7ffa58ef"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5362f8e2c445b177477b2af299daed46bf9bd74ef47abd2b1c06ff86b9e80717"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseStorage.xcframework.zip",
      checksum: "7b5c3dfb3fd17e96e84fd2cee31834722aff1579b6d889aef3eadb76c5cffbcf"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMAppAuth.xcframework.zip",
      checksum: "08b45a3701e665e17fb112e92ac9a2c97da7a44668577ac0ba2f6d8efd6f9a40"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ab9cecd20421915273e93b2cc4fe56a38fc5ccee423d54e3469969998f0094bf"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cfb0d9c53c98949bf6047e7c4251c701eba489dacc9bbf3f59d86a70af2594a9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2c2aaf49c80eb927b49b79c033f599476fbdc0d8dd814b956c02dbfff90da8be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "191955a9f542acdc0b1b3dde8f211653a4ebe80dbe9e17fffca5febdfbd76f26"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleDataTransport.xcframework.zip",
      checksum: "611fe31ac00af5ef2cc9edfbdab7d295544772fd35a42d741535d8274ee81e76"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleMobileAds.xcframework.zip",
      checksum: "325fcbaeb3a484dc18a0cbb35e4cdc8a51dd1c7793ff6bd5e40d16f3aebca005"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleSignIn.xcframework.zip",
      checksum: "9e4c755eed83f5876a25230f4d1512a179990cd1f5ebe9ac0c97a2ff01dacb6e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleUtilities.xcframework.zip",
      checksum: "9fe8b880da6082f490acc8e411fe51c558d0e0591c4fe9f3654363272b9a31fb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_Promises.xcframework.zip",
      checksum: "a792802d69f63d5cf0bc7a12b2309503ce3523154d49f8e201dfd36becb81799"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_RecaptchaInterop.xcframework.zip",
      checksum: "9bb914982cb9a655b1f82ad757792540bcf18ab6201a84e15bdedfe03624c26e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_SwiftProtobuf.xcframework.zip",
      checksum: "a728ec0827ee28da13f6853850a83a113e2ec713ca28ea0c863a6de4885b135a"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "204c4c15f0150848fac880734784321ca72ba3a934932213a2dd1df82c4f2bdc"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_absl.xcframework.zip",
      checksum: "20cdae3109345e79a61c139b4f67a21ebb83d8d8086c0c8dd7bf3f6e29ef9123"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpc.xcframework.zip",
      checksum: "e9761687623e3f22f6b750c388e68a09b2ec9cf9f69120af49bd8b33210c24be"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpcpp.xcframework.zip",
      checksum: "876fe332fcd78eabaa9a6302a07d1de42032fa319c8fada9bcbd16048c41b7f6"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_leveldb.xcframework.zip",
      checksum: "08b7c342fae4dfbb5895491fbdf848d790c4fe86d1de29271ad8e25e8aefa289"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_nanopb.xcframework.zip",
      checksum: "a8d0af07e0a1a980d85304799eae596e20832a6c87e88b2f4744191440d064e9"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_openssl_grpc.xcframework.zip",
      checksum: "657f0f1eb80ec8141ad72d7b1601620bec0500d1dbeca6b45a3ba9fc2332b119"
    )
  ]
)
    