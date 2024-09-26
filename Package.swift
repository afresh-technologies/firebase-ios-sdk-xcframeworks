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
      checksum: "79a1ee781d965889774b3a77bd02a1b49a4fa979e83c0a60388b0ca5909df9f8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppCheckCore.xcframework.zip",
      checksum: "5bcc2ddd962bce1f6b7c0921811579d23d377a21cf046b1ed06e0c29d8ad6d18"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FBLPromises.xcframework.zip",
      checksum: "3adc98481005032057c77e419a80c4ba5579acdbc711b4166962de4d3fa6c7c3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ad3823c581bec743db8eac6aa384b5a3518f47178067d1fb7ddd27c62ab744b5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4aee34c0a051977b5e58b9ef31bece96195e90a69015039b535858b426db8cb0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "af97a5b74b41cb308e7be3c0c230330e6f9f5a0eae12f4b4ef7a1cd6efe33dad"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "04cef8ca4cfd3f73f123b2138b811beadb7955fc5d03b7e0011baa5801139f0f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4a708e17c649e761c61fc5cf0ab2409438e232b6564d57a7502add0e8192f5b1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c352316edd6356a9b063272df97b16361ed142c15b346c74fdc3b0c97f45b3d4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "9bd90ec32cccd03ca60bc2bdd3e1d52a514f850196aa67fc3e4a679c7112adf2"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8801c6c6f4b4b20ba74056eaecdf9de008611f4903f66e5d2a96c557886fbf56"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCore.xcframework.zip",
      checksum: "e620b11f473bb131e7fc80abc84ebdd3d1c342be71944476692180944cb4d0c1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "78a24f3aacf1fdc9f0cab85a982bb8a510e5a4642396c9e9954ef9ebc2559a89"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "a47d05ddcb465bf715ffdaa61bd6da78c966a567561f52bb0f13fcc6b3cee380"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "57be541ebfc3a486c1f311b9b647e84c3c80d5655defd1b3ebc64bad046cc398"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "6f483bf2a9d3a3328bb24293f2415eb96c7145d18043539190f1d0b71010c028"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "457ca687ed6b7d6482dca3465ec810c212b013ce21b674b6d6edef03350d24f0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "44da894d06ce982142cff5f6b0727d4d04ea3f87920cc2ac14dcc1aa05882a5f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "61e5fe7db95aae90cab7431ced365e75b0dd3e62ac9e176013e6a43b487ff9fb"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f8c81abfe7270a6b21a76b3ff32a7c7a504018711699744c9ab5d8d12d8bb81f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6d1d1f4c478ff5c92c6d2f7d56b2bc14de2c05e363f8dc77991e3f0548a116c4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1ebbf78b26bb6ec8cb8b7942453601f997949998ffc14fbfc4b16e4649b04dce"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "bdc68e24912f110c34815fc8120e66d0728d03220e40acd42eae9e47022cac29"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "71a4b49a155bec35cb7d500b22f708e4c75f75e85ac07812b5b78389f38ae2bf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "163a889c116ad41ebaa245bb96829e7673153cd86f13c449abd02baef20885c2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "ab06eb2704cd7d6ae2b258b8606054f598d136346988b0af1ef32e3837367d04"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4b35e177744b063d3e1b04a986188d70d846fc46b0fa5fc4a2949cc6085b0e3e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f06e09d4091b43da1bf03507e41cdfc95695daec42c6023479e8952f1a65fe1f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "3bdb13501c24f49c22ccae5c49285090ff9d4beba08d59a4635c1f1251c706c7"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "262d54ddb23d2f8af33bb374fe33585dd8aeba55eb2fbbd5128066d4d69123c2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "ff2d393420d677a8d830afcffcf90c4e5dd120ae8d412bd57fe628bbfee3e9f0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "02c169e28417431509f69c9ab30f98db53ec16c13b537f15861bc1d81ae2956e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "82ca2f4a0f0fce032b8dd854cdb08daa303a9621d1be7548161ed9d36647403f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "92be5e171cf4b9ce21b99444a2a1075104f18ba2c9df908c1db2c6c5d1cff11d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0deb0df3eaf922304c5338de867fe736d92b482473e085d1cb2061d4694e27d5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0657ec053fbc70e83bb017f39dd87c8452426f2405fc59ad722e25c013b509e4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "30326c8530f5e656b5359b6d9bc9a6b093d20ee731b9e14642a0d34e48d068b5"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "a90a75ce6df926fca1bb4cbe4457bc6a6ec09695a89e9716006829e69c6a4124"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "d0ab98d1e1ea94f44effe080fd1d8d946e36e134de95a6506bcd0d96f751a785"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "c6286ba244f852fd1ebbe33323f10bef1b2e871f551d7e269bf61c7e4fdafc08"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_Promises.xcframework.zip",
      checksum: "fa0f807d20fbc9e3b3acb0cef4104b7550eb853de2632a8532984c5ec8c021c4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "311f4c0c7978b8f0492daf7d62710617f23b119809ca32e8c968d3fb97d0f06d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5979a2659538f13600f02fdb3f70af7641604274ed02df6958f05dc7c28b0f96"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "47f06041bdb8c4de25ca98da7f42c5f10898e5a2a61e6f19788838c71d9c1ec4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_absl.xcframework.zip",
      checksum: "8105c26ffbc57a7db6c3207f2b9ea9cfce70ca24ccb3e701bf868b80348bc19c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpc.xcframework.zip",
      checksum: "663cb78c9c90ec26afd50fc64425451c5dc985525100186941e2ded9b0766dfe"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpcpp.xcframework.zip",
      checksum: "6573715f7f056360dd01c933d7a83c3bcdbd5f01b8600b219dc7568f645f7f43"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_leveldb.xcframework.zip",
      checksum: "891c256e1930953af61a107e613bd2c9f0e31f74954630478feee3c4cdf8a962"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_nanopb.xcframework.zip",
      checksum: "227aa06a38b3cba1a22757e5a5b30b62d3127669fff36138ce745ebd116d814c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_openssl_grpc.xcframework.zip",
      checksum: "625f54d80197a510f8a135f7b743e495db51e183d855a34f797278ff9b6db92e"
    )
  ]
)
    