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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppAuth.xcframework.zip",
      checksum: "1878314cddc3966bc077a94575e7b625b286615d146adcf75401c111ad659646"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppCheckCore.xcframework.zip",
      checksum: "83fc4cdb3afca4bb6217e25047019394805683e7184268ca65da3afacad32923"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FBLPromises.xcframework.zip",
      checksum: "6e72b4dd12c47a17717c837a65cf47219e43a20b695072b1cac3a4d3e5ee82a0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "79e1bdad6c068a3a292e825ed88c46c3ee91fd4c2e3649b507b3dbbf0ad02306"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7cb1b5730ade8502b657e21fca1251040bbf20f3011394b6e30e0dd2238fe8a7"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "42077ef8bfc24b05e5a972f50e6dc13ff3d5ed28d4cbe1f9009ebfb8f944f0a5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "181f4854d82a6f961902f4eec1ca29cb7fae4e013b5b4a1e66f639feca338289"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3cc1692f23b53a4e21c9e7d033a4059a5577fae9e69160857ff32f5e42ec99e1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "86b214cd8dc4af8c22bed5c7dd0eb3a89397119abb27e45836239e3902195423"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "67256f2ff5a43c48ffd03829d9bf6952e1a157d2e3203e2d0d3b13d2591d51f9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "efdd9bdae834829c6ad8f6adc93467707f0ce37bff3942741e4121c4bc9aa911"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCore.xcframework.zip",
      checksum: "428790921eed3f070a2f0ad64f89155c11986f8858eae6df63370ad2d975699e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e4758ae494eb479c0c8c614b609a412eda27a69910813d6bd495980f731d036b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "85d691986fd7580234d2c37d16cedcb4eb04217143f217ee8396673a0c895027"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c002210ae9268ec49f372c35cb4ad3f341a012463c8780e6f642290c49d7cff3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "11f70babba5cf393763484397cc89c3fe4293937c2b96ebc44ac8ecebd211c54"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "17056ea87e08edf7e7ae6f30f996a2def644ecbbc6050dd700f02fd385362e61"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "99a6cc3ce03d36a975c1576cb2209793b7f8c82d4081a26538f20128450487bf"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "02f1ec593654466cbcc008e742f2a04ed14e4fc99691ac11ee006b61167dc73f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e98ed077acd5eddf575f9c46fd97fa8870e4b1db15051181836dda62e2b9e6bc"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "76b213d668f3e3b6e57964cd31e74c811a6df08d59d6df8b77d5b5ff78e32414"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e283b083a17a8bbde9b67775f68d5e3bdfe6b90b558cb1a5b47c2b8e10883bae"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "20a65d8a7ea34df1f7038be6776c378f0e8741196e98f87fadade58ec1ceed2e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "6b8ada58e38f4cc3952770b64db73f83a224273ded9728ad0461ac76be30e331"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5181675cc58d6c5783cf9f83db052af015c802f49d0c63e8d1b6817a4c84c5b1"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "0813c4a05f9f33e0c03360ce64049495f342bf81f895d22a84076421de769f8d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f795d117a2a5290c11b1a219a81458cabe318520c09f884214de3c929fed1851"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "649d1e808e1fe466d7e196e7f69655391b94e76987b1726003bb648e1c5d1128"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "bdbc4e219d075bd80cd9dfcd94a6ec1a32cc74594e1c1c79189cb188c2b82147"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e314aca4807de18ba21662d5ad76ca131fd02911fba935d6adb100413cda774e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "18e75ca09456ccd23a57130fe9988c216440e2bc9e573203c1e1defebaa2b685"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "9d28f86acd03a867a562b7e41c2835635c8d9a5db08980a12d91421b52b8db2f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "1bd91f84a64b6200f33606533c7ea4ddc40d4f884e48bd6d480b743dc964a803"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5c367d640d0d145dce2708b3896a90677778d4a01245156582a73acc1475f555"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "32582a5a9f3174098e934f7ff722f0cfff652c7643ab23cfb84a4c1e9feb27f8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ba23d0f04d2400cd9cfe719955f61f0e0b508fe3af77d9f9d83fac03d64ec758"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "602a4945e33da1d4093e09ed15be22b840e206e467663c23b922784d678b917f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "73b4083db4e97ac653ed887de3afd1271ad7f306919814a1e36930eb1b022bdd"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ecdc6f5e2025322586016a249ed2401dc45fb5d0b158829d49cdfe95bfafe2e1"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "46e194c2445fa8166e9411342875413c10b130c066df8cbbcb859e5f086037be"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "c7ad816af6d4caa42fa708bb98bdf70eca4aa334f190df2dd89fef62616a590f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_Promises.xcframework.zip",
      checksum: "0cbed3a0118223928c315976d7d9263aabadd0f015066cc5cae580e7fa6d0e5b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "58667f2064c98145d156b9688317f74080ebc867e289cdc736cf3e0d0c4ff266"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "2e0a4529902e0e10c8465fb8707cc7bc467fe6b076b452d17ebccee71b986d4f"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b4a50fa7d3300b038a1be301c6cd7cc5a4fb8b8c08e717015b2c5bd22b7ef726"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_absl.xcframework.zip",
      checksum: "1d1bdf772183b6b9eb9e8bf219c75f28da822e8e7d82b3cdea7ed5fd32d5152b"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpc.xcframework.zip",
      checksum: "7d3f31a510ccdae5068eecd9426c07a1dba6d665b71c78a85a3c2aa7e5e8611b"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpcpp.xcframework.zip",
      checksum: "0f9086c0014da55c6361c6d513ed3133cdf2eb1a0de77aa88f9fbfeb83d833ff"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_leveldb.xcframework.zip",
      checksum: "1b3cdd6e25bc3b30f0b2002ec62616d40f75c05b04b64788f8c848a9b3f6b429"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_nanopb.xcframework.zip",
      checksum: "18a6dbdd9c5fe7a0bdc01d981c2bf87da200b8ac9bd9fbb4121561b214b6ea5c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_openssl_grpc.xcframework.zip",
      checksum: "3ddb13263985df6e35b620623392e0b7f298c687e4a22586e51b9c8bec8e9750"
    )
  ]
)
    