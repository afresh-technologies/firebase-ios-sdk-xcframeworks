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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppAuth.xcframework.zip",
      checksum: "313c2f476ba0181759bcb6def34e4da391a0a7c13cf5758e5c8b4ca8d4c65f39"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppCheckCore.xcframework.zip",
      checksum: "84d6b10e382482224f34df6e52598527582faaeede77daa367c1604fda737d03"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FBLPromises.xcframework.zip",
      checksum: "ddfe24ef21eb59cdc5842be03f158d23aed03f8bfc53266e17c913fa856c349b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "91174d808a5de46522869b1bc38fe1e73f1fa78151e8ad5518f9a067b7d78955"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "93b42679ed2d5b4b83411b788aa660fa7b930818bc95015fa94c1b89e4577375"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e279053e30d5a65bfea2818398606fb5e1b6ba717dff817f56fcf093d93ec8df"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "6b3bee79e3cfb28e8915bc5b81386a7ebb871829b19cafee0be77fa9270276d2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b691d5d2862123d396d16a4b3e0b463864e05a5dd4ced9418842b625e1d2708c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "868905bb7e3411b515aeb41a44388f9ecfb7a796e74154fe26eabf97157ae213"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "b72406543a3ce164998ec61d44058bc3e745529d682897c714e23219f9481e28"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8cd1e3dd7bc6f0781f940079fa820db337c9bf724331325da9579cc266c1b2ff"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCore.xcframework.zip",
      checksum: "4ff0584c253b454b94c5d52c597aba0db932a90fc0d385e4b920d2bf82323579"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "01ccc6c58392c37edd4529c32dc08047c17cc4c7bbea9dffee642b1dc891aeaa"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3e8577883e928c7a7cc9b7f864eb3e619a519549e7a06ba0934519c23dd36a28"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6543638c0dd62b82a11ca579f578de1be414c53b75d8f3d8de9ada9cad76b930"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3a1e0e042935f4d178be2404f7f8156655db6a6ed9790a2b184e2aa38bc70c5d"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "ed14cafb5f2654f710501685e68eb0e48166e096110b2e572083feaa4aab302e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "bdfa4b4ad6314a1408ea911db644329b703b5b82dc2fb7de242814b0942fc6b7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e75b8a524016e91bc88d66304c37f9675d02ac3a38dc97812d867688c7b078e2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "7e1746469604d022bf3e4c062d7b0bb52005bec08d980d03f8776f754fcb3eac"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e535711b7b7ce8f40e833056d80b0ec8dbaae770d9d17d3cb5b2fafc3ce9e157"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "4238b45ebbbbb159d7dba29fd6ab7ec66fbe97b6f8d869fa62a3d37fdf6d64ed"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8e30a5e53d125bd1be6a0dc0b231f23e903610727e6a4974178382eb0f4809ac"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "000ff027ab96ad385c2d8203a3f86d01d9f8cfae544ece59b41455c2beb84c58"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d871a86b8713871e69b5998704eb635a65dbbe09a09ecd8ed14b6877868ec39a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "62cff7d3b2d633a87489036571f2a726f44962988f3094fbf0d418699e0fa74f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4855d03c5b56e8e488ba850e5ba708afeea98d47f7e3a98ca1d604716cbe7e41"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c1eebfec7af84cd044b2a3b0eca9c7831fee6f5f61deef9e0c30b284a11db425"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "ca6fd234af2ba5748beb189733ecdc73afc0e774033139e84b6558b3aba703b4"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a9403139c1080d045e817d746149d64fc4fdf000c097204bc24d5caa3e1be54c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "a2655dabd05780879e6f721acf7b4b4d99fd4a94faa5495a98c659142ebd9aa4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "e1e9f85059109c2935ac32ab3de21b81aecba53d18c61daa2592b4b3677ad5ce"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "2d7043725298d33de38ae343016976bb873e7ef06310bd18307d4a8ade4d2a08"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6b5f9babb3d1e72ccc29b40a39199dc6996531ae341386f433c98341e5edc1cc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4c6aeb8f55f92cf817d44c419c5b702111174b63166aabeb6e69f824a53c2248"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7260fb8f3a8ac583a4a0de6dc0c82b14ce93875d88b69c1dd85cc6af93d6d138"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e595c04e96360d707c65f1af5da5dfa4c903b44b5f2e9cff86d45dfd53eecaaa"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4fc46e76d4ec62e4e57c5454b86d31b3c70eb1449b2922f65948a267466ee007"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "a84264fe23f2a8f7bfc73686355959a8f45afee6bea223a0c762cab15c8ebff8"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "557503f625323d72c5d3cb0b14a7751308f38992e38359f7a55776042727e151"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_Promises.xcframework.zip",
      checksum: "e250c501ef7b97dd1e781869dedf362e2591d0ae649764db4430d5c746561767"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1a2469252dea6701e66ca614f75a0c3f8b0adb8cc457a54d206e3ca892a8d87e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "28e4d52a257b459635fa4751a2ee16665ce1a1bd400bd9c24bab36fcfcfe65ad"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7c91a107aa24f4acd8a6b5dfcd06843a378411dc16b70bbc17e8b5092ed7f66e"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_absl.xcframework.zip",
      checksum: "16da0d38b1cc400bd15c4f3ac9aa26d3371b687730b28a65b0af0bdefdc7c3ee"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpc.xcframework.zip",
      checksum: "9ce724e80b1dd4a3479f27b38f90b0fb87563bc407b96f353cc2c977c34f2914"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpcpp.xcframework.zip",
      checksum: "c16b4b3c442a70ac63eacadbb03e29f029def641a08eb8b3f76e69c23cd3df3b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_leveldb.xcframework.zip",
      checksum: "e558f6e8ffefc6ba52b5a53e7593de5ffb38e3ebb5fcea3db11078e0babd774b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_nanopb.xcframework.zip",
      checksum: "843232486b315d3ecee74670f06d1aaae49cc2b55a89bffa1cc0a15c5b5f13fb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_openssl_grpc.xcframework.zip",
      checksum: "f8e2b4db5f3cb14405c9655cf76fd43477bbde05c784c506e3f5d2542dcc9dee"
    )
  ]
)
    