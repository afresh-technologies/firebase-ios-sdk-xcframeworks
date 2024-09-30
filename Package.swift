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
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppAuth.xcframework.zip",
      checksum: "f65be6045c99778e8ff561434b62ddf28cba9da157a97f37a2ff5abcedbfc394"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppCheckCore.xcframework.zip",
      checksum: "9dc29f58f3b1b39c7d25509807c93c6020d511aec74ee7a8888b2c307cba0a8e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FBLPromises.xcframework.zip",
      checksum: "8c62536ce5b512fd5ccb647b20640bbf5128af7e66913ca4d10dedecc82606be"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "7c147152be01f69dbec8db9bf1b28c5555a399c9adfe5efbc6ba93ad1049b101"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "477a3d52aa8c2f64f1d9c7d89e59ab61f4ca5809d83d9017c8558939b05505f9"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f4cfee208822e0666ded385690cbc912affc1a402f781e881da793207a214b1c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "927f4630357f6673d25550f8bf94fc9642741de13635cc525ccecb383afbbdfd"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d23fd34a08a2a9c0ea9b89bd71a5b67f9ef81b18dd79f8180647eb94db38b0c3"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "aff16a544c4d0f7eed97950646bb8e8f97cd1de6401f7749bb568670d9b54452"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "184ce656c1931efa5fdde47b92e58aed55ef5c6893d619aa94bbf23f07ae4b33"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b93966d73a9a66f3fe298f81fc0705f5c07341564bdfaaab37bb9f4c25ac09e9"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCore.xcframework.zip",
      checksum: "73f4dee54098c0ad0253a4460dfc8435d174ebb7c975b7de34dc8debafb2bd17"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0071a76224a10df974bbaac2e8a61582e3182d4c5d42f7c0802f694a12037187"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "832f5fc0cf1ea57fb5e7621c3c3fcfdbd52c271c1329bd2a45a3a08323aa6d96"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "842eef24890d6aa6a35666ae5e139895c5c6e2c36f5b8e41cd922faea98f70dd"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8979980b75646a5739e52a9ea430a545405eae5a7388f4f862a25224c10d69ab"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "dc56654f288cbe768ef0d875b41796046d866a4b004ca15bac61e5fbbb05cf60"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a826721cd382d55c974d98618a70c54f46c053534c3570d2081746facf13b748"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d512a75b37db7be55840bccca5e571d5d54565d7a03a72b3af2b329f707a797a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a375769ad23cec12cfcb2480c7a0c30473b2baf065b1c70e6bc7c78fa1647db5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "08543ad752139effb82cb96e90c3ff96feab9cfa1e988553d7236da619d7aeaa"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "b04639c15a9caf08e49fc66c4fe86ed73cfce8e17cc81a8ef4e32ac6b10dabcd"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "9cceb08f54ed63e57de9464d7ab27859f2fcdaf54024a4fe4a4154c397013467"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "49644a58ebd5a920b8dda09bea6fa7664207368ccd476ccfa7a484a5003bd21d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "682a2cc5c7bec73582d80a68c92aef5f50be177d21aebb2d3a2b9e2a632b92b0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "626737af101152d4fad22b1c99ff1cd5d5f09a94019964f798345c5d9baed801"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "2cdb112fe6c71473340c6274151aa5284623c444a88c6e92a8255880cf7e1070"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "41fb0eaeac3ec4b0942157417620fb0671415955f1fe4202a134731ba65656ec"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "643421d939bb40980d39641d69b718de954397d8404595c213559053b9c046b0"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a7552d9afd67ff8a05158d06e09dccffcacd1229336bac228b783eef4e001c9d"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "b76fc30b793c888a9e760eb078572528df2efb58b0735adc353f2dcd52648ae4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "a7756896967527d3c1de77a6e0cde7620222b66506e7613c4932c58ed21e176a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "de50cd0a5c71d2a3025abb1f7397383cd9fb3a79207a552479762b132bae1694"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "89e291680748f5526a03bed62281c7679ca271b820339086d6a60651e0ed287d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1bea716cdcc0433f808ea5a3d6a68f7ff663ea477c641f05234204a303091371"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7260fb8f3a8ac583a4a0de6dc0c82b14ce93875d88b69c1dd85cc6af93d6d138"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8d0c8da055b6253c960991b7b288e9906f52bf7a2e950caa12f7c69e40f59856"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4fc46e76d4ec62e4e57c5454b86d31b3c70eb1449b2922f65948a267466ee007"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "32e91609c34903b61c6afa6d43876bc7b6a9ce4634173b9a10fc7289424380b3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "3e04148365d5114eb173a9dec6bf82872c5a9863125b1b98ae070ffc64e0b876"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_Promises.xcframework.zip",
      checksum: "856db31f2e308af1684fc4ce5dd6491c80c8489af1e6828699aac3bf11c4b00c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "453688df138dcac6c112a33111d2eb9fc707be2636db7a48af98c1abd5310f3c"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ab6d45d25bbb86e7c2b50de6c77e3962c72cc42ba675813b41e66b8ea8d4ec74"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7c91a107aa24f4acd8a6b5dfcd06843a378411dc16b70bbc17e8b5092ed7f66e"
    ),
    .binaryTarget(
      name: "_absl",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_absl.xcframework.zip",
      checksum: "967d1959c5f718173975c35089c7ed7aa4dd23bab7f43d78bad72ec97b2d15a6"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpc.xcframework.zip",
      checksum: "7f6c0a1a029f75eae972d85646a82202f065d20527d0129bb45bcc200d8dbe1f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpcpp.xcframework.zip",
      checksum: "fe8ab7a8274b663a6cece65f6589020ca89bf108f95415d2c1459a18ad28a7cc"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_leveldb.xcframework.zip",
      checksum: "a2f8ae071e451ff7a457b181ce9bd5ec46464a5a7ff3f5ff7b92fe987b7aa529"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_nanopb.xcframework.zip",
      checksum: "173655665ba47f03d325a844b491eadc0470c1da502a9cd823cb92cf9c753932"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_openssl_grpc.xcframework.zip",
      checksum: "ebad9ec1418dbdeddd5149f41f46db1565548221476e5ac6cb166315fd313561"
    )
  ]
)
    