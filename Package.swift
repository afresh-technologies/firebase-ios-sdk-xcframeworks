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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
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
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_absl.xcframework.zip",
      checksum: "4203db91537c02ae94479e838c69b95f826b491fd0ad87606af13c49900f7ba8"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppAuth.xcframework.zip",
      checksum: "b6fe33f8d1eeafd001a7118041152b284c92835fcc0baaa9ce4f53e05fd7b3e4"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppCheckCore.xcframework.zip",
      checksum: "918c7a6eeaf5b2966db225a893bda49c33e1fa3413dfba248738200a195bb2c3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FBLPromises.xcframework.zip",
      checksum: "8176ec26c13892e08807e2a8ca63674f40e7ffdaa768982cae46a2ebb7f8c183"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseABTesting.xcframework.zip",
      checksum: "255395e6175cb566c34a19aed29d1304bbe74a66109b27b3889470629af45a7f"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAILogic.xcframework.zip",
      checksum: "de0a147b5b770adbbaf34c05e72fe8191f66256888fd1f86d0c27df3508c38bf"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "65a464711d437d9e226799d19fa85e3c463eaa1a49e89cb8107d8faddc3da9f9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "cd17bad992667eb222d234e671fbe8690732741d5e5a388c273b3808016d090a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6fd5f6e68d43434a7d8821c75c067c24ab93dcb54c181ad5f7f4cb2d8071080b"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "47ccce0059c2218439fb67d94397d5330ca2a7607897f579d2f06b677e1a6da8"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuth.xcframework.zip",
      checksum: "0d60e29be1df00797b1f26bcd73d69a16de6b1b45d17645e8b6d2052ea25ea85"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "eeb0156f9762c82cdf883e63e62bb4c328be1f684b648a6e901863e328eebb24"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCore.xcframework.zip",
      checksum: "0058a22476d855f84862c31fefd14acec51607dad0dac9a7056b8faddb3b7308"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "9721e64d674a71075899535050bc27f7e3b4f8368d93d4a34bf2da0ed32fdd0f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "31d1b48cd9ac75bb5824a011cb99d080071b17b2838efb04b30f04bd216e5666"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "1988e6f0b66ab93266b3c6d9dc1b33fb94207c33cf414181ff4713aa64735a7d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseDatabase.xcframework.zip",
      checksum: "7c7eebb75718c8d3096ffe92648b902057eb54581452be013e103208bfbcd1ed"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestore.xcframework.zip",
      checksum: "3f753861dd540d0d1479a6bad03b88be88b379a7db1e841aacf64f51afb8d58b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f0fc5281caaec9e3754821545e84545ba787aa006d4492dccb0efbff0250c824"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFunctions.xcframework.zip",
      checksum: "fe1aeb6dacbedbb6a4158f769b448ae153b618756107cefc91fd19f0d85386f9"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1ef487f380580d091eccb24eb280e9b8efd48685c68aa018cd451bfe269546a7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInstallations.xcframework.zip",
      checksum: "b3906255d5f5439d7eb722d8d7de41f01359823fab501cd97ebb9c68a18e1641"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessaging.xcframework.zip",
      checksum: "edec3ffb99709f1a85558ff166c354b7ade52be421a3bd0562917212cbd41a81"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "afc64da31911cfef5435ca8aba94b58b7c09f6795b90ce3a7e493c0c1bd401bf"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f36835f6c9332d69d0470bf72a35cfee352f1ea655c816f00060721ab7262f86"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebasePerformance.xcframework.zip",
      checksum: "9eada1a5eb53dfeb2bfbb6ba754a53635dec1d4cebb79b54a71067ef40dbfe23"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e159e6b994bd6fcc068ecb296565ba2a214b1f0a87c6c92c98aaf98938cdf6b8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "47ed9ec0692a031252b8c15e3a952f5a6cb1a4b4e3fb7b713c92563eab1e8491"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSessions.xcframework.zip",
      checksum: "6c7b202380db6202742f005b16d0a7e155c217f40fa619b9831be7d9296b3860"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "85796e3677bacc0c5292c52c5af1405e40c906094f499e813b637ee5e84d5d45"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseStorage.xcframework.zip",
      checksum: "0ade3676406f8fff3e814018c018080d17859302b5a2f1c78654cf6cbe84632e"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "53f5409b716b436cf0b3e01ac09d92160fe853a06786ab7aeb6f97906095492e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a6e7785e9c465a424c0c09e70c3a6a3323a7159af285d71418071d0a516251ba"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7b8291c3f4fcf07e8051af3abf88a301131343e78e95f6120434e0281dcd31a2"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleDataTransport.xcframework.zip",
      checksum: "392cbc56dda2d2334eeeb2c85480b8173c985f0a97020380a7db58a576976a1c"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleSignIn.xcframework.zip",
      checksum: "e4d96e495a133f4ca7ac12352b2876b66ee5df27ff16ae951a9cdb7740a61825"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleUtilities.xcframework.zip",
      checksum: "f467ea4abd922aacfd8916938f841f3cd9a237fc376beed2bcad946f3af04dd5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpc.xcframework.zip",
      checksum: "4bdf4ff054fa470963665cd88bbf7e862a2cbcd13173efd5786faf5361fc4cfc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpcpp.xcframework.zip",
      checksum: "8e2db22df967dec1793b3284911568297c26e40ec0953c365327aa718a576cc9"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMAppAuth.xcframework.zip",
      checksum: "5654125a65dac503d4542fd010ee29565a4adb18d8df5f90c25933b16d02817f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "18958dd6e4acef7a2050e79de8515bef5bf2be2821baea333f7dfc6a4a6a010d"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_leveldb.xcframework.zip",
      checksum: "576ec50eb09d51173b5ab4ba142f881f5b079c2c2f2e5b9a8b1397cb3a6093a4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_nanopb.xcframework.zip",
      checksum: "e8bc460ea30f1a32bf8f921b4db857889fdff28af8e785859780ad1b5be97735"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_openssl_grpc.xcframework.zip",
      checksum: "84bdfa9d1c78947bd6dfbcf05e1490dbe6e26913c18efddf9e31c935508b3c1f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_Promises.xcframework.zip",
      checksum: "1c797d8a262146884fcedbbb93de263f7010f7f5ef584a616bf53f9f381f19ce"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_RecaptchaInterop.xcframework.zip",
      checksum: "4eacb3ddfd0db4087750941afd8be2dd535c979e16513b14d383eab537dc0a8d"
    )
  ]
)
    