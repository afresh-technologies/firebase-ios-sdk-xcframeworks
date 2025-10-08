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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_absl.xcframework.zip",
      checksum: "c535fbb0625789464400c5e55961a84b051e417a6508db85607adfc8412d2440"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppAuth.xcframework.zip",
      checksum: "a6fa6cf14418bed583abd2488837243d68847dcdeaf95c53a4323851afcb36ea"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppCheckCore.xcframework.zip",
      checksum: "d1db74179a7e218721f1bcd541c797558bd241c7fea0fd8212977bd9605cfba3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FBLPromises.xcframework.zip",
      checksum: "60dbf1865127a04534e10fa89a8d813cf29baf24d73554b1addee19046b7f62d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c9b82cdd603f02f94f9d3a2f9eea1a87d9868fb52465e9b2f10761e0f2aeb4f8"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAI.xcframework.zip",
      checksum: "8408b2e96697c63107fde71957f74387b91b5aad03db7489bd17db4dc9f075a5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c57c0a2de69a660f5745151634ee36ec44ea30519374cc5c8962e7296464fed5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "043b822797435c20bdf41be7f6ae703bca2551fd303606450deedafe475727b2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "02c4c6663153c70acb374206903570c6ce1e6efd5bb881c82ef1e326eca85a14"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ef214ff541b3f24449df7c47bbc3c9cf3dc4df8aaf859bf518a554e9d15095f1"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "b1717f23ca6729011f1d5b0a5df4d94665997afde38e88754863f6a8672c824e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "843bb252c72ff82db12bed21a22807835f74e06c7114568845d53bfce65e5db5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCore.xcframework.zip",
      checksum: "74bc461251682844e2961508afdfbd1afbfbcda54683b0ed6c897d69d39c5f9b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "d5bb8766a27759d6c769ae3cbf93abf834d1c3f4071963a9feffafa52a52ec49"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b186360c717f51eec18c58929292f896f0da9c370ce16d2e768079545e6b0b60"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3174a119cbed4734eb91c9b6c9774a3367e3fd794361a0ab0d583ce628a9a635"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5ff4e61ba48c05172ec82a576088ebd73a2f5adbf5a0b91859b9c35b697e53ce"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "884b692de0f4c8b083e000fd5a7c3487a35c57be8987f6d55e001ec4ea46e807"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "3f02c70f9c7358a2c5c2622fd9a41036d4e1945a78dcad48c8445079788f491b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "097d0463d9af0a8e6549adbe61509f053281c509084591eed2077cf589a368fa"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "29443a0920cdf0b32807a53fafd9d6694cfb49bcde0b0fa60563482481402fac"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d48dc51e45514aa797395df1bae1b99a5d5dbfa179e069ebb83033670f5c4f58"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5717ca2a963e510e982d97d8daf8ce47ec88d2e492c01638be7c4cab1c375b6f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "171cb5e80cd2630c1d497737cbb612825ffaa655197c8fa187b29803b7502d16"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6a0cb0d1454bf2c9816510c07a31259e242d905bdcbe6dc8f3ce54f2541d1bdb"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "db2fb0dd6d07493924fb34a0b1baf61986b7b653fd25d3b00ba45370136bdaf1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4cfdd9b639b058a1da8a8dc955bd1e6ce42799b8e89de2e4eecfefa0f54c16fe"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "528aa2f7ef4e2606626fd18699352526448dec6f0d813b6e3d7007401d5eecf7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "a4fdf80cc054d9da8d4fbf2e3f2e64da40b4c035d3b0531658dcde0af93a1163"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4e8f08e007213bc58e473787ba87095bcf8c618b80b13166fd55c4544c09df4a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "5c936bd9c9c897814ef25a35b35bae4116413f87363f36d1c5c39ecb55382ea1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "72b03072eb5d14827be810ed7473804921126da4b0aab76670c7496c04ec5264"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "1b526e896f4f6381c2a203b878f1d4d08050e1cffe9ba81d0df39d05542071f1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4f54b8aac9f4feb8f4720b13566b71ae9546d9c5c7d3d1f6a361339fb9f91b7c"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "60a84a49cf47965cf1c99eef0365377345d8ed7720e552adf82b0e82ea87f57d"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "14876cf734e2b11cd3fcba644ace64d0fe3fbaba03fdad46ae31eabc8e5f8c34"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "0180d326d83321bd8107f24b1d6c1549e97f052e47fbdddebebf10ecbcce7edb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpc.xcframework.zip",
      checksum: "071b83d75d0673bb98b16fe2cccccf9102334546eb67593812191a9fe976e6ce"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpcpp.xcframework.zip",
      checksum: "a9f50ac908515ca248fc1b8dad1ed0f4c4de5315167c0d463de621aa68a02c19"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "ce059dcb8d5ae0292a71e425a04f387322034164aee093966d373b413c3d512c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b6885a11f03eba40ec5509a258f103286e1072c50ed807401c51cd1a0e85f540"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_leveldb.xcframework.zip",
      checksum: "3e4cb7980aea20573f891b4532f1a34a040c4ae0413165d291b9e46eecd6aa0d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_nanopb.xcframework.zip",
      checksum: "dab9abf2d446ccb0867a1f0b446d24cd5235b7ea6cf64c3990a4f35cfa43c656"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_openssl_grpc.xcframework.zip",
      checksum: "6f7a8c740c5e02cb675224dceab30f98c512cf20235ead94d5a054513d72392f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_Promises.xcframework.zip",
      checksum: "4033c25f3c97f9b1f92d92bb53ad3fa75fd694aaf37f59779afabf5525d4f655"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ba9adf3e446d4d0f4e3b97f5b04a2ebf0791509f8eb8c85b6a7549ddf94f2f09"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e514df58be7dd01860b63b6e087a5559beb264555b45a13a8ebcf373e3d9d86e"
    )
  ]
)
    