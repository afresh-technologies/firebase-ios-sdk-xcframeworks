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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppAuth.xcframework.zip",
      checksum: "01e32ff3ebc03c7e21ef98d3748dc383bd461099b2f9e3f845a637ad14c0af26"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppCheckCore.xcframework.zip",
      checksum: "0a9b3b8bacac1428fa5e53180bbd03459c60c736d18b0ca5a06bec4ba26b5f97"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FBLPromises.xcframework.zip",
      checksum: "87d26eee79b445215bd24392b503331c29f744a8dd97d6d8c342b179801ef742"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "d8be02286b22fda82a7c6b3aad5cbdb5b54eedab10e5ae448ccf995332ab89e0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "439a506f2f31e8e44cfe1ae6a3ebac993b55bcf6365939f94f46b2ef67da68ae"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "7b9b7b6209690ad4977bd7fc3b6835a3e78e75b7d186467c5feb79c5ec31b0ea"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ffeb2ca0148e6073a2c57a32f01d788a9da3dae3c3d93bf136576e57d864b17b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "591e399531988f5173cb5dfa7201bb88fa3f70e137b2f9b3e0fc13272178184a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a32e060d848cf9cff0e5b67e36207f3b63dd34901e656078e5ee0a37421c93ae"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "228131b990be902e92e7916411bfa107df3e9fff734469cdfb2c932fcccc1e3d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f617682d77f81aa44533e8e6156cfc202c834d071b9f671bf91cf2b51371eaad"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCore.xcframework.zip",
      checksum: "1b5957ff22324ffee0ee199be30ff77600a4d6a0aaf9a5179df8769369925aef"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "fad668724f8ec7028aaaad3c904e1942029e30b665830936dac6c7a7e93474a8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9147cf99726fa16f85a5da98089fcdd08e0d5ff73dff74b17c14c7063820c516"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3da48bbfeafb2d5fade9055f4f2aa9fe6a9c4fede77d2ffad927745cb8624e59"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "13193a4b702edbc33c6d36005cc287c27c35de44228e7d8222b1d636dfc1037b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "795271726293b35321c87a28bf32c973a1d8331fba2151a434d5c34a3f8c4296"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "49b56d74ebe0cad17f09556697bad0453afb9202e73fc1ace4554dedbbfc2f03"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "70b58167339562b570b605c6a31db34913aeb51d8fc2e7d19760d6af9a993b3f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "adaa4279276679b5e133fa3f03024d40c6da312f59d39168e16fd9c745185977"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "385ef297c6614f99f379bb51c0041f2ae86ad0d149db10a9fa81d28c2f30d72f"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "17ef63c0ae6961611a5fdbbb1f9a360d9adb6803e4b6aa99948a3694abf746d5"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "df79e661866d7e0218db6157ec15eafe9c942dcd3fdc69cf585dfc0fe0f7d70f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "93c2d3012b2a6091f048af4dc30c60cd6c76719036513dc7f09a04523b102819"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c1a213b9f7db755e82a3315d37718145e9ea1f2b5fa2648ae66653530d923786"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "a7d5700677e6f494cc533fb4a960736c70f0d97341073654674da9b98986780d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8d74dd0ad46110f536be5ef1ae6f4b41d45985e8cf985f371d1181e068634542"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "e499635658f5bb674e220079586d691a337052c4a0cc9e25d87374e778fdd207"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "4263dc235109c886756028315bc4b250cca8b92ccecef88219c609eb261bc063"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e7e59a2f83c588fe8071975d0bd3f207fdbe82ed05676966d66f7aedb282fdbf"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "780547484432abf696e956d4b6e9c30d23abf611b2724de1ec8b51c008e8aa0b"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "307eaa14909c80f18101b7d7ac73632dfd00c8c01828bdcb77024442a0a054f2"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "80d9d949ef6208d982ffbd7c7501fa2154f967438022e147c35e94b4fd0246f9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "61886a68021743e6c9a105ab408315c5746ae3ffb1b89d90d1b9212c4e0df97f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f34a659c2d004be110d8dc2e354920cfa662eccc2c1164c27b963d568a96f082"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ebee40d8d9e24e1f339a85f44b37f1e69cc1acec3b8b2d5d276284ffdbf6e90b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7865f74b63243c5df80d8258699182ced86ceff45e43f4b11ba168755315cd41"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7b2a72ec23d2788daa6bcfdcd88615394933289ad97ee070876e26151c0712cd"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cad716bac97766305f30ec8fed066f6d8f35dd1057609a78496f9d6ba623918"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "7a14045cd9a6d747243b201c90bba2be04128475296851154320710c2a6b2015"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "689c090f000896f5813b0e99ac8bd419e4ffede681979191466d2445c1a95dd7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_Promises.xcframework.zip",
      checksum: "60e88fd9ea195af5653b7fd4f08fee7774f0b46a3735baec195afdd474f44486"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "9f03c78698f5e615fb47b58c0442f56c52065bb8ce4c69222d81d202d04c4569"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d7a9c6b08168534342a176ce1bfcd43690df0dba20d8ffc2b6b38cb380810b66"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7f3dc415bf1c84fe50b38c70cb3aef9275dfe35642efef1f20f60a93839f2556"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_absl.xcframework.zip",
      checksum: "2791beca497d5e250f4c8da63a3b6adb3dc21ae2debdeab2cff5368029a90441"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpc.xcframework.zip",
      checksum: "bbd8101c5f457471da4baead699a596b1f275a357867585822c2727bf0596f4e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpcpp.xcframework.zip",
      checksum: "078e5b4eaa7117253f1a2621ef95ecdd8fac044f962375838376a8e5e214dd6c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_leveldb.xcframework.zip",
      checksum: "29072ea521fd77429981369e6e418a4e8a74ba3f67dc6e20a7c279d62d31daf8"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_nanopb.xcframework.zip",
      checksum: "360c91d66fa6d59129ca176d6914fbe422154d55cb5ed8814ae33bd2b6a4fb86"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_openssl_grpc.xcframework.zip",
      checksum: "b4cb36555b290c16ca2b00a5d754735f806e45c154ca6b4a65b81a4dc930299c"
    )
  ]
)
    