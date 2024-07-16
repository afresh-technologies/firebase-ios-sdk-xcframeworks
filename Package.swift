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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppAuth.xcframework.zip",
      checksum: "ba017c5ff5fd13582e45a4ab3516e40574183a8853ecdab6600f8e27a05f6f14"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppCheckCore.xcframework.zip",
      checksum: "d676d70387b265f9bbee218472bf68095c06d926d9c3147c8132b84b29a95f33"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FBLPromises.xcframework.zip",
      checksum: "92298db2d439b5888b61b178b6a77918ca25a1364e91bf316f1fbda58ec80a45"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5744944104da266374a4921d6b1695e03910e5061cb4d5f2ea8f61f3533a1bf8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c06b45fe4b7da57babb9989fe83631053e80daf535c2d15bf2b8c485cfb77043"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b1c917e03533009724005b05a80412be0ebae710443d512f095e0cb4e82e265f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c5c54e0a24d06ac2c7c20a8df33f70caaf4a9791b57173c08eefd515de5d5f2e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d9ae031895526387f710f184bc2d69aaaad31e69689cfe25e4068e599a7c79cb"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "52f6d7e0f9d6266e45753333a752d6866be8e62390d01e3e398da8d8dbb6a187"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuth.xcframework.zip",
      checksum: "f7ab861847d8b3da981d5168b6cb1c6952e6616f534b24520368ef2296492cdc"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4b911538b7691164ea0a6c8ac58ee125ebc5d038ad4710e91d24c803c05ca70e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCore.xcframework.zip",
      checksum: "c10c3175edb9764d90ecd21acbb4e56e83ab729783cab12cd1e9992387b6fbd1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4d8b44e969583e4bae2e5afe9270e5d69d895be7a7f8327f9d4dc0edc07017d7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9d041811f351f34653a3fd5a8de798ddf41f88939ba963a064d30b4165847f36"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c6180394f5acc27f9bc31fa278e006fb5ea6a7411d329385df10f6eb1a7971be"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDatabase.xcframework.zip",
      checksum: "1867a065a4445838675c494eca207a0e12b611f693fdb173f3b671e2e71dde75"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "df5ac7cb419e8c6b9865c302749b6f454d67a529b656f47e437c8df5faa9a60e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestore.xcframework.zip",
      checksum: "60e6eb8d611c60f81dda49f87e7ac49f7300b2b3896103e7c631a49f24c2b721"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "00c4b824b97b23f6ec37b0e30e66c21d7dfd3a39c3957f93785caf206844f89c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d092ef9fafcc249233f4d5be7cdb1e9ebca0f312b547f283f4fdf1c4b9024c19"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f538e98695cc8437e6915743b50d0d10d85bbc481e7689f5264d139c3a664d9c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInstallations.xcframework.zip",
      checksum: "bbf7e4b2942e1c9d17a9e122cad9ec2616e750e437db586384f79163cdbf1976"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4b21a2a21c73697066a07c89e640d22ba59aba9b974966a3bb5204ed7dc47a0a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1e6b4397b03b0ed5eae7a2b7ee42cf50e2359ea8914545fd3882eef3ca141876"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0e2680e9d0748075facf7774f9258954d1ffca8c762156c7ebdc12d81b7e8e9a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebasePerformance.xcframework.zip",
      checksum: "636fa436bf2db2799c5268f30eaf7eb1d7a38357d3580897281b09e3dd56ade7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e9c8a665cd910dad1e80745bffe7aeb2bd9c039227721068d8df7f3cedbfd173"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "fac854892f3f5690b5f406229f46d1540daac357ef3308038516157eb3cb2d8c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSessions.xcframework.zip",
      checksum: "bd5fe1ea7470a87425bcab95df62e099ce07ecd3e9af6a3a27af24e5f621e4ed"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "8fdca2b1bb7fe91096c07dc18a5f572979a24a5cbee172378222948e432e5609"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseStorage.xcframework.zip",
      checksum: "1ed16c437855ea5795cec2516589759b7473ae18d35bbfa7579d999ce02a8194"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMAppAuth.xcframework.zip",
      checksum: "eaf5755bfe78eca3349abd23efb35511f68d7219141a9fb51db4d39ef1b9af0b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3964740936e3d7d0b05482785ea493a34c16a68d601620b0ff07e56d80a06d51"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b6ff5ebbf4bf4959aaecce08f9d2db9d4a74b762b9f3c993a7b2c51a5d748770"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "9ff8967dad81b416efb5196c6f18f178dc66697c50bab3afd3d1a9099c84c497"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "bf14056153f790f1624eb476a7ff6522b9c55b2672cc35811469360b87aca16d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d1b365c0cf5e2bd05411ab880dd839b9be5c57df824f026637cb710e8b783a28"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ef18a0385bea0a7a45bc7fc1b3ffb66195fb0e35362d4a9f102282ddca306352"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleSignIn.xcframework.zip",
      checksum: "1a04509b1b7a9348d6e2f12fc3f55e54878c0986943db3848170db7d86c0c5e4"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleUtilities.xcframework.zip",
      checksum: "538373d8ab3558fb6a049449f5b0b1bba6074aab75320a843a6717494a005562"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_Promises.xcframework.zip",
      checksum: "c1e5d183f2fd1377a9664ee2eb749bd0e7ba4770fd1641eb36702d4c513ea979"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3cb2c755c1cc88dfa6697c1b387ea24b379c5806974e9a53568c5be91d7c5e4b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_SwiftProtobuf.xcframework.zip",
      checksum: "a2ce8a73404c3c67fb525677e46635fcc66a8f9f795d7df2e9e6968895e88cd6"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "1b13c9a5f897f76b2a1a2c1361c350cc5d07bff249f57b39ded9bfe84af26ee0"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_absl.xcframework.zip",
      checksum: "a0c6d79fc9268402e2964d0bedfebed14a6c26af0fe07cefb7f1c39a568a08ef"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpc.xcframework.zip",
      checksum: "7f884ffd52ce48e443a3a52db244bf275e4ad9b1b2e261d67e6bfd7fcd42598b"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpcpp.xcframework.zip",
      checksum: "b2b0ba18958bf15727c5adcbecf7331ee1bfb426e8c7d5d7f7ba9357e4ce02b3"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_leveldb.xcframework.zip",
      checksum: "e89c6dfeb7044ca58e3634d6115b9cabad282c825a9cf006a8908a116d74ccfd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_nanopb.xcframework.zip",
      checksum: "9b2beae69e81b99c009361fe6ead4a1686770670c7253794756ba0ca66fa037b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_openssl_grpc.xcframework.zip",
      checksum: "a9bfd98a1acabc8845de76831153454d0693d841a3c4c693ea2f4da129fa8387"
    )
  ]
)
    